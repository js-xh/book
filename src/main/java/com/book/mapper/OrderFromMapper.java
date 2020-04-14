package com.book.mapper;

import com.book.entity.Book;
import com.book.pojo.OrderFromAssist;
import com.book.pojo.ScreenBook;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface OrderFromMapper {
    //    查询所有订单信息记录
    List<OrderFromAssist> selectAllOrder();
    //    添加订单信息记录
    int addOrder(OrderFromAssist orderFromAssist);
    //    添加已购单信息记录
    int addBought(OrderFromAssist orderFromAssist);
    //    删除已购单信息记录
    int delBought(OrderFromAssist orderFromAssist);
    //    修改图书数量
    int updateBookNumber(Book book);

    //    删除购物车信息记录
    int delOrder(Integer orderId);
    //根据用户查询购物车信息记录
    List<OrderFromAssist> selectOrderByUser(Integer userId);
    //根据用户查询已购信息记录
    List<OrderFromAssist> selectBoughtByUser(ScreenBook screenBook);


    /**
     * 查询全部的已购信息记录
     * @return
     */
    List<OrderFromAssist> selectBoughtAll();

}
