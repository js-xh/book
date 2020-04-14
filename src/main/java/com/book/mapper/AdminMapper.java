package com.book.mapper;

import com.book.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminMapper {

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
