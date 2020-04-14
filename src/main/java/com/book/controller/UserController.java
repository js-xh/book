package com.book.controller;

import com.book.entity.User;
import com.book.pojo.OrderFromAssist;
import com.book.pojo.UserAssist;
import com.book.service.OrderFromService;
import com.book.service.UserService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private OrderFromService orderFromService;

    @RequestMapping("/register")
    @ResponseBody()
    private Map register(User user, HttpSession session,HttpServletRequest request){
        Map<String,Object> map = new HashMap<String, Object>();
        String code = (String) session.getAttribute("verifyCodeValue");
        if (!user.getCode().equals(code)){
            String codeNo = "验证码错误";
            map.put("codeErro",codeNo);
            return  map;
        }else {
            String realpath = request.getServletContext().getRealPath("/fileUpload");
            //获取上传文件名字
            String fileName = user.getImage().getOriginalFilename();
            //图片的全路径名（File对象）
            File targetFile = new File(realpath, fileName);
            if(!targetFile.exists()){
                targetFile.mkdirs();
                System.out.println(targetFile+"创建成功");
            }
            //要存到数据库里面的url
            String picUrl = "http://localhost:8080/fileUpload/"+fileName;
            System.out.println("访问图片的路径"+picUrl);
            System.out.println(targetFile);

            try {
                //上传操作（绝定了能不能上传成功）
                user.getImage().transferTo(targetFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
            user.setUserImage(fileName);
            int result = userService.addUser(user);
            if (result==0){
                String registerYes = "注册失败，用户已经存在";
                map.put("no",registerYes);
            }
            String registerYes = "注册成功";
            map.put("yes",registerYes);
            return map;
        }
    }


    @RequestMapping("/login")
    @ResponseBody()
    public int login(UserAssist userAssist, HttpSession session) throws UnsupportedEncodingException {
        Map<String, Object> map = new HashMap<String, Object>();
        String code = (String) session.getAttribute("verifyCodeValue");
        String str = userAssist.getUserPassword();
        String md5 = DigestUtils.md5Hex(str.getBytes("UTF-8"));
        userAssist.setUserPassword(md5);
        userAssist.setUserTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
        User user = userService.userLogin(userAssist);
        userService.updateLoginTime(userAssist);
        if (userService.userLogin(userAssist) != null && userAssist.getCode().equals(code)) {
            session.setAttribute("user", user);
            return 1;
        } else if (!userAssist.getCode().equals(code)) {
            //验证码错误
            return 2;
        } else {
            //账号或者密码错误
            return 3;
        }
    }

    /**
     * 用户修改个人资料信息
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("/updateUser")
    @ResponseBody
    public int updateUser(User user, HttpServletRequest request,HttpSession session){
        String image = userService.selectUserById(user.getUserId()).getUserImage();
        if (user.getUserImage()!=null){
            user.setUserTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
            int result = userService.updateUser(user);
            session.setAttribute("user", user);
            return result;
        }else {
            String realpath =  request.getServletContext().getRealPath("/img");
            //获取上传文件名字
            String fileName =user.getImage().getOriginalFilename();
            System.out.println(fileName);
            //图片的全路径名（File对象）
            File targetFile = new File(realpath, fileName);
            if(!targetFile.exists()){
                targetFile.mkdirs();
                System.out.println(targetFile+"创建成功");
            }
            //要存到数据库里面的url
            String picUrl = "http://localhost:8080/img/"+fileName;
            System.out.println("访问图片的路径"+picUrl);
            try {
                //上传操作（绝对了能不能上传成功）
                user.getImage().transferTo(targetFile);

            } catch (Exception e) {
                e.printStackTrace();
            }
            user.setUserImage(fileName);
            System.out.println("这是图片上传："+user.getUserImage());
            user.setUserTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
            int result = userService.updateUser(user);
            user = userService.selectUserById(user.getUserId());
            session.setAttribute("user", user);
            return result;
        }


    }

    /**
     * 查询个人信息
     * @param userId
     * @return
     */
    @RequestMapping("/selectUserById")
    @ResponseBody
    public User selectUserById(Integer userId){
        User user = userService.selectUserById(userId);
        return user;
    }

    /**
     * 修改密码
     * @param user
     * @return
     */
    @RequestMapping("/updateUserPassowrd")
    @ResponseBody
    public int updatePassword(User user){
        int result = userService.updateUserPwd(user);
        return result;
    }

    @RequestMapping("/selectMyShoppingCarts")
    @ResponseBody
    public List<OrderFromAssist> selectMyShoppingCarts(Integer userId){
        List<OrderFromAssist> list = orderFromService.selectOrderByUser(userId);
        return list;
    }

    @RequestMapping("/delMyShoppingCarts")
    @ResponseBody
    public int delMyShoppingCarts(Integer orderId){
        System.out.println(orderId);
        int result = orderFromService.delOrder(orderId);
        return result;
    }



    /**
     * 退出登录功能
     * @param session
     * @return
     */
    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.invalidate();
        return "redirect:/index.jsp";
    }




}
