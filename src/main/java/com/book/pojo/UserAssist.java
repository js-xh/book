package com.book.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAssist {

    private String phone;

    private String userPassword;

    private String userTime;

    private String code;
}
