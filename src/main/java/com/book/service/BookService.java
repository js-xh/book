package com.book.service;

import com.book.entity.Book;
import com.book.pojo.BookAssist;
import com.book.pojo.BookImage;
import com.book.pojo.ScreenBook;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface BookService {
    /**
     * 查询全部图书信息记录
     * @return
     */
    PageInfo selectAllBook(Integer pageNum, Integer pageSize);

    /**
     * 根据图书ID查询单条图书信息记录
     * @param bookId
     * @return
     */
    BookAssist selectBookById(Integer bookId);

    /**
     * 根据ID删除图书信息记录
     * @param bookId
     * @return
     */
    int deleteBook(Integer bookId);

    /**
     * 根据图书的名称模糊查询图书信息记录
     * @param screenBook
     * @return
     */
    PageInfo selectKeyword(ScreenBook screenBook);

    /**
     * 根据图书类型查询图书信息记录
     * @param screenBook
     * @return
     */
    PageInfo selectByBookTypeName(ScreenBook screenBook);


//    假接口
//    List<BookAssist> selectAllBook2();

    /**
     * 根据价格与评分筛选图书信息记录
     * @param
     * @return
     */
    PageInfo selectScreenBook(ScreenBook screenBook);



    /**
     * 根据图书的模糊查询与评分跟价格进行筛选
     * @param screenBook
     * @return
     */
    PageInfo selectScreenBookKeyword(ScreenBook screenBook);

    /**
     * 根据图书类型与评分跟价格进行筛选
     * @param screenBook
     * @return
     */
    PageInfo selectScreenBookTypeName(ScreenBook screenBook);

    /**
     * 根据图书id查询图片
     * @param bookId
     * @return
     */
    List<BookImage> selectBookImage(Integer bookId);


    /**
     * 修改图书信息
     * @param book
     * @return
     */
    int updateBook(Book book);

    /**
     * 添加图书信息记录
     * @param book
     * @return
     */
    int addBook(Book book);

}
