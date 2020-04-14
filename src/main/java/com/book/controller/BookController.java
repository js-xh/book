package com.book.controller;

import com.alibaba.fastjson.JSON;
import com.book.entity.Book;
import com.book.entity.User;
import com.book.pojo.BookAssist;
import com.book.pojo.BookImage;
import com.book.pojo.ScreenBook;
import com.book.pojo.UserAssist;
import com.book.service.BookService;
import com.book.service.UserService;
import com.github.pagehelper.PageInfo;
import com.sun.deploy.net.HttpResponse;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {
    @Resource
    private BookService bookService;

    /**
     * 查询单条图书信息记录、
     * model相当于request.setAttribut的请求转发到某个页面
     * 没有使用@ResponseBody注解的方法，返回的是视图的页面，使用该注解的方法返回的是json的数据格式
     * @param bookId
     * @param response
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/selectByBookId")
    public String selectByBookId(Integer bookId, HttpServletResponse response, HttpServletRequest request, Model model) {
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/html;charset=utf-8");
        System.out.println("图书ID："+bookId);
        BookAssist bookAssist = bookService.selectBookById(bookId);
        model.addAttribute("bookAssist",bookAssist);
        return "book/book-BookById";
    }

    /**
     * 图书删除功能
     * @param bookId
     * @param response
     * @return
     */
    @RequestMapping("/deleteBook")
    @ResponseBody
    public int deleteBook(Integer bookId,HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/html;charset=utf-8");
        System.out.println("删除的参数："+bookId);
        int result = bookService.deleteBook(bookId);
        return result;
    }

    /**
     * 模糊查询功能
     * @param screenBook
     * @param response
     * @return
     */
    @RequestMapping("/selectKeyword")
    public String selectKeyword(ScreenBook screenBook, HttpServletResponse response, Model model){
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/html;charset=utf-8");
        System.out.println("后台数据:"+screenBook.getKeyword());
        PageInfo  pageList = bookService.selectKeyword(screenBook);
        model.addAttribute("pageList",pageList);
        model.addAttribute("screenBook",screenBook);
        return "book/book-selectKeyword";
    }

    /**
     * 根据图书类型查询图书信息记录
     * @param screenBook
     * @param model
     * @return
     */
    @RequestMapping("/bookTypeName")
    public String selectByTypeName(ScreenBook screenBook,Model model){
        PageInfo pageList = bookService.selectByBookTypeName(screenBook);
        model.addAttribute("pageList",pageList);
        model.addAttribute("screenBook",screenBook);
        System.out.println("打印数据："+pageList.getList().get(0));
        return "book/book-bookTypeName";
    }

    /**
     * 查询所有图书信息记录
     * @param pageNum
     * @param pageSize
     * @param response
     * @return
     */
    @RequestMapping("/selectAllBook")
    @ResponseBody
    public Map<String,Object> selectAll(Integer pageNum, Integer pageSize, HttpServletResponse response){
        System.out.println("页面数："+pageNum);
        System.out.println("条数："+pageSize);
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/html;charset=utf-8");
        Map<String,Object> map = new HashMap<String, Object>();
        PageInfo list = bookService.selectAllBook(pageNum,pageSize);
        System.out.println("总条数："+list.getTotal());
        System.out.println("遍历："+list);
        //总条数
        int sum = (int) list.getTotal();
        //页面总数
        int pages = list.getPages();
        //当前页数
        int number = list.getPageNum();
        map.put("pageInfo",list);
        map.put("sum",sum);
        map.put("sumPage",pages);
        map.put("number",number);
        return map;
    }

    /**
     * 去到查询全部图书的页面
     * @return
     */
    @RequestMapping("/goSelectAll")
    public String goSelectAll(){
        return "book/book-selectLimit";
    }

    /**
     * 根据价格与评分筛选图书查询升序
     * @return
     */
    @RequestMapping("/selectScreenBookDesc")
    public String selectScreenBookDesc(ScreenBook screenBook, Model model){
        PageInfo  pageList = bookService.selectScreenBook(screenBook);
        System.out.println("测试："+pageList);
        model.addAttribute("pageList",pageList);
        model.addAttribute("screenBook",screenBook);
        return "book/book-bookSelectScreenBookDesc";
    }

    /**
     * 根据评分与价格的筛选进行分页查询
     * @param screenBook
     * @param response
     * @return
     */
    @RequestMapping("/selectScreenBookDesc2")
    @ResponseBody
    public Map<String,Object> selectScreenBookDesc2(ScreenBook screenBook,HttpServletResponse response){
        System.out.println("页面数："+screenBook.getPageNum());
        System.out.println("条数："+screenBook.getPageSize());
        Map<String,Object> map = new HashMap<String,Object>();
        PageInfo pageList = bookService.selectScreenBook(screenBook);
        //图书信息记录总条数
        int sum = (int) pageList.getTotal();
        //图书页面总数量
        int pageSum =pageList.getPages();
        //当前页数
        int number = pageList.getPageNum();
        //把所有的值都封装到map里面
        map.put("pageList",pageList);
        map.put("sum",sum);
        map.put("pageSum",pageSum);
        map.put("numbers",number);
        return map;
    }
    @RequestMapping("/doIndex")
    public String doIndex(){
        return "redirect:/index.jsp";
    }



    /**
     * 根据图书类型与评分跟价格进行筛选
     * @param screenBook
     * @return
     */
    @RequestMapping("/selectScreenBookTypeName")
    @ResponseBody
    public Map<String,Object> selectScreenBookTypeName(ScreenBook screenBook){
        Map<String,Object> map = new HashMap<String,Object>();
        PageInfo pageList = bookService.selectScreenBookTypeName(screenBook);
        System.out.println("类型："+screenBook.getTypeName());
        System.out.println("评分1："+screenBook.getGradeFront());
        System.out.println("评分2："+screenBook.getGradeQueen());
        System.out.println("价格1："+screenBook.getPriceFront());
        System.out.println("价格2："+screenBook.getPriceQueen());
        System.out.println("每一页数："+screenBook.getPageNum());
        System.out.println("每页多少条信息："+screenBook.getPageSize());
        //图书信息记录总条数
        int sum = (int) pageList.getTotal();
        //图书页面总数量
        int pageSum = pageList.getPages();
        //当前页数
        int number = pageList.getPageNum();
        //把所有的值都封装到map里面
        map.put("pageList",pageList);
        map.put("gradeFront",screenBook.getGradeFront());
        map.put("gradeQueen",screenBook.getGradeQueen());
        map.put("priceFront",screenBook.getPriceFront());
        map.put("priceQueen",screenBook.getPriceQueen());
        return map;
    }

    /**
     * 根据图书模糊查询与评分跟价格进行筛选
     * @param screenBook
     * @return
     */
    @RequestMapping("/selectScreenBookKeyword")
    @ResponseBody
    public Map<String,Object> selectScreenBookKeyword(ScreenBook screenBook){
        Map<String,Object> map = new HashMap<String,Object>();
        PageInfo pageList = bookService.selectScreenBookKeyword(screenBook);
        //图书信息记录总条数
        int sum = (int) pageList.getTotal();
        //图书页面总数量
        int pageSum = pageList.getPages();
        //当前页数
        int number = pageList.getPageNum();
        //把所有的值都封装到map里面
        map.put("pageList",pageList);
        map.put("sum",sum);
        map.put("pageSum",pageSum);
        map.put("number",number);
        return map;
    }

    /**
     *
     *去到购物页面
     * @param bookId
     * @param model
     * @return
     */
    @RequestMapping("/orderBy")
    public String orderBy(Integer bookId,Model model){
        BookAssist bookAssist = bookService.selectBookById(bookId);
        List<BookImage> list = bookService.selectBookImage(bookId);
        System.out.println(list);
        model.addAttribute("bookImageList",list);
        model.addAttribute("bookAssist",bookAssist);
        return "book/book-order";
    }

}
