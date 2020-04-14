package com.book.service.impl;

import com.book.entity.Book;
import com.book.mapper.OrderFromMapper;
import com.book.pojo.OrderFromAssist;
import com.book.pojo.ScreenBook;
import com.book.service.OrderFromService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderFromServiceImpl implements OrderFromService {
    @Autowired
    private OrderFromMapper orderFromMapper;


    @Override
    public List<OrderFromAssist> selectAllOrder() {
        return orderFromMapper.selectAllOrder();
    }

    /**
     * 添加订单功能
     * @param orderFromAssist
     * @return
     */
    @Override
    public int addOrder(OrderFromAssist orderFromAssist) {
        int result = 0;
        try{
            result = orderFromMapper.addOrder(orderFromAssist);
            System.out.println("添加成功！");
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;
    }

    /**
     * 成功购买的功能
     * @param orderFromAssist
     * @return
     */
    @Override
    public int addBought(OrderFromAssist orderFromAssist) {
        int result=0;
        try{
            result=orderFromMapper.addBought(orderFromAssist);
            Book book = new Book();
            book.setBookId(orderFromAssist.getBookId());
            book.setBookNumber(orderFromAssist.getNumbers());
            int s = orderFromMapper.updateBookNumber(book);
            System.out.println("添加成功！");
        }catch (Exception e){
            System.out.println("事务回滚，添加失败!");
            throw new RuntimeException();
        }
        return result;
    }


    /**
     * 删除已购单信息记录
     * @param orderFromAssist
     * @return
     */
    @Override
    public int delBought(OrderFromAssist orderFromAssist) {
        int result = 0;
        try{
            result = orderFromMapper.delBought(orderFromAssist);
            System.out.println("成功删除！");
        }catch (Exception e){
            System.out.println("事务回滚，删除失败!");
            throw new RuntimeException();
        }
        return result;
    }

    /**
     * 删除购物车信息记录
     * @param orderId
     * @return
     */
    @Override
    public int delOrder(Integer orderId) {
        int result = 0;
        try{
            result = orderFromMapper.delOrder(orderId);
            System.out.println("删除成功！");
        }catch (Exception e){
            System.out.println("事务回滚，删除失败!");
            throw new RuntimeException();
        }
        return result;
    }

    /**
     * 根据用户查询购物车信息记录
     * @return
     */
    @Override
    public List<OrderFromAssist> selectOrderByUser(Integer userId) {
        List<OrderFromAssist> list = orderFromMapper.selectOrderByUser(userId);
        return list;
    }

    /**
     * 根据用户查询已购信息记录
     * @return
     */
    @Override
    public PageInfo selectBoughtByUser(ScreenBook screenBook) {
        PageHelper.startPage(screenBook.getPageNum(),screenBook.getPageSize());
        List<OrderFromAssist> list = orderFromMapper.selectBoughtByUser(screenBook);
        PageInfo<OrderFromAssist> pageInfo = new PageInfo<OrderFromAssist>(list);
        return pageInfo;
    }

    @Override
    public PageInfo selectBoughtAll(Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<OrderFromAssist> list = orderFromMapper.selectBoughtAll();
        PageInfo<OrderFromAssist> pageInfo = new PageInfo<OrderFromAssist>(list);
        return pageInfo;
    }
}
