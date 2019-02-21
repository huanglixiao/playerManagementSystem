package com.example.core.web.controller;

import com.example.common.utils.Page;
import com.example.core.po.BaseDict;
import com.example.core.po.Player;
import com.example.core.po.User;
import com.example.core.service.BaseDictService;
import com.example.core.service.PlayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class PlayerController {

    @Autowired
    private PlayerService playerService;
    @Autowired
    private BaseDictService baseDictService;
    @Value("${player.position.type}")
    private String POSITION_TYPE;
    @Value("${player.team.type}")
    private String TEAM_TYPE;
    @Value("${player.level.type}")
    private String LEVEL_TYPE;

    /**
     *  球员列表
     */
    @RequestMapping(value = "/player/list.action")
    public String list(@RequestParam(defaultValue = "1")Integer page,
                       @RequestParam(defaultValue = "10")Integer rows,
                       String playerName, String playerPosition,
                       String playerTeam, String playerLevel, Model model){
        Page<Player> players = playerService.findPlayerList(page,rows,playerName,playerPosition,playerTeam,playerLevel);
        model.addAttribute("page",players);
        List<BaseDict> positionType = baseDictService.findBaseDictByTypeCode(POSITION_TYPE);
        List<BaseDict> teamType = baseDictService.findBaseDictByTypeCode(TEAM_TYPE);
        List<BaseDict> levelType = baseDictService.findBaseDictByTypeCode(LEVEL_TYPE);
        model.addAttribute("positionType",positionType);
        model.addAttribute("teamType",teamType);
        model.addAttribute("levelType",levelType);
        model.addAttribute("playerName",playerName);
        model.addAttribute("playerPosition",playerPosition);
        model.addAttribute("playerTeam",playerTeam);
        model.addAttribute("playerLevel",playerLevel);
        return "player";
    }

    // 创建球员
    @RequestMapping("/player/create.action")
    @ResponseBody
    public String playerCreate(Player player, HttpSession session){
        User user = (User) session.getAttribute("USER_SESSION");
        int rows = playerService.createPlayer(player);
        if (rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    // 按Id查询球员
    @RequestMapping("/player/getPlayerById.action")
    @ResponseBody
    public Player getPlayerById(Integer id){
        Player player = playerService.getPlayerById(id);
        return player;
    }

    // 更新球员信息
    @RequestMapping("/player/update.action")
    @ResponseBody
    public String playerUpdate(Player player){
        int rows = playerService.updatePlayer(player);
        if (rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }

    // 删除球员信息
    @RequestMapping("/player/delete.action")
    @ResponseBody
    public String playerDelete(Integer id){
        int rows = playerService.deletePlayer(id);
        if (rows > 0){
            return "OK";
        }else {
            return "FAIL";
        }
    }
}
