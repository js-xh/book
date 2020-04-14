package com.book.service;

import com.book.entity.Author;
import com.book.pojo.AuthorAssist;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface AuthorService {

    //    查询所有作者信息记录
    PageInfo selectAllAuthor(Integer pageNum, Integer pageSize);
    //    模糊查询作者信息记录
   PageInfo selectByNameAuthor(AuthorAssist authorAssist);
    //    查询单条作者信息记录
    Author selectByIdAuthor(Integer authorId);
    //    添加作者信息记录
    int addAuthor(Author author);
    //    修改作者信息记录
    int updateAuthor(Author author);
    //    删除作者信息记录
    int delAuthor(Integer authorId);
}
