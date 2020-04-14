package com.book.service;

import com.book.entity.BookType;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface BookTypeService {
    /**
     * 查询所有图书类型
     * @return
     */
    PageInfo selectAllBookType(Integer pageNum, Integer pageSize);

    /**
     * 添加图书类型
     * @param bookType
     * @return
     */
    int addType(BookType bookType);

    /**
     * 删除图书类型数据
     * @param bookType
     * @return
     */
    int delType(BookType bookType);

    /**
     * 修改图书类型
     * @param bookType
     * @return
     */
    int updateType(BookType bookType);
}
