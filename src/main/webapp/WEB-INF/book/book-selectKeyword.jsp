<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/16
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书类型的图书信息记录</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {

            // 根据图书类型与评分跟价格进行筛选
            $("#butn").on("click",function(){
                $.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath}/book/selectScreenBookKeyword",
                    data:{
                        keyword:$("#keyword").val(),
                        pageNum:1,
                        pageSize:18,
                        priceFront:$("#priceFront").val(),
                        priceQueen:$("#priceQueen").val(),
                        gradeFront:$("#gradeFront").val(),
                        gradeQueen:$("#gradeQueen").val()
                    },
                    dataType:"json",
                    success:function(data){
                        $("#pages").val(data.pageList.pages);
                        $("#nowPageNum").val(data.pageList.pageNum);
                        $("#isPrev").val(data.pageList.hasPreviousPage);
                        $("#isNext").val(data.pageList.hasNextPage);
                        var li = "";
                        $.each(data.pageList.list, function(index,book) {
                            li+= "<li><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'><img src='../img/"+book.bookImage+"' width='200px' height='200px'/></a><p>《"+book.bookName+"》</p><p>类型："+book.bookTypeName+"</p><p><i class='fa fa-star' style='font-size:24px;color:#ffc518;margin-right:5px'></i>"+book.gradeNumber+"</p><p><span style='color: red'>价格：￥"+book.bookPrice+"</span></p><p><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'>详细信息</a></p></li>";
                        });
                        $("#tbodyId").html(li);
                    }

                });
            });

            /*分页功能*/
            $("#p-button").on("click", "#bt", function(){
                if($(this).val()<=$("#pages").val()){
                    $.ajax({
                        type:"get",
                        url:"${pageContext.request.contextPath}/book/selectScreenBookKeyword",
                        data:{
                            keyword:$("#keyword").val(),
                            pageNum:$(this).val(),
                            pageSize:18,
                            priceFront:$("#priceFront").val(),
                            priceQueen:$("#priceQueen").val(),
                            gradeFront:$("#gradeFront").val(),
                            gradeQueen:$("#gradeQueen").val()
                        },
                        dataType:"json",
                        success:function(data){
                            $("#nowPageNum").val(data.pageList.pageNum);
                            $("#isPrev").val(data.pageList.hasPreviousPage);
                            $("#isNext").val(data.pageList.hasNextPage);
                            var li = "";
                            $.each(data.pageList.list, function(index,book) {
                                li+= "<li><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'><img src='../img/"+book.bookImage+"' width='200px' height='200px'/></a><p>《"+book.bookName+"》</p><p>类型："+book.bookTypeName+"</p><p><i class='fa fa-star' style='font-size:24px;color:#ffc518;margin-right:5px'></i>"+book.gradeNumber+"</p><p><span style='color: red'>价格：￥"+book.bookPrice+"</span></p><p><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'>详细信息</a></p></li>";                            });
                            $("#tbodyId").html(li);
                        }
                    });
                }

            });

            //上一页
            $("#isPrev").click(function () {
                var pageNum = 0;
                if ($(this).val()=="false"){
                    pageNum = $("#nowPageNum").val();
                }else if($(this).val()=="true"){
                    pageNum =  $("#nowPageNum").val()-1;
                }
                $.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath}/book/selectScreenBookKeyword",
                    data:{
                        keyword:$("#keyword").val(),
                        pageNum:pageNum,
                        pageSize:18,
                        priceFront:$("#priceFront").val(),
                        priceQueen:$("#priceQueen").val(),
                        gradeFront:$("#gradeFront").val(),
                        gradeQueen:$("#gradeQueen").val()
                    },
                    dataType:"json",
                    success:function(data){
                        $("#nowPageNum").val(data.pageList.pageNum);
                        $("#isPrev").val(data.pageList.hasPreviousPage);
                        $("#isNext").val(data.pageList.hasNextPage);
                        var li = "";
                        $.each(data.pageList.list, function(index,book) {
                            li+= "<li><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'><img src='../img/"+book.bookImage+"' width='200px' height='200px'/></a><p>《"+book.bookName+"》</p><p>类型："+book.bookTypeName+"</p><p><i class='fa fa-star' style='font-size:24px;color:#ffc518;margin-right:5px'></i>"+book.gradeNumber+"</p><p><span style='color: red'>价格：￥"+book.bookPrice+"</span></p><p><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'>详细信息</a></p></li>";                        });
                        $("#tbodyId").html(li);
                    }
                });
            })


            // 下一页
            $("#isNext").click(function () {
                var pageNum = 0;
                if ($(this).val()=="false"){
                    pageNum = $("#nowPageNum").val();
                }else if($(this).val()=="true"){
                    pageNum = parseInt($("#nowPageNum").val())+1;
                }
                $.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath}/book/selectScreenBookKeyword",
                    data:{
                        keyword:$("#keyword").val(),
                        pageNum:pageNum,
                        pageSize:18,
                        priceFront:$("#priceFront").val(),
                        priceQueen:$("#priceQueen").val(),
                        gradeFront:$("#gradeFront").val(),
                        gradeQueen:$("#gradeQueen").val()
                    },
                    dataType:"json",
                    success:function(data){
                        $("#nowPageNum").val(data.pageList.pageNum);
                        $("#isPrev").val(data.pageList.hasPreviousPage);
                        $("#isNext").val(data.pageList.hasNextPage);
                        var li = "";
                        $.each(data.pageList.list, function(index,book) {
                            li+= "<li><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'><img src='../img/"+book.bookImage+"' width='200px' height='200px'/></a><p>《"+book.bookName+"》</p><p>类型："+book.bookTypeName+"</p><p><i class='fa fa-star' style='font-size:24px;color:#ffc518;margin-right:5px'></i>"+book.gradeNumber+"</p><p><span style='color: red'>价格：￥"+book.bookPrice+"</span></p><p><a href='${pageContext.request.contextPath}/book/orderBy?bookId="+book.bookId+"'target='mainFrame'>详细信息</a></p></li>";                        });
                        $("#tbodyId").html(li);
                    }
                });
            })
        })
    </script>
    <style type="text/css">
        #tbodyId li{
            list-style-type: none;
            float: left;
            margin-left: 20px;
            /*border: 1px red solid;*/
            width: 230px;
            text-align: center;
            margin-top: 20px;
        }
        #tbodyId li p{
            margin-top: 5px;
        }

        /*搜索范围样式*/
        .range{
            background: #d3d9df17;
            text-align: center;
            color: #6c757de8;
            font-size: 20px;
            margin-bottom: 20px;
            margin-top: 20px;
        }
        .rangeLeft{
            margin-right: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <p class="fixed-top range">
            <label class="rangeLeft">
                价格：
                <select id="priceFront">
                    <option value="0.0">0.0</option>
                    <option value="30.0">30.0</option>
                    <option value="60.0">60.0</option>
                    <option value="90.0">90.0</option>
                    <option value="120.0">120.0</option>
                    <option value="150.0">150.0</option>
                    <option value="180.0">180.0</option>
                </select>
                ~
                <select id="priceQueen">
                    <option value="180.0">180.0</option>
                    <option value="150.0">150.0</option>
                    <option value="120.0">120.0</option>
                    <option value="90.0">90.0</option>
                    <option value="60.0">60.0</option>
                    <option value="30.0">30.0</option>
                    <option value="0.0">0.0</option>
                </select>
            </label>

            <label class="rangeLeft">
                评分：
                <select id="gradeFront">
                    <option value="0.0">0.0</option>
                    <option value="1.0">1.0</option>
                    <option value="2.0">2.0</option>
                    <option value="3.0">3.0</option>
                    <option value="4.0">4.0</option>
                    <option value="5.0">5.0</option>
                    <option value="6.0">6.0</option>
                    <option value="7.0">7.0</option>
                    <option value="8.0">8.0</option>
                    <option value="9.0">9.0</option>
                    <option value="10.0">10.0</option>
                </select>
                ~
                <select id="gradeQueen">
                    <option value="10.0">10.0</option>
                    <option value="9.0">9.0</option>
                    <option value="8.0">8.0</option>
                    <option value="7.0">7.0</option>
                    <option value="6.0">6.0</option>
                    <option value="5.0">5.0</option>
                    <option value="4.0">4.0</option>
                    <option value="3.0">3.0</option>
                    <option value="2.0">2.0</option>
                    <option value="1.0">1.0</option>
                </select>
            </label>
            <button type="button" id="butn" class="btn btn-info">
                搜索
            </button>
        </p>
    </div>

    <div class="row">
        <ul id="tbodyId">
            <c:forEach var="bookAsstis" items="${pageList.list}">
                <li style="float: left;margin: 10px 0 0 20px;text-align: center;list-style-type: none">
                    <a href="${pageContext.request.contextPath}/book/orderBy?bookId=${bookAsstis.bookId}" target="mainFrame"><img src="../img/${bookAsstis.bookImage}" width="200px" height="200px"/></a>
                    <p>《${bookAsstis.bookName}》</p>
                    <p>类型：${bookAsstis.bookTypeName}</p>
                    <p><i class='fa fa-star' style='font-size:24px;color:#ffc518;margin-right:5px'></i>${bookAsstis.gradeNumber}</p>
                    <p><span style="color: red">价格：￥${bookAsstis.bookPrice}</span></p>
                    <p><a href="${pageContext.request.contextPath}/book/orderBy?bookId=${bookAsstis.bookId}" target="mainFrame">详细信息</a></p>
                </li>
            </c:forEach>
        </ul>
    </div>
    <p class="fixed-bottom" style="text-align: center;margin-top: 20px" id="p-button">
        <button class="btn btn-info" id="isPrev" value="${pageList.hasPreviousPage}">上一页</button>
        <button class="btn btn-info" id="bt" value="1">第1页</button>
        <button class="btn btn-info" id="bt" value="2">第2页</button>
        <button class="btn btn-info" id="bt" value="3">第3页</button>
        <button class="btn btn-info" id="isNext" value="${pageList.hasNextPage}">下一页</button>
    </p>


    <%--    模糊名称--%>
    <input type="hidden" id="keyword" value="${screenBook.keyword}"/>
    <%--	当前页数--%>
    <input type="hidden" id="nowPageNum" value="${pageList.pageNum}">
    <%--总页数--%>
    <input type="hidden" id="pages" value="${pageList.pages}">
</div>
</body>
</html>
