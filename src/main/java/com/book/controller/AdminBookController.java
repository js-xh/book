package com.book.controller;

import com.book.entity.Book;
import com.book.pojo.ScreenBook;
import com.book.service.BookService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminBookController {
    @Autowired
    private BookService bookService;

    /**
     *
     * 查询全部图书信息
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/selectAllBook")
    @ResponseBody
    public Map<String,Object> selectAllBook(Integer pageNum,Integer pageSize){
        Map<String,Object> map = new HashMap<String,Object>();
        PageInfo pageList = bookService.selectAllBook(pageNum,pageSize);
        map.put("pageList",pageList);
        map.put("sum",pageList.getTotal());
        map.put("sumPage",pageList.getPages());
        map.put("number",pageList.getPageNum());
        return map;
    }

    /**
     * 删除图书数据
     * @param bookId
     * @return
     */
    @RequestMapping("/delBook")
    @ResponseBody
    public int delBook(Integer bookId){
        System.out.println("要删除的数据："+bookId);
        int result = bookService.deleteBook(bookId);
        return result;
    }

    /**
     * 模糊查询图书信息
     * @param screenBook
     * @return
     */
    @RequestMapping("/selectByBookName")
    @ResponseBody
    public Map<String,Object> selectByBookName(ScreenBook screenBook){
        System.out.println("32:"+screenBook.getPageSize());
        System.out.println("ds:"+screenBook.getPageNum());
        System.out.println("规划股："+screenBook.getKeyword());
        Map<String,Object> map = new HashMap<String,Object>();
        PageInfo pageList = bookService.selectKeyword(screenBook);
        System.out.println("遍历："+pageList.getList().get(0));
        map.put("pageList",pageList);
        map.put("sum",pageList.getTotal());
        map.put("sumPage",pageList.getPages());
        map.put("number",pageList.getPageNum());
        return map;
    }

    @RequestMapping("/updateBook")
    @ResponseBody
    public int upadteBook(Book book, HttpServletRequest request, HttpServletResponse response){
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/html;charset=utf-8");
        System.out.println("这里是修改控制器。");
        String realpath =  request.getServletContext().getRealPath("/img");
        //获取上传文件名字
        String fileName =book.getMyfile().getOriginalFilename();
        System.out.println(fileName);
        //图片的全路径名（File对象）
        File targetFile = new File(realpath, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
            System.out.println(targetFile+"创建成功");
        }
        //要存到数据库里面的url
        String picUrl = "http://localhost:8080/img/"+fileName;
        System.out.println("访问图片的路径"+picUrl);

        try {
            //上传操作（绝对了能不能上传成功）
            book.getMyfile().transferTo(targetFile);

        } catch (Exception e) {
            e.printStackTrace();
        }

        book.setBookImage(fileName);
        System.out.println("这是图片上传："+book.getBookImage());
        book.setBookReleaseTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
        int result = bookService.updateBook(book);

        return result;
    }

    /**
     * 添加图书信息记录
     * @param book
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/addBook")
    @ResponseBody
    public int addBook(Book book, HttpServletRequest request, HttpServletResponse response){
        System.out.println("我来也！");
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.setContentType("text/html;charset=utf-8");
        System.out.println("这里是修改控制器。");
        String realpath =  request.getServletContext().getRealPath("/img");
        //获取上传文件名字
        String fileName =book.getMyfile().getOriginalFilename();
        System.out.println(fileName);
        //图片的全路径名（File对象）
        File targetFile = new File(realpath, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
            System.out.println(targetFile+"创建成功");
        }
        //要存到数据库里面的url
        String picUrl = "http://localhost:8080/img/"+fileName;
        System.out.println("访问图片的路径"+picUrl);

        try {
            //上传操作（绝对了能不能上传成功）
            book.getMyfile().transferTo(targetFile);

        } catch (Exception e) {
            e.printStackTrace();
        }

        book.setBookImage(fileName);
        book.setBookIsDelete(1);
        System.out.println("这是图片上传："+book.getBookImage());
        book.setBookReleaseTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
        int result = bookService.addBook(book);
        return result;
    }

}
