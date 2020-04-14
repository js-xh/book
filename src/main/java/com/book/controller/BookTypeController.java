package com.book.controller;

import com.book.entity.BookType;
import com.book.service.BookTypeService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class BookTypeController {
    @Autowired
    private BookTypeService bookTypeService;
    @RequestMapping("/selectAllBookType")
    @ResponseBody
    public Map<String,Object> selectAllBookType(Integer pageNum,Integer pageSize){
        PageInfo  pageList = bookTypeService.selectAllBookType(pageNum,pageSize);
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("pageList",pageList);
//        类型的总条数
        map.put("sum",pageList.getTotal());
//        类型的总页数
        map.put("sumPage",pageList.getPages());
//        当前页数
        map.put("number",pageList.getPageNum());
        return map;
    }
    @RequestMapping("/addType")
    @ResponseBody
    public int addType(BookType bookType){
        System.out.println("前端数据："+bookType.getBookTypeName());
        bookType.setIsDelete(1);
        int result = bookTypeService.addType(bookType);
        return result;
    }
    @RequestMapping("/delType")
    @ResponseBody
    public int delType(BookType bookType){
        System.out.println("要删除的数据："+bookType.getBookTypeId());
        int redult = bookTypeService.delType(bookType);
        return redult;
    }
    @RequestMapping("/updateType")
    @ResponseBody
    public int updateType(BookType bookType){
        System.out.println("x："+bookType.getBookTypeId());
        System.out.println("x："+bookType.getBookTypeName());
        int result = bookTypeService.updateType(bookType);
        return result;
    }
}
