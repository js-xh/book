package com.book.service;

import com.book.entity.Admin;

public interface AdminService {
    /**
     * 根据admin的账号查询admin的个人信息
     * @param adminName
     * @return
     */
    Admin selectByAdmin(String adminName);

    /**
     * admin的登录功能
     * @param admin
     * @return
     */
    Admin adminLogin(Admin admin);

    /**
     *修改admin的个人信息
     * @param admin
     * @return
     */
    int updateAdmin(Admin admin);
}
