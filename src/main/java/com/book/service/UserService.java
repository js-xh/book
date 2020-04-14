package com.book.service;

import com.book.entity.User;
import com.book.pojo.UserAssist;

public interface UserService {
    //    用户登录判断（根据手机号码和密码查询）
    User userLogin(UserAssist userAssist);

    //修改用户登录时间
    int updateLoginTime(UserAssist userAssist);

    //    查询用户个人信息
    User selectUserById(Integer userId);

    //    修改用户资料信息
    int updateUser(User user);

    //     修改密码
    int updateUserPwd(User user);

    //    注册用户（添加一个用户）
    int addUser(User user);
}
