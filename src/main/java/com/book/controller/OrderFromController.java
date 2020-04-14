package com.book.controller;

import com.book.pojo.OrderFromAssist;

import com.book.service.OrderFromService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OrderFromController {
    @Autowired
    private OrderFromService orderFromService;

    //    添加购物车
    @RequestMapping("/addOreder")
    @ResponseBody
    public int addOrder(OrderFromAssist orderFromAssist){ ;
        orderFromAssist.setIsDelete(1);
        System.out.println("e:"+orderFromAssist.getIsDelete());
        int result = orderFromService.addOrder(orderFromAssist);
        return result;
    }

    //添加购买订单
    @RequestMapping("/addBought")
    @ResponseBody
    public int addBought(OrderFromAssist orderFromAssist){
        orderFromAssist.setIsDelete(1);
        System.out.println(orderFromAssist);
        int result = orderFromService.addBought(orderFromAssist);
        return result;
    }




}
