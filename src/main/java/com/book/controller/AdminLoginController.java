package com.book.controller;

import com.book.entity.Admin;
import com.book.service.AdminService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class AdminLoginController {
    @Autowired
    private AdminService adminService;

    /**
     * 登录成功
     * @param adminName
     * @param adminPassword
     * @param session
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/adminLogin")
    @ResponseBody
    public int adminLogin(String adminName, String adminPassword, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
        String str = adminPassword;
        String md5 = DigestUtils.md5Hex(str.getBytes("UTF-8"));
        System.out.println(md5);
        Admin admin2 = new Admin();
        admin2.setAdminName(adminName);
        admin2.setAdminPassword(md5);
        Admin admin = adminService.adminLogin(admin2);
        if (admin.getAdminName()!=null){
            session.setAttribute("admin",admin);
            System.out.println("登录成功！");
            return 1;
        }
        return 0;
    }

    /**
     * 根据admin账号查询个人信息记录
     * @param adminName
     * @return
     */
    @RequestMapping("/admin/selectByAdmin")
    @ResponseBody
    public Admin selectByAdmin(String adminName){
        Admin admin = adminService.selectByAdmin(adminName);
        return admin;
    }

    /**
     * 根据修改admin资料信息
     * @param admin
     * @param request
     * @return
     */
    @RequestMapping("/admin/updateAdmin")
    @ResponseBody
    public int updateAdmin(Admin admin,HttpServletRequest request){
        System.out.println("这里是修改控制器。");
        String realpath =  request.getServletContext().getRealPath("/img");
        //获取上传文件名字
        String fileName =admin.getMyfile().getOriginalFilename();
        System.out.println(fileName);
        //图片的全路径名（File对象）
        System.out.println("你好");
        File targetFile = new File(realpath, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
            System.out.println(targetFile+"创建成功");
        }
        System.out.println("你好");
        //要存到数据库里面的url
        String picUrl = "http://localhost:8080/img/"+fileName;
        System.out.println("访问图片的路径"+picUrl);

        try {
            //上传操作（绝对了能不能上传成功）
            admin.getMyfile().transferTo(targetFile);

        } catch (Exception e) {
            e.printStackTrace();
        }

        admin.setAdminImage(fileName);
        System.out.println("这是图片上传："+admin.getAdminImage());
        int result = adminService.updateAdmin(admin);

        return result;
    }

    /**
     * 退出登录功能
     * @param session
     * @return
     */
    @RequestMapping("/admin/exit")
    @ResponseBody
    public int exit(HttpSession session){
        session.invalidate();
        return 1;
    }

    /**
     *退到登录页面
     * @return
     */
    @RequestMapping("/exitOut")
    public String exitOut(){
        System.out.println("挂号费哈根达斯");
        return "redirect:/X-admin/adminLogin.jsp";
    }
}
