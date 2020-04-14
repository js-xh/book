package com.book.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Grade {
    private Integer gradeId;
    private double gradeNumber;
    private double bookId;
}
