package com.book.controller;

import com.book.pojo.OrderFromAssist;
import com.book.pojo.ScreenBook;
import com.book.service.OrderFromService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminOrderontrpller {
    @Autowired
    private OrderFromService orderFromService;

    /**
     * 查询全部的已购信息记录
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/selectBoughtAll")
    @ResponseBody
    public Map<String,Object> selectBoughtAll(Integer pageNum,Integer pageSize){
        Map<String,Object> map = new HashMap<String,Object>();
        System.out.println(pageNum);
        PageInfo pageList = orderFromService.selectBoughtAll(pageNum,pageSize);
        map.put("pageList",pageList);
        map.put("sum",pageList.getTotal());
        map.put("sumPage",pageList.getPages());
        map.put("number",pageList.getPageNum());
        return map;
    }
    @RequestMapping("/selectByUserName")
    @ResponseBody
    public Map<String,Object> selectByUserName(ScreenBook screenBook){
        Map<String,Object> map = new HashMap<String,Object>();

        PageInfo pageList = orderFromService.selectBoughtByUser(screenBook);
        map.put("pageList",pageList);
        map.put("sum",pageList.getTotal());
        map.put("sumPage",pageList.getPages());
        map.put("number",pageList.getPageNum());

        return map;
    }
    @RequestMapping("/delBought")
    @ResponseBody
    public int delBought(OrderFromAssist orderFromAssist){
        System.out.println("前台数据："+orderFromAssist.getBookId());
        int result = orderFromService.delBought(orderFromAssist);
        return result;
    }
}
