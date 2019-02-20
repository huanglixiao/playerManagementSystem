package com.example.core.service.impl;

import com.example.core.dao.UserDao;
import com.example.core.po.User;
import com.example.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 实现用户Service接口，帐号密码查询用户
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findUser(String usercode, String password) {
        User user = this.userDao.findUser(usercode,password);
        return user;
    }
}
