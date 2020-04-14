package com.book.controller;

import com.book.entity.Author;
import com.book.pojo.AuthorAssist;
import com.book.service.AuthorService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AuthorController {
    @Autowired
    private AuthorService authorService;

    /**
     * 查询所有作者
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/selectAllAuthor")
    @ResponseBody
    public Map<String,Object> selectAllAuthor(Integer pageNum,Integer pageSize){
        System.out.println("前端数据4546："+pageNum);
        Map<String,Object> map = new HashMap<String,Object>();
        PageInfo pageList = authorService.selectAllAuthor(pageNum,pageSize);
        System.out.println("数据："+pageSize);
        map.put("pageList",pageList);
        map.put("sum",pageList.getTotal());
        map.put("sumPage",pageList.getPages());
        map.put("number",pageList.getPageNum());
        return map;
    }



    /**
     * 删除作者信息记录
     * @param authorId
     * @return
     */
    @RequestMapping("/delAuthor")
    @ResponseBody
    public int delAuthor(Integer authorId){
        System.out.println("删除数据："+authorId);
        int result = authorService.delAuthor(authorId);
        return result;
    }

    /**
     * 模糊查询作者信息记录
     * @param authorAssist
     * @return
     */
    @RequestMapping("/selectKeywordName")
    @ResponseBody
    public Map<String,Object> selectKeywordName(AuthorAssist authorAssist){
        System.out.println("你好世界："+authorAssist.getKeyword());
        Map<String,Object> map = new HashMap<String,Object>();
        PageInfo pageList = authorService.selectByNameAuthor(authorAssist);
        map.put("pageList",pageList);
        map.put("sum",pageList.getTotal());
        map.put("sumPage",pageList.getPages());
        map.put("number",pageList.getPageNum());
        return map;
    }

    /**
     *
     * @param author
     * @return
     */
    @RequestMapping(value = "/addAuthor",method = RequestMethod.POST)
    @ResponseBody
    public int addAuthor(Author author,HttpServletRequest request){
        String realpath = request.getServletContext().getRealPath("/img");
        String fileName = author.getMyfile().getOriginalFilename();
        System.out.println(fileName);
        File targetFile = new File(realpath,fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
            System.out.println(targetFile+"创建成功！");
        }
        String picUrl = "http://localhost:8080/img/"+fileName;
        System.out.println("访问图片的路径："+picUrl);
        try{
            author.getMyfile().transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        author.setAuthorImage(fileName);
        System.out.println("这是图片上传："+author.getAuthorImage());
        author.setCreateTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
        author.setIsDelete(1);
        int result = authorService.addAuthor(author);
        return result;
    }
    @RequestMapping("/updateAuthor")
    @ResponseBody
    public int updateAuthor(Author author,HttpServletRequest request){
        System.out.println("你好世界！");
        String realpath = request.getServletContext().getRealPath("/img");
        String fileName = author.getMyfile().getOriginalFilename();
        System.out.println(fileName);
        File targetFile = new File(realpath,fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
            System.out.println(targetFile+"创建成功！");
        }
        String picUrl = "http://localhost:8080/img/"+fileName;
        System.out.println("访问图片的路径："+picUrl);
        try{
            author.getMyfile().transferTo(targetFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        author.setAuthorImage(fileName);
        System.out.println("这是图片上传："+author.getAuthorImage());
        author.setCreateTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
        author.setIsDelete(1);
        int result =authorService.updateAuthor(author);
        return result;
    }
}
