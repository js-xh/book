package com.book.pojo;

public class AuthorAssist {
    private String keyword;

    private Integer pageNum;

    private Integer pageSize;


    public AuthorAssist() {
    }

    public AuthorAssist(String keyword, Integer pageNum, Integer pageSize) {
        this.keyword = keyword;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    @Override
    public String toString() {
        return "AuthorAssist{" +
                "keyword='" + keyword + '\'' +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                '}';
    }
}
