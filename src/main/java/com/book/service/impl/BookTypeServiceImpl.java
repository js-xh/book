package com.book.service.impl;

import com.book.entity.BookType;
import com.book.mapper.BookTypeMapper;
import com.book.pojo.BookAssist;
import com.book.service.BookTypeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookTypeServiceImpl implements BookTypeService {
    @Autowired
    private BookTypeMapper bookTypeMapper;
    @Override
    public PageInfo selectAllBookType(Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<BookType> list = bookTypeMapper.selectAllBookType();
        //通过PageInfo这个类包装，可以获取分页的属性
        PageInfo<BookType> pageInfo = new PageInfo<BookType>(list);
        return pageInfo;
    }

    @Override
    public int addType(BookType bookType) {
        int result=0;
        try{
            result = bookTypeMapper.addType(bookType);
            System.out.println("添加成功！");
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;
    }

    @Override
    public int delType(BookType bookType) {
        int result = 0;
        try{
            result = bookTypeMapper.delType(bookType);
            System.out.println("删除成功！");
        }catch (Exception e){
            System.out.println("事务回滚，删除失败!");
            throw new RuntimeException();
        }
        return result;
    }

    @Override
    public int updateType(BookType bookType) {
        int result = 0;
        try{
            result = bookTypeMapper.updateType(bookType);
            System.out.println("成功修改图书。");
        }catch (Exception e){
            System.out.println("事务回滚，修改失败!");
            throw new RuntimeException();
        }
        return result;
    }
}
