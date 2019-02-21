<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>球员管理</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>/player/list.action">RUSS球员管理系统</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：${USER_SESSION.user_name}
                    </a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath }/logout.action">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>
        <!-- 左侧显示列表部分 start-->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="查询内容...">
                            <span class="input-group-btn">
							<button class="btn btn-default" type="button">
								<i class="fa fa-search" style="padding: 3px 0 3px 0;"></i>
							</button>
						</span>
                        </div>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/player/list.action" class="active">
                            <i class="fa fa-edit fa-fw"></i> 球员管理
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>
    <!-- 球员列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">球员管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/player/list.action">
                    <div class="form-group">
                        <label for="playerName">球员名称</label>
                        <input type="text" class="form-control" id="playerName"
                               value="${playerName }" name="playerName" />
                    </div>
                    <div class="form-group">
                        <label for="playerPosition">场上位置</label>
                        <select	class="form-control" id="playerPosition" name="playerPosition">
                            <option value="">--请选择--</option>
                            <c:forEach items="${positionType}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == playerPosition}">selected</c:if>>
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="playerTeam">所属球队</label>
                        <select	class="form-control" id="playerTeam"  name="playerTeam">
                            <option value="">--请选择--</option>
                            <c:forEach items="${teamType}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == playerTeam}"> selected</c:if>>
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="playerLevel">球员级别</label>
                        <select	class="form-control" id="playerLevel" name="playerLevel">
                            <option value="">--请选择--</option>
                            <c:forEach items="${levelType}" var="item">
                                <option value="${item.dict_id}"
                                        <c:if test="${item.dict_id == playerLevel}"> selected</c:if>>
                                        ${item.dict_item_name }
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <a href="#" class="btn btn-primary" data-toggle="modal"
           data-target="#newPlayerDialog" onclick="clearPlayer()">新建</a>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">球员信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>球员名称</th>
                            <th>场上位置</th>
                            <th>所属球队</th>
                            <th>球员级别</th>
                            <th>合同</th>
                            <th>选秀</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row">
                            <tr>
                                <td>${row.player_id}</td>
                                <td>${row.player_name}</td>
                                <td>${row.player_position}</td>
                                <td>${row.player_team}</td>
                                <td>${row.player_level}</td>
                                <td>${row.player_salary}</td>
                                <td>${row.player_draft}</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#playerEditDialog" onclick= "editPlayer(${row.player_id})">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs" onclick="deletePlayer(${row.player_id})">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/player/list.action" />
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 球员列表查询部分  end-->
</div>
<!-- 创建球员模态框 -->
<div class="modal fade" id="newPlayerDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModelLabel">新建球员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_player_form">
                    <div class="form-group">
                        <label for="new_playerName" class="col-sm-2 control-label">
                            球员名称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_playerName" placeholder="球员名称" name="player_name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_playerPosition" style="float:left;padding:7px 15px 0 27px;">场上位置</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_playerPosition" name="player_position">
                                <option value="">--请选择--</option>
                                <c:forEach items="${positionType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == playerPosition}">selected</c:if>>
                                            ${item.dict_item_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_playerTeam" style="float:left;padding:7px 15px 0 27px;">所属球队</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_playerTeam"  name="player_team">
                                <option value="">--请选择--</option>
                                <c:forEach items="${teamType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == playerTeam}"> selected</c:if>>
                                            ${item.dict_item_name }
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_playerLevel" style="float:left;padding:7px 15px 0 27px;">球员级别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="new_playerLevel" name="player_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == playerLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_playerSalary" class="col-sm-2 control-label">合同</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_playerSalary" placeholder="合同" name="player_salary" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_playerDraft" class="col-sm-2 control-label">选秀</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_playerDraft" placeholder="选秀" name="player_draft" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createPlayer()">创建球员</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改球员模态框 -->
<div class="modal fade" id="playerEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改球员信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_player_form">
                    <input type="hidden" id="edit_player_id" name="player_id"/>
                    <div class="form-group">
                        <label for="edit_playerName" class="col-sm-2 control-label">球员名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_playerName" placeholder="球员名称" name="player_name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_playerPosition" style="float:left;padding:7px 15px 0 27px;">场上位置</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_playerPosition" name="player_position">
                                <option value="">--请选择--</option>
                                <c:forEach items="${positionType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == playerPosition}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_playerTeam" style="float:left;padding:7px 15px 0 27px;">所属球队</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_playerTeam"  name="player_team">
                                <option value="">--请选择--</option>
                                <c:forEach items="${teamType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == playerTeam}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_playerLevel" style="float:left;padding:7px 15px 0 27px;">球员级别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_playerLevel" name="player_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == playerLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_playerSalary" class="col-sm-2 control-label">合同</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_playerSalary" placeholder="合同" name="player_salary" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_playerDraft" class="col-sm-2 control-label">选秀</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_playerDraft" placeholder="选秀" name="player_draft" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatePlayer()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
    //清空新建球员窗口中的数据
    function clearPlayer() {
        $("#new_playerName").val("");
        $("#new_playerPosition").val("")
        $("#new_playerTeam").val("")
        $("#new_playerLevel").val("")
        $("#new_playerSalary").val("");
        $("#new_playerDraft").val("");
    }
    // 创建球员
    function createPlayer() {
        $.post("<%=basePath%>player/create.action",
            $("#new_player_form").serialize(),function(data){
                if(data =="OK"){
                    alert("球员创建成功！");
                    window.location.reload();
                }else{
                    alert("球员创建失败！");
                    window.location.reload();
                }
            });
    }
    // 通过id获取修改的球员信息
    function editPlayer(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>player/getPlayerById.action",
            data:{"id":id},
            success:function(data) {
                $("#edit_player_id").val(data.player_id);
                $("#edit_playerName").val(data.player_name);
                $("#edit_playerPosition").val(data.player_position)
                $("#edit_playerTeam").val(data.player_team)
                $("#edit_playerLevel").val(data.player_level)
                $("#edit_playerSalary").val(data.player_salary);
                $("#edit_playerDraft").val(data.player_draft);
            }
        });
    }
    // 执行修改球员操作
    function updatePlayer() {
        $.post("<%=basePath%>player/update.action",$("#edit_player_form").serialize(),function(data){
            if(data =="OK"){
                alert("球员信息更新成功！");
                window.location.reload();
            }else{
                alert("球员信息更新失败！");
                window.location.reload();
            }
        });
    }
    // 删除球员
    function deletePlayer(id) {
        if(confirm('确实要删除该球员吗?')) {
            $.post("<%=basePath%>player/delete.action",{"id":id},
                function(data){
                    if(data =="OK"){
                        alert("球员删除成功！");
                        window.location.reload();
                    }else{
                        alert("删除球员失败！");
                        window.location.reload();
                    }
                });
        }
    }
</script>
</body>
</html>