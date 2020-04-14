package com.book.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderFromAssist {

    private Integer orderId;

    private Integer bookId;

    private Integer userId;

    private String userName;

    private String bookName;

    private String bookImage;

    private Integer numbers;

    private Double sumPrice;

    private String orderTime;

    private Integer isDelete;

    private Double bookPrice;

    private String site;

    private Integer boughtId;

}
