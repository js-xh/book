package com.book.pojo;


public class BookAssist {

    private Integer bookId;

    private String bookName;

    private String bookImage;

    private String bookContent;

    private double bookPrice;

    private Integer bookNumber;

    private String bookReleaseTime;

    private String authorName;

    private double gradeNumber;

    private String bookTypeName;

    private Integer bookTypeId;

    private Integer bookIsDelete;

    public BookAssist() {
    }

    public BookAssist(Integer bookId, String bookName, String bookImage, String bookContent, double bookPrice, Integer bookNumber, String bookReleaseTime, String authorName, double gradeNumber, String bookTypeName, Integer bookTypeId, Integer bookIsDelete) {
        this.bookId = bookId;
        this.bookName = bookName;
        this.bookImage = bookImage;
        this.bookContent = bookContent;
        this.bookPrice = bookPrice;
        this.bookNumber = bookNumber;
        this.bookReleaseTime = bookReleaseTime;
        this.authorName = authorName;
        this.gradeNumber = gradeNumber;
        this.bookTypeName = bookTypeName;
        this.bookTypeId = bookTypeId;
        this.bookIsDelete = bookIsDelete;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getBookImage() {
        return bookImage;
    }

    public void setBookImage(String bookImage) {
        this.bookImage = bookImage;
    }

    public String getBookContent() {
        return bookContent;
    }

    public void setBookContent(String bookContent) {
        this.bookContent = bookContent;
    }

    public double getBookPrice() {
        return bookPrice;
    }

    public void setBookPrice(double bookPrice) {
        this.bookPrice = bookPrice;
    }

    public Integer getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(Integer bookNumber) {
        this.bookNumber = bookNumber;
    }

    public String getBookReleaseTime() {
        return bookReleaseTime;
    }

    public void setBookReleaseTime(String bookReleaseTime) {
        this.bookReleaseTime = bookReleaseTime;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public double getGradeNumber() {
        return gradeNumber;
    }

    public void setGradeNumber(double gradeNumber) {
        this.gradeNumber = gradeNumber;
    }

    public String getBookTypeName() {
        return bookTypeName;
    }

    public void setBookTypeName(String bookTypeName) {
        this.bookTypeName = bookTypeName;
    }

    public Integer getBookTypeId() {
        return bookTypeId;
    }

    public void setBookTypeId(Integer bookTypeId) {
        this.bookTypeId = bookTypeId;
    }

    public Integer getBookIsDelete() {
        return bookIsDelete;
    }

    public void setBookIsDelete(Integer bookIsDelete) {
        this.bookIsDelete = bookIsDelete;
    }

    @Override
    public String toString() {
        return "BookAssist{" +
                "bookId=" + bookId +
                ", bookName='" + bookName + '\'' +
                ", bookImage='" + bookImage + '\'' +
                ", bookContent='" + bookContent + '\'' +
                ", bookPrice=" + bookPrice +
                ", bookNumber=" + bookNumber +
                ", bookReleaseTime='" + bookReleaseTime + '\'' +
                ", authorName='" + authorName + '\'' +
                ", gradeNumber=" + gradeNumber +
                ", bookTypeName='" + bookTypeName + '\'' +
                ", bookTypeId=" + bookTypeId +
                ", bookIsDelete=" + bookIsDelete +
                '}';
    }
}
