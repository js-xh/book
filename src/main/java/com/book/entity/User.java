package com.book.entity;




import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Pattern;
import java.io.File;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    //用户的ID
    private int userId;
    //用户的昵称
    private String userName;
    //用户的密码
    private String userPassword;
    //用户的邮箱
    private String userEmail;
    //用户的性别
    private String userSex;
    //用户的密码（账号）
    private String userPhone;

    //图片的路径
    private String userImage;
    //用户登录时间
    private String userTime;

    //获取上传图片
    private MultipartFile image;
    //临时验证码
    private String code;
}