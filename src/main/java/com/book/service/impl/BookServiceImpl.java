package com.book.service.impl;

import com.book.entity.Book;
import com.book.mapper.BookMapper;
import com.book.pojo.BookAssist;
import com.book.pojo.BookImage;
import com.book.pojo.ScreenBook;
import com.book.service.BookService;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class BookServiceImpl implements BookService {
    @Autowired
    private BookMapper bookMapper;

    /**
     * 查询所有图书分页信息记录功能
     * @return
     */
    @Override
    public PageInfo selectAllBook(Integer pageNum, Integer pageSize) {

        PageHelper.startPage(pageNum,pageSize);
        List<BookAssist> list = bookMapper.selectAllBook();
        //通过PageInfo这个类包装，可以获取分页的属性
        PageInfo<BookAssist> pageInfo = new PageInfo<BookAssist>(list);



/*        System.out.println("当前页码："+pageInfo.getPageNum());
        System.out.println("页面大小："+pageInfo.getPageSize());
        System.out.println("总记录数："+pageInfo.getTotal());
        System.out.println("是否有上一页："+pageInfo.isHasPreviousPage());
        System.out.println("是否有下一页："+pageInfo.isHasNextPage());
        System.out.println("总页面数："+pageInfo.getPages());*/

        return pageInfo;

    }

    /**
     * 根据图书的ID查询单条信息记录
     * @param bookId
     * @return
     */
    @Override
    public BookAssist selectBookById(Integer bookId) {
        return bookMapper.selectBookById(bookId);
    }

    /**
     * 删除功能
     * @param bookId
     * @return
     */
    @Override
    public int deleteBook(Integer bookId) {
        int result = 0;
        try{
            result = bookMapper.deleteBook(bookId);
            System.out.println("成功删除！");
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;
    }

    /**
     * 模糊查询分页
     * @param screenBook
     * @return
     */
    @Override
    public PageInfo selectKeyword(ScreenBook screenBook) {
        PageHelper.startPage(screenBook.getPageNum(),screenBook.getPageSize());
        List<BookAssist> list = bookMapper.selectKeyword(screenBook);
        PageInfo<BookAssist> pageInfo = new PageInfo<BookAssist>(list);
        return pageInfo;
    }

//    假接口
//    @Override
//    public List<BookAssist> selectAllBook2() {
//        return bookMapper.selectAllBook();
//    }

    /**
     * 根据图书类型分页查询
     * @param screenBook
     * @return
     */
    @Override
    public PageInfo selectByBookTypeName(ScreenBook screenBook) {
        PageHelper.startPage(screenBook.getPageNum(),screenBook.getPageSize());
        List<BookAssist> list = bookMapper.selectByBookTypeName(screenBook);
        PageInfo<BookAssist> pageInfo = new PageInfo<BookAssist>(list);
        return pageInfo;
    }

    /**
     * 根据价格与评分筛选图书信息记录
     * @param screenBook
     * @return
     */
    @Override
    public PageInfo selectScreenBook(ScreenBook screenBook) {
        PageHelper.startPage(screenBook.getPageNum(),screenBook.getPageSize());
        List<BookAssist> list = bookMapper.selectScreenBook(screenBook);
        PageInfo<BookAssist> pageInfo = new PageInfo<BookAssist>(list);
        System.out.println("service："+pageInfo);
        return pageInfo;
    }




    @Override
    public PageInfo selectScreenBookKeyword(ScreenBook screenBook) {
        PageHelper.startPage(screenBook.getPageNum(),screenBook.getPageSize());
        List<BookAssist> list = bookMapper.selectScreenBookKeyword(screenBook);
        PageInfo<BookAssist> pageInfo = new PageInfo<BookAssist>(list);
        return pageInfo;
    }

    @Override
    public PageInfo selectScreenBookTypeName(ScreenBook screenBook) {
        PageHelper.startPage(screenBook.getPageNum(),screenBook.getPageSize());
        List<BookAssist> list = bookMapper.selectScreenBookTypeName(screenBook);
        PageInfo<BookAssist> pageInfo = new PageInfo<BookAssist>(list);
        return pageInfo;
    }

    @Override
    public List<BookImage> selectBookImage(Integer bookId) {
        return bookMapper.selectBookImage(bookId);
    }

    @Override
    public int updateBook(Book book) {
        int result = 0;
        try{
            result = bookMapper.updateBook(book);
            System.out.println("修改成功！");
        }catch (Exception e){
            System.out.println("事务回滚，修改失败!");
            throw new RuntimeException();
        }
        return result;
    }

    @Override
    public int addBook(Book book) {
        int result = 0;
        try{
            result = bookMapper.addBook(book);
            System.out.println("这是添加进去的图书id："+book.getBookId());
            Book book1 = bookMapper.selectAddId(book);
            book.setBookId(book1.getBookId());
            int result2 = bookMapper.addGread(book);
            System.out.println("添加成功！");
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;
    }


}
