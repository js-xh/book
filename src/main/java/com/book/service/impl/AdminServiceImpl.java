package com.book.service.impl;

import com.book.entity.Admin;
import com.book.mapper.AdminMapper;
import com.book.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    /**
     * 根据admin的账号查询admin的个人信息记录
     * @param adminName
     * @return
     */
    @Override
    public Admin selectByAdmin(String adminName) {
        return adminMapper.selectByAdmin(adminName);
    }

    /**
     * admin登录功能
     * @param admin
     * @return
     */
    @Override
    public Admin adminLogin(Admin admin) {
        return adminMapper.adminLogin(admin);
    }

    /**
     * 修改功能
     * @param admin
     * @return
     */
    @Override
    public int updateAdmin(Admin admin) {
        int result = 0;
        try{
            result = adminMapper.updateAdmin(admin);
            System.out.println("修改成功！");
        }catch (Exception e){
            System.out.println("事务回滚，修改失败!");
            throw new RuntimeException();
        }
        return 0;
    }
}
