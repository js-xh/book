package com.book.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookType {

    private Integer bookTypeId;

    private String bookTypeName;
    private Integer isDelete;
}
