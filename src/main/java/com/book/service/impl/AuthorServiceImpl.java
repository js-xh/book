package com.book.service.impl;

import com.book.entity.Author;
import com.book.mapper.AuthorMapper;
import com.book.pojo.AuthorAssist;
import com.book.pojo.BookAssist;
import com.book.service.AuthorService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class AuthorServiceImpl implements AuthorService {
    @Autowired
    private AuthorMapper authorMapper;

    @Override
    public PageInfo selectAllAuthor(Integer pageNum, Integer pageSize) {

        PageHelper.startPage(pageNum,pageSize);
        List<Author> list = authorMapper.selectAllAuthor();
        //通过PageInfo这个类包装，可以获取分页的属性
        PageInfo<Author> pageInfo = new PageInfo<Author>(list);
        return pageInfo;

    }


    @Override
    public PageInfo selectByNameAuthor(AuthorAssist authorAssist) {
        PageHelper.startPage(authorAssist.getPageNum(),authorAssist.getPageSize());
        List<Author> list = authorMapper.selectByNameAuthor(authorAssist);
        PageInfo<Author> pageInfo = new PageInfo<Author>(list);
        return pageInfo;
    }

    @Override
    public Author selectByIdAuthor(Integer authorId) {
        return null;
    }

    @Override
    public int addAuthor(Author author) {
       int result = 0;
       try{
           result = authorMapper.addAuthor(author);
           System.out.println("添加成功！");
       }catch (Exception e){
           System.out.println("事务回滚，添加失败!");
           throw new RuntimeException();
       }
       return result;
    }

    @Override
    public int updateAuthor(Author author) {
        int result = 0;
        try{
            result = authorMapper.updateAuthor(author);
            System.out.println("修改成功！");
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;
    }

    @Override
    public int delAuthor(Integer authorId) {
        int result = 0;
        try{
            result = authorMapper.delAuthor(authorId);
            System.out.println("删除成功！");
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;

    }
}
