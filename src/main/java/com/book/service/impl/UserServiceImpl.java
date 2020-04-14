package com.book.service.impl;

import com.book.entity.User;
import com.book.mapper.UserMapper;
import com.book.pojo.UserAssist;
import com.book.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 用户登录
     * @param userAssist
     * @return
     */
    @Override
    public User userLogin(UserAssist userAssist) {
        return userMapper.userLogin(userAssist);
    }

    @Override
    public int updateLoginTime(UserAssist userAssist) {
        return userMapper.updateLoginTime(userAssist);
    }

    /**
     * 用户修改资料信息
     * @param user
     * @return
     */
    @Override
    public int updateUser(User user) {
        int result = 0;
        try{
            result = userMapper.updateUser(user);
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;
    }

    @Override
    public int updateUserPwd(User user) {
        return userMapper.updateUserPwd(user);
    }

    /**
     * 根据用户账号查询个人资料信息
     * @param userId
     * @return
     */
    @Override
    public User selectUserById(Integer userId) {
        User user = userMapper.selectUserById(userId);
        return user;
    }

    /**
     * 注册用户
     * @param user
     * @return
     */
    @Override
    public int addUser(User user) {
       if ( userMapper.userRegister(user.getUserPhone())!=null){
           return 0;
       }else {
           return userMapper.addUser(user);
       }
    }
}
