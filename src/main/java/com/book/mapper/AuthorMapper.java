package com.book.mapper;

import com.book.entity.Author;
import com.book.pojo.AuthorAssist;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AuthorMapper {
//    查询所有作者信息记录
    List<Author> selectAllAuthor();
//    模糊查询作者信息记录
    List<Author> selectByNameAuthor(AuthorAssist authorAssist);
//    查询单条作者信息记录
    Author selectByIdAuthor(Integer authorId);
//    添加作者信息记录
    int addAuthor(Author author);
//    修改作者信息记录
    int updateAuthor(Author author);
//    删除作者信息记录
    int delAuthor(Integer authorId);

}
