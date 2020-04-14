package com.book.pojo;

public class ScreenBook {
//    价格前
    private Double priceFront;
//    价格后
    private Double priceQueen;
//    评分前
    private Double gradeFront;
//    评分后
    private Double gradeQueen;

    private Integer pageNum;

    private Integer pageSize;

    private String typeName;

    private String keyword;

    public ScreenBook() {
    }

    public ScreenBook(Double priceFront, Double priceQueen, Double gradeFront, Double gradeQueen, Integer pageNum, Integer pageSize, String typeName, String keyword) {
        this.priceFront = priceFront;
        this.priceQueen = priceQueen;
        this.gradeFront = gradeFront;
        this.gradeQueen = gradeQueen;
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.typeName = typeName;
        this.keyword = keyword;
    }

    public Double getPriceFront() {
        return priceFront;
    }

    public void setPriceFront(Double priceFront) {
        this.priceFront = priceFront;
    }

    public Double getPriceQueen() {
        return priceQueen;
    }

    public void setPriceQueen(Double priceQueen) {
        this.priceQueen = priceQueen;
    }

    public Double getGradeFront() {
        return gradeFront;
    }

    public void setGradeFront(Double gradeFront) {
        this.gradeFront = gradeFront;
    }

    public Double getGradeQueen() {
        return gradeQueen;
    }

    public void setGradeQueen(Double gradeQueen) {
        this.gradeQueen = gradeQueen;
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

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "ScreenBook{" +
                "priceFront=" + priceFront +
                ", priceQueen=" + priceQueen +
                ", gradeFront=" + gradeFront +
                ", gradeQueen=" + gradeQueen +
                ", pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", typeName='" + typeName + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
