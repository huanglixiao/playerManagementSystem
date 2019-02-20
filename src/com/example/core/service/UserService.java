package com.example.core.service;

import com.example.core.po.User;

/**
 *  用户Service层接口，帐号密码查询
 */
public interface UserService {
    public User findUser(String usercode, String password);
}
