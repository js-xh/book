package com.book.entity;

import org.springframework.web.multipart.MultipartFile;

public class Author {

    private Integer authorId;

    private String authorName;

    private String authorImage;

    private Integer authorAge;

    private Integer authorSex;

    private String authorInto;

    private Integer isDelete;

    private String createTime;

    private MultipartFile myfile;

    public Author(){

    }

    public Author(Integer authorId, String authorName, String authorImage, Integer authorAge, Integer authorSex, String authorInto, Integer isDelete, String createTime, MultipartFile myfile) {
        this.authorId = authorId;
        this.authorName = authorName;
        this.authorImage = authorImage;
        this.authorAge = authorAge;
        this.authorSex = authorSex;
        this.authorInto = authorInto;
        this.isDelete = isDelete;
        this.createTime = createTime;
        this.myfile = myfile;
    }

    public Integer getAuthorId() {
        return authorId;
    }

    public void setAuthorId(Integer authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorImage() {
        return authorImage;
    }

    public void setAuthorImage(String authorImage) {
        this.authorImage = authorImage;
    }

    public Integer getAuthorAge() {
        return authorAge;
    }

    public void setAuthorAge(Integer authorAge) {
        this.authorAge = authorAge;
    }

    public Integer getAuthorSex() {
        return authorSex;
    }

    public void setAuthorSex(Integer authorSex) {
        this.authorSex = authorSex;
    }

    public String getAuthorInto() {
        return authorInto;
    }

    public void setAuthorInto(String authorInto) {
        this.authorInto = authorInto;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public MultipartFile getMyfile() {
        return myfile;
    }

    public void setMyfile(MultipartFile myfile) {
        this.myfile = myfile;
    }

    @Override
    public String toString() {
        return "Author{" +
                "authorId=" + authorId +
                ", authorName='" + authorName + '\'' +
                ", authorImage='" + authorImage + '\'' +
                ", authorAge=" + authorAge +
                ", authorSex=" + authorSex +
                ", authorInto='" + authorInto + '\'' +
                ", isDelete=" + isDelete +
                ", createTime='" + createTime + '\'' +
                ", myfile=" + myfile +
                '}';
    }
}
