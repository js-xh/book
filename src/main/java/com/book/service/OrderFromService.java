package com.book.service;

import com.book.pojo.OrderFromAssist;
import com.book.pojo.ScreenBook;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface OrderFromService {

    //    查询所有订单信息记录
    List<OrderFromAssist> selectAllOrder();
    //    添加订单信息记录
    int addOrder(OrderFromAssist orderFromAssist);
    //    添加已购单信息记录
    int addBought(OrderFromAssist orderFromAssist);
    //    删除已购单信息记录
    int delBought(OrderFromAssist orderFromAssist);
    //    删除购物车信息记录
    int delOrder(Integer oederId);
    //根据用户查询购物车信息记录
    List<OrderFromAssist> selectOrderByUser(Integer userId);
    //根据用户查询已购信息记录
    PageInfo selectBoughtByUser(ScreenBook screenBook);

    /**
     * 查询全部的已购信息记录
     * @return
     */
    PageInfo selectBoughtAll(Integer pageNum, Integer pageSize);
}
