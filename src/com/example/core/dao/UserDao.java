package com.example.core.dao;

import com.example.core.po.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户DAO层接口，帐号和密码查询
 */
public interface UserDao {
    public User findUser(@Param("usercode") String usercode, @Param("password") String password);
}
