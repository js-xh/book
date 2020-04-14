package com.book.test;

import com.book.entity.Author;
import com.book.mapper.AuthorMapper;
import com.book.pojo.AuthorAssist;
import com.book.service.AuthorService;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestAuthorMapper {
    @Autowired
    private AuthorMapper authorMapper;
    @Autowired
    private AuthorService authorService;
    @Test
    public void testSelectAll(){
        List<Author> list = authorMapper.selectAllAuthor();
        for (Author author:list){
            System.out.println(author);
        }
    }
    @Test
    public void testSelectKeyword(){
        AuthorAssist authorAssist = new AuthorAssist();
        authorAssist.setKeyword("路");
        List<Author> list = authorMapper.selectByNameAuthor(authorAssist);
        for (Author author:list){
            System.out.println(author);
        }
    }
    @Test
    public void testAdd(){
        Author author = new Author();
        author.setAuthorName("路夫");
        author.setAuthorImage("略");
        author.setAuthorAge(19);
        author.setAuthorSex(1);
        author.setIsDelete(1);
        author.setAuthorInto("略");
        int result = authorMapper.addAuthor(author);
        System.out.println("成功添加"+result+"条信息。");
    }
    @Test
    public void delAuthor(){
        Integer authorId = 1;
        int result = authorService.delAuthor(authorId);
        System.out.println("成功删除"+result+"条信息。");
    }
    @Test
    public void testAll(){
        Integer pageNum = 1;
        Integer pageSize = 5;
        PageInfo list = authorService.selectAllAuthor(pageNum,pageSize);
        System.out.println(list.getList().get(0));
    }
    @Test
    public void testupte(){
        Author author = new Author();
        author.setAuthorId(10);
        author.setAuthorImage("gh");
        author.setCreateTime("2019-1-23");
        author.setAuthorAge(12);
        author.setIsDelete(1);
        author.setAuthorSex(1);
        author.setAuthorName("jkj");
        author.setAuthorInto("kjghia");
        int result = authorService.updateAuthor(author);
    }
    @Test
    public void testupte2(){
        Author author = new Author();
        author.setAuthorId(10);
        author.setAuthorImage("gh");
        author.setCreateTime("2019-1-23");
        author.setAuthorAge(12);
        author.setIsDelete(1);
        author.setAuthorSex(1);
        author.setAuthorName("jkj");
        author.setAuthorInto("kjghia");
        int result = authorMapper.updateAuthor(author);
    }
}
