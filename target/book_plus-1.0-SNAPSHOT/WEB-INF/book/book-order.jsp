<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Js
  Date: 2019/12/21
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<html>
<head>
    <title>订购图书</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){

            //实时监听输入框的值，当输入框的值大于库存时，修改输入框的值为库存的最大值
            $("#bookSum").bind('input propertychange', function() {
                //写一个变量来存储当前输入框的值
                var val= $(this).val();
                //判断输入框的值是否为数字类型
                if(val!=''&& isNaN(val)){
                    var n = val;
                    var n = n.match(/\d+/g);
                    $(this).val(n);
                }else if (val==''||val<1) {
                    //判断输入框的值是否为“”（空字符串），如果是就赋值为1
                    $(this).val(1);
                }else if(parseFloat($(this).val())){
                    //判断输入框的值是否为小数（不能输入小数点）
                    $(this).val(parseInt($(this).val()));
                }
                //添加的数量
                var bookNum = parseInt($(this).val());
                console.log(bookNum)
                //书的单价
                var price = parseFloat($("#bookPrice").val());
                //库存的值
                var bookNumber = $("#bookNumber").val()
                console.log(bookNumber)
                //当输入框的值大于库存时，修改输入框的值为库存的值
                if(bookNum>bookNumber) {
                    //修改输入框的值为库存的值
                    $("#bookSum").val(bookNumber);
                    //总价=价格*库存
                    var priceSum = price*bookNumber;
                    $("#sumPrice").text(priceSum.toFixed(1));
                }else {
                    //总价=价格*数量
                    var priceSum = price*bookNum;
                    $("#sumPrice").text(priceSum.toFixed(1));
                }

             });

            $("#numPlus").click(function () {
                //点击加号按钮的时候进行的操作，首先判断值是否大于库存
                if($("#bookSum").val()==$("#bookNumber").val()){
                    alert("库存不足！");
                }else {
                    //如果值没有大于库存就可以继续添加
                    var num = parseInt($("#bookSum").val())+1;
                    $("#bookSum").val(num);
                    var price = parseFloat($("#bookPrice").val());
                    var priceSum = price*$("#bookSum").val();
                    $("#sumPrice").text(priceSum.toFixed(1));
                }

            })

            $("#numMinus").click(function () {
                //点击加号按钮的时候进行的操作，首先判断值最小是1
                if ($("#bookSum").val()==1){
                    alert("不能再减啦，主人！");
                } else {
                    //如果值没有大于1就可以继续添加
                    var num = parseInt($("#bookSum").val())-1;
                    $("#bookSum").val(num);
                    var price = parseFloat($("#bookPrice").val());
                    var priceSum = price*$("#bookSum").val();
                    $("#sumPrice").text(priceSum.toFixed(1));
                }
            })

            //添加购物车
            $("#addShoppingCart").click(function(){
                if ($("#userId").val()==null||$("#userId").val()==''){
                    alert("请先登录!")
                } else {
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/addOreder",
                        data:{
                            bookId:$("#bookId").val(),
                            userId:$("#userId").val(),
                            sumPrice:$("#sumPrice").text(),
                            numbers:$("#bookSum").val(),
                            orderTime:$("#orderTime").val()
                        },
                        dataType:"json",
                        success:function(data){
                            if(data !=null){
                                alert("添加成功！");
                            }else{
                                alert("添加失败！");
                            }
                        }
                    });
                }


            })


            //立即购买
            $("#buyBook").click(function(){
                //先判断有没有用户登录
                if ($("#userId").val()==null||$("#userId").val()==''){
                    alert("请先登录!")
                }else {
                    $("#buyBookSum").val($("#bookSum").val());
                    $("#buySumPrice").text($("#sumPrice").text());

                    //实时监听输入框的值，当输入框的值大于库存时，修改输入框的值为库存的最大值
                    $("#buyBookSum").bind('input propertychange', function() {
                        //写一个变量来存储当前输入框的值
                        var val= $(this).val();
                        //判断输入框的值是否为数字类型
                        if(val!=''&& isNaN(val)){
                            var n = val;
                            var n = n.match(/\d+/g);
                            $(this).val(n);
                        }else if (val==''||val<1) {
                            //判断输入框的值是否为“”（空字符串），如果是就赋值为1
                            $(this).val(1);
                        }else if(parseFloat($(this).val())){
                            //判断输入框的值是否为小数（不能输入小数点）
                            $(this).val(parseInt($(this).val()));
                        }
                        //添加的数量
                        var bookNum = parseInt($(this).val());
                        console.log(bookNum)
                        //书的单价
                        var price = parseFloat($("#bookPrice").val());
                        //库存的值
                        var bookNumber = $("#bookNumber").val()
                        console.log(bookNumber)
                        //当输入框的值大于库存时，修改输入框的值为库存的值
                        if(bookNum>bookNumber) {
                            //修改输入框的值为库存的值
                            $("#buyBookSum").val(bookNumber);
                            //总价=价格*库存
                            var priceSum = price*bookNumber;
                            $("#buySumPrice").text(priceSum.toFixed(1));
                        }else {
                            //总价=价格*数量
                            var priceSum = price*bookNum;
                            $("#buySumPrice").text(priceSum.toFixed(1));
                        }

                    });


                    $("#buyNumPlus").click(function () {
                        //点击加号按钮的时候进行的操作，首先判断值是否大于库存
                        if($("#buyBookSum").val()==$("#bookNumber").val()){
                            alert("库存不足！");
                        }else {
                            //如果值没有大于库存就可以继续添加
                            var num = parseInt($("#buyBookSum").val())+1;
                            $("#buyBookSum").val(num);
                            var price = parseFloat($("#bookPrice").val());
                            var priceSum = price*$("#buyBookSum").val();
                            console.log(priceSum)
                            $("#buySumPrice").text(priceSum.toFixed(1));
                        }

                    });

                    $("#buyNumMinus").click(function () {
                        //点击加号按钮的时候进行的操作，首先判断值最小是1
                        if ($("#buyBookSum").val()==1){
                            alert("不能再减啦，主人！");
                        } else {
                            //如果值没有大于1就可以继续添加
                            var num = parseInt($("#buyBookSum").val())-1;
                            $("#buyBookSum").val(num);
                            var price = parseFloat($("#bookPrice").val());
                            var priceSum = price*$("#buyBookSum").val();
                            $("#buySumPrice").text(priceSum.toFixed(1));
                        }
                    });

                    //购买图书
                    $("#subitBuyBook").click(function () {
                        if ( $("#isSite").val()=="true"){
                            $.ajax({
                                type:"post",
                                url:"${pageContext.request.contextPath}/addBought",
                                data:{
                                    bookId:$("#bookId").val(),
                                    userId:$("#userId").val(),
                                    numbers:$("#buyBookSum").val(),
                                    bookPrice:$("#bookPrice").val(),
                                    sumPrice:$("#buySumPrice").text(),
                                    site:$("#site").val(),
                                    orderTime:$("#orderTime").val()
                                },
                                dataType:"json",
                                success:function(data){
                                    if(data !=0){
                                        alert("购买成功！");
                                    }else{
                                        alert("购买失败！");
                                    }
                                }
                            });
                            console.log("书的ID："+$("#bookId").val());
                            console.log("用户ID："+$("#userId").val());
                            console.log("数量："+$("#buyBookSum").val());
                            console.log("单价："+$("#bookPrice").val());
                            console.log("总价："+$("#buySumPrice").text());
                            console.log("地址："+$("#site").val());
                            console.log("时间:"+$("#orderTime").val());
                        }else {
                            alert("请填写地址");
                        }
                    });
                }


            });
        });

        function siteCheck() {
            let account = $("#site").val();
            console.log(account);
            if(account==''||account==null){
               alert("请填写地址");
            }else {
                $("#isSite").val(true);
            }

        }
    </script>
    <style type="text/css">
        a:link{
            color: black;
            text-decoration: none;
        }

        a:hover{
            color: white;
            text-decoration: none;
        }
        a:visited{
            color: black;
            text-decoration: none;
        }

        /* 轮播图片样式*/
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }

        /*轮播图css*/
        .sideshow-img{
            width: 100%;
            height: 400px;
            margin: auto;
        }
        body{
            background-color:#bdae1905;
        }
        .sizeStyle{
           font-size: 25px;
        }

    </style>
		  
