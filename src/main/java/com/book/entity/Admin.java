package com.book.entity;

import org.springframework.web.multipart.MultipartFile;

public class Admin {

    private Integer adminId;

    private String adminName;

    private String adminPassword;

    private String adminSex;

    private String adminPhone;

    private String adminImage;

    private MultipartFile myfile;

    public Admin() {
    }

    public Admin(Integer adminId, String adminName, String adminPassword, String adminSex, String adminPhone, String adminImage, MultipartFile myfile) {
        this.adminId = adminId;
        this.adminName = adminName;
        this.adminPassword = adminPassword;
        this.adminSex = adminSex;
        this.adminPhone = adminPhone;
        this.adminImage = adminImage;
        this.myfile = myfile;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminSex() {
        return adminSex;
    }

    public void setAdminSex(String adminSex) {
        this.adminSex = adminSex;
    }

    public String getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone;
    }

    public String getAdminImage() {
        return adminImage;
    }

    public void setAdminImage(String adminImage) {
        this.adminImage = adminImage;
    }

    public MultipartFile getMyfile() {
        return myfile;
    }

    public void setMyfile(MultipartFile myfile) {
        this.myfile = myfile;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminName='" + adminName + '\'' +
                ", adminPassword='" + adminPassword + '\'' +
                ", adminSex='" + adminSex + '\'' +
                ", adminPhone='" + adminPhone + '\'' +
                ", adminImage='" + adminImage + '\'' +
                ", myfile=" + myfile +
                '}';
    }
}
