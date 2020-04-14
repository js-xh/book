package com.book.mapper;

import com.book.entity.BookType;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BookTypeMapper {
    /**
     * 查询所有图书类型
     * @return
     */
    List<BookType> selectAllBookType();

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