</head>
<body>
<p></p>
<div class="row">
    <div class="col-sm-1"></div>
    <div class="col-sm-5">
        <%--轮播图--%>
        <div style="width: 100%;background-color: white;">
            <div id="demo" class="carousel slide sideshow-img" data-ride="carousel">
                <!-- 指示符 -->
                <ul class="carousel-indicators">
                    <c:forEach items="${bookImageList}" varStatus="num">
                        <c:if test="${num.index==0}">
                            <li data-target="#demo" data-slide-to="0" class="active"></li>
                        </c:if>

                        <c:if test="${num.index!=0}">
                            <li data-target="#demo" data-slide-to="${num.index}"></li>
                        </c:if>

                    </c:forEach>
                </ul>

                <!-- 轮播图片 -->
                <div class="carousel-inner">
                    <c:forEach var="image" items="${bookImageList}" varStatus="num">
                        <c:if test="${num.index==0}">
                            <div class="carousel-item active">
                                <img src="../../img/${image.bookImg}"/>
                            </div>
                        </c:if>

                        <c:if test="${num.index!=0}">
                            <div class="carousel-item">
                                <img src="../../img/${image.bookImg}"/>
                            </div>
                        </c:if>

                    </c:forEach>
                </div>

                <!-- 左右切换按钮 -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>

            </div>

        </div>
