package com.book.test;

import com.book.entity.Book;
import com.book.entity.User;
import com.book.mapper.BookMapper;
import com.book.mapper.OrderFromMapper;
import com.book.mapper.UserMapper;
import com.book.pojo.*;
import com.book.service.BookService;
import com.book.service.OrderFromService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class TestBookMapper {
    @Autowired
    private OrderFromService orderFromService;
    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BookService bookService;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private OrderFromMapper orderFromMapper;


    @Test
    public void selectAll(){
        List<BookAssist> list = bookMapper.selectAllBook();
        for (BookAssist bookAssist:list){
            System.out.println(bookAssist);
        }
    }
    @Test
    public void st(){
        Integer pageNum = 1;
        Integer pageSize = 5;
        PageHelper.startPage(1,5);
        List<BookAssist> list = bookMapper.selectAllBook();
        for (BookAssist bookAssist:list){
            System.out.println(bookAssist);
        }
        PageInfo<BookAssist> pageInfo =new PageInfo<BookAssist>(list);
        System.out.println(pageInfo.toString());

    }
    @Test
    public void login(){
        UserAssist userAssist = new UserAssist();
        userAssist.setPhone("13580178895");
        userAssist.setUserPassword("Aa1234");
        User user = userMapper.userLogin(userAssist);

        System.out.println("登录数据："+user);
    }
    @Test
    public void selectBy(){
        Integer bookId = 3001;
        BookAssist bookAssist = bookMapper.selectBookById(bookId);
        System.out.println(bookAssist);
    }
    @Test
    public void delBook(){
        Integer bookId=3011;
        int result = bookMapper.deleteBook(bookId);
        System.out.println("成功删除："+result);
    }

//    @Test
//    public void selectKey(){
//        String keyword = "海";
//        List<BookAssist> list = bookMapper.selectKeyword(keyword);
//        for (BookAssist bookAssist:list){
//            System.out.println(bookAssist);
//        }
//    }
//
    @Test
    public void selectByType(){
        ScreenBook screenBook = new ScreenBook();
        screenBook.setTypeName("动作");
        screenBook.setPageNum(1);
        screenBook.setPageSize(10);

        PageInfo list = bookService.selectByBookTypeName(screenBook);
        System.out.println(list.getList().get(0));
    }

    @Test
    public void testAdd(){
        BookAssist bookAssist = new BookAssist();

//       bookAssist.setBookName("路飞开启王者霸气");
//       bookAssist.setBookImage("book1.jpg");
//       bookAssist.setBookContent("略个屁。");
//       bookAssist.setBookPrice(40.5);
//       bookAssist.setUserName("张三");
//       bookAssist.setBookReleaseTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
//       bookAssist.setBookIsDelete(1);
//       int result = 0;
//       result=bookMapper.addBook(bookAssist);
        String bookName = "路飞开启王者霸气";
//        Map<String,Object> map = new HashMap<String,Object>();
//        map.put("bookName",bookName);
        Book book = bookMapper.bookNameSS(bookName);
        System.out.println(book);
//        bookAssist.setBookId(book.getBookId());
//        System.out.println(book.getBookId());
//        bookAssist.setBookTypeId(1);
//        System.out.println(bookAssist);
//        result+=bookMapper.addBookIn(bookAssist);
//        System.out.println("成功添加："+result);

    }

    @Test
    public void testScreen(){
        Double priceFront = 111.0;
        Double priceQueen = 8888.0;
        Double gradeFront = 8.0;
        Double gradeQueen = 10.0;
        Integer pageNum = 1;
        Integer pageSize = 5;
        ScreenBook screenBook = new ScreenBook();
        screenBook.setPriceFront(priceFront);
        screenBook.setPriceQueen(priceQueen);
        screenBook.setGradeQueen(gradeQueen);
        screenBook.setGradeFront(gradeFront);
        screenBook.setPageNum(pageNum);
        screenBook.setPageSize(pageSize);


        PageInfo list = bookService.selectScreenBook(screenBook);

        System.out.println("图书筛选数据："+list.getList().get(1));
        System.out.println("图书筛选页面数量："+list.getPageNum());
        System.out.println("页面大小："+list.getPageSize());
        System.out.println("总记录数："+list.getTotal());
        System.out.println("是否有上一页："+list.isHasPreviousPage());
        System.out.println("是否有下一页："+list.isHasNextPage());
        System.out.println("总页面数："+list.getPages());
        System.out.println(list);

    }

    @Test
    public void selectBookImage(){
        List<BookImage> list = bookMapper.selectBookImage(3014);
        System.out.println(list);
    }
    @Test
    public void testOrder(){
        OrderFromAssist orderFromAssist = new OrderFromAssist();
        orderFromAssist.setIsDelete(1);
        orderFromAssist.setBookId(3014);
        orderFromAssist.setNumbers(1);
        orderFromAssist.setUserId(3);
        orderFromAssist.setOrderTime("2019-12-13");
        orderFromAssist.setSumPrice(3.1);
        int result = orderFromService.addOrder(orderFromAssist);

    }


    @Test
    public void testOrder2(){
        OrderFromAssist orderFromAssist = new OrderFromAssist();
        orderFromAssist.setIsDelete(1);
        orderFromAssist.setBookId(3014);
        orderFromAssist.setNumbers(1);
        orderFromAssist.setUserId(3);
        orderFromAssist.setOrderTime("2019-12-13");
        orderFromAssist.setSumPrice(3.1);
        int result =orderFromMapper .addOrder(orderFromAssist);

    }
    @Test
    public void testBought(){
        OrderFromAssist orderFromAssist = new OrderFromAssist();
        orderFromAssist.setSumPrice(88.0);
        orderFromAssist.setUserId(1);
        orderFromAssist.setOrderTime("2019-11-1");
        orderFromAssist.setNumbers(100);
        orderFromAssist.setBookId(3001);
        orderFromAssist.setBookPrice(8.0);
        orderFromAssist.setIsDelete(1);
        orderFromAssist.setSite("讲究生态公园");
       orderFromService.addBought(orderFromAssist);
    }
}
