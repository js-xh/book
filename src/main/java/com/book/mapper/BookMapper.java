package com.book.mapper;

import com.book.entity.Book;
import com.book.pojo.BookAssist;
import com.book.pojo.BookImage;
import com.book.pojo.ScreenBook;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface BookMapper {

    /**
     * 查询所有图书信息记录
     * @return
     */
    List<BookAssist> selectAllBook();

    /**
     * 查询单条图书信息记录
     * @param bookId
     * @return
     */
    BookAssist selectBookById(Integer bookId);

    /**
     * 删除单条图书信息记录
     * @param bookId
     * @return
     */
    int deleteBook(Integer bookId);

    /**
     * 根据相关的文字模糊查询图书信息记录
     * @param screenBook
     * @return
     */
    List<BookAssist> selectKeyword(ScreenBook screenBook);

    /**
     * 根据图书类型查询图书的信息记录
     * @param screenBook
     * @return
     */
    List<BookAssist> selectByBookTypeName(ScreenBook screenBook);

    /**
     * 添加图书信息记录
     * @param book
     * @return
     */
    int addBook(Book book);

    /**
     * 添加图书与图书类型的关联信息记录
     * @param bookAssist
     * @return
     */
    int addBookIn(BookAssist bookAssist);

    /**
     * 根据添加进去的图书名称查询相应图书ID
     * @param bookName
     * @return
     */
    Book bookNameSS(String bookName);


    /**
     * 根据价格与评分筛选图书信息记录
     * @param
     * @return
     */
    List<BookAssist> selectScreenBook(ScreenBook screenBook);


    /**
     * 根据图书类型与评分跟价格进行筛选
     * @param screenBook
     * @return
     */
    List<BookAssist> selectScreenBookTypeName(ScreenBook screenBook);

    /**
     * 根据图书的模糊查询与评分跟价格进行筛选
     * @param screenBook
     * @return
     */
    List<BookAssist> selectScreenBookKeyword(ScreenBook screenBook);

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
     * 添加评分
     * @param book
     * @return
     */
    int addGread(Book book);

    Book selectAddId(Book book);
}