<%--        <img src="../${bookAssist.bookImage}" width="400px"/>--%>

    </div>
    <div class="col-sm-6">
        <p class="sizeStyle">${bookAssist.bookContent}</p>
        <p>作者：<span style="color: #a71d2a">${bookAssist.authorName}</span></p>
        <p>
            库存：${bookAssist.bookNumber}

        </p>
        <p>
            数量:
            <%--            减号号按钮--%>
            <button  id="numMinus" class="btn btn-default btn-sm">
                <i class="fa fa-minus-square" style="font-size:24px"></i>
            </button>

            <%--            输入框的值--%>
            <input type="text" id="bookSum" value="1" style="width:35px;text-align: center"/>

            <%--            加号按钮--%>
            <button id="numPlus" class="btn btn-default btn-sm">
                <i class="fa fa-plus-square" style="font-size:24px"></i>
            </button>
        </p>

        <p>
            <span style="color: #FF7231">
            <%--                图书的数量价格--%>
                ￥<a id="sumPrice">${bookAssist.bookPrice}</a>
            </span>

        </p>

        <button class="btn btn-primary" id="addShoppingCart" style="margin-right: 20px">
            添加购物车
        </button>

        <!-- 按钮：用于打开立即购买模态框 -->
        <c:if test="${user == null}">
            <button class="btn btn-danger" id="buyBook">
                立即购买
            </button>
        </c:if>

        <c:if test="${user != null}">
            <button class="btn btn-danger" id="buyBook" data-toggle="modal" data-target="#myModa1">
                立即购买
            </button>
        </c:if>


    </div>
</div>



<!-- 模态框 -->
<div class="modal fade" id="myModa1">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">立即购买</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">

                <input type="hidden" id="bookId" value="${bookAssist.bookId}"/>
                <p>
                    <img src="../img/${bookAssist.bookImage}" class="img-thumbnail" alt="Cinque Terre" width="100px" height="100px">
                    《${bookAssist.bookName}》
                </p>
                <p>
                    库存：${bookAssist.bookNumber}
                </p>

                <p>
                    数量:
                    <%--            减号号按钮--%>
                    <button  id="buyNumMinus" class="btn btn-default btn-sm">
                        <i class="fa fa-minus-square" style="font-size:24px"></i>
                    </button>

                    <%--            输入框的值--%>
                    <input type="text" id="buyBookSum" value="1" style="width:35px;text-align: center"/>

                    <%--            加号按钮--%>
                    <button id="buyNumPlus" class="btn btn-default btn-sm">
                        <i class="fa fa-plus-square" style="font-size:24px"></i>
                    </button>
                </p>

                <p>
                    <span style="color: #FF7231">
                    <%--                图书的数量价格--%>
                        ￥<a id="buySumPrice">${bookAssist.bookPrice}</a>
                    </span>
                </p>

                <p>
                    <textarea placeholder="请填写地址" id="site" style="width: 350px;height: 80px;" onblur="siteCheck()"></textarea>
                    <input type="hidden" id="isSite" value="false">
                </p>

                <p style="text-align: center">
                    <button class="btn btn-danger" id="subitBuyBook" data-dismiss="modal">
                        购买
                    </button>
                </p>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

<%--用户的id--%>
<input type="hidden" id="userId" value="${user.userId}">
<%--添加时间--%>
<input type="hidden" id="orderTime" value="<%=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime())%>">
<%--库存--%>
<input type="hidden" id="bookNumber" value="${bookAssist.bookNumber}"/>
<%--            隐藏框，存储图书的单价--%>
<input type="hidden" id="bookPrice" value="${bookAssist.bookPrice}">
</body>
</html>
