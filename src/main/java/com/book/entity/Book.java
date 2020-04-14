package com.book.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Book {

    private Integer bookId;
    private String bookName;
    private Integer typeId;
    private String authorName;
    private String bookImage;
    private String bookContent;
    private double bookPrice;
    private Integer bookNumber;
    private Integer bookIsDelete;
    private String bookReleaseTime;
    private Double gradeNumber;
    private MultipartFile myfile;

}
