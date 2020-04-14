<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/8
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<html>
<head>
    <title>书店主页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/fornt-desk-index.css"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <style>
        /*主页修改bootstrap样式*/

        /*导航条背景样式*/
        .bg-dark {
            background-color: #85640485!important;
        }
        /*导航条logo样式*/
        .navbar-dark .navbar-brand {
            color: #155724;
            margin-left: 100px;
            margin-right: 120px;
        }
        /*导航条li字体样式*/
        .navbar-dark .navbar-nav .nav-link {
            color: #721c24;
            margin-right: 30px;
            font-family: "行书";
            font-size: 25px;
            text-align: center;
            margin-top: 8px;
        }

        /* 轮播图片样式*/
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        .table td, .table th {
            padding: .75rem;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
            border-bottom: 1px solid #dee2e6;
        }

        .btn.focus, .btn:focus {
            outline: 0;
            /* box-shadow: 0 0 0 0.2rem #8a6d3b8f; */
        }

        .btn-info a:link{
            color: white;
            text-decoration: none;
        }

        .btn-info a:hover{
            color: white;
            text-decoration: none;
        }
        .btn-info a:visited{
            color: white;
            text-decoration: none;
        }

        td a:link{
            color: black;
            text-decoration: none;
        }

        td a:hover{
            color: black;
            text-decoration: none;
        }
        td a:visited{
            color: black;
            text-decoration: none;
        }

        .dropdown-menu a:link{
            color: black;
            text-decoration: none;
        }

        .dropdown-menu a:hover{
            color: black;
            text-decoration: none;
        }

        .dropdown-menu a:visited{
            color: black;
            text-decoration: none;
        }
        .red{
            color: red;
            font-size: 18px;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            console.log("后台网址：http://192.168.124.33:8080/X-admin/adminLogin.jsp");

            $("#selectButton").on("click","#select",function () {
                $(this).attr("href","${pageContext.request.contextPath}/book/selectKeyword?keyword="+$("#keyword").val()+"&pageNum=1&pageSize=20");
            })

            //注册的验证码
            $("#verifyCodeImage").click(function() {

                /* js负责验证码的刷新 */

                <%--window.location.href="${pageContext.request.contextPath }/user/registerView"--%>
                var imgEle = $("#verifyCodeImage");
                imgEle.src = "${pageContext.request.contextPath }/getVerifyCode?"+ new Date().getTime();
                $("#verifyCodeImage").attr("src", imgEle.src);
            })

            //登录的验证码
            $("#verifyCodeImage2").click(function() {

                /* js负责验证码的刷新 */

                <%--window.location.href="${pageContext.request.contextPath }/user/registerView"--%>
                var imgEle = $("#verifyCodeImage");
                imgEle.src = "${pageContext.request.contextPath }/getVerifyCode?"+ new Date().getTime();
                $("#verifyCodeImage2").attr("src", imgEle.src);
            })



            /*登录的判断*/
            $("#accountSub").click(function () {
                if ($("#isAccount").val()=="true"&&$("#isAccountPassword").val()=="true"&&$("#isAccountCode").val()=="true"){
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/user/login",
                        data:{
                            phone:$("#account").val(),
                            userPassword:$("#accountPwd").val(),
                            code:$("#accountVCodeText").val()
                        },
                        dataType:"json",
                        success:function(data){
                            console.log(data)
                            if (data==1){
                                alert("登录成功！");
                                $("#closeModal1").trigger("click");
                                window.location.reload();
                            }else if(data==2){
                                alert("验证码错误，登录失败！")
                            }else if(data==3){
                                alert("账号或者密码错误！")
                            }

                        }
                    });
                }else {
                    alert("请正确填写信息");
                }
            })

            /*注册的判断*/
            $("#accountRegister").click(function () {
                if ($("#registerUserName").val()=="true"&&$("#registerPhone").val()=="true"&&$("#registerMail").val()=="true"&&$("#registerPwd").val()=="true"&&$("#registerPwd2").val()=="true"&&$("#registerCode").val()=="true"&&$('input[name="sex"]:checked').val()!=null){
                        var formData = new FormData();
                        formData.append("userName",$("#userName").val());
                        formData.append("userPassword",$("#pwd").val());
                        formData.append("userEmail",$("#email").val());
                        formData.append("userSex",$('input[name="sex"]:checked').val());
                        formData.append("userPhone",$("#tel").val());
                        formData.append("image",$("#userIamge")[0].files[0]);
                        formData.append("userTime",$("#registerUsertime").val());
                        formData.append("code",$("#vCodeText").val());
                        console.log(formData.get('userName'),formData.get('image'));
                        $.ajax({
                            type:"post",
                            url:"${pageContext.request.contextPath}/user/register",
                            data:formData,
                            cache: false,
                            processData: false,
                            contentType: false,
                            dataType:"json",
                            success:function(data){
                                if (data.codeErro!=null){
                                    alert(data.codeErro);
                                }else if (data.no!=null){
                                    alert(data.no);
                                } else {
                                    alert("注册成功")
                                    $("#closeModal2").trigger("click");
                                }

                            }
                        });
                    }else {
                        alert("请正确填写信息");
                    }
            })


            //查看个人信息
            $("#selectUser").click(function () {
                console.log($("#userId").val());
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/user/selectUserById",
                    data:{
                        userId:$("#userId").val()
                    },
                    dataType:"json",
                    success:function(data){
                        console.log(data.userImage);
                        // "<img width='50px' height='50px' class='rounded-circle' src='img'"+data.userImage+"/>"
                        var n = "<p>"+"<img src='img/"+data.userImage+"' width='50px' height='50px' class='rounded-circle'>"+
                            "</p><p>用户名："+data.userName+ "</p><p>账号："+data.userPhone+"</p>"+
                            "</p><p>邮箱：" +data.userEmail+"</p><p>性别："+data.userSex+
                            "</p><p>上次登录时间："+data.userTime+"</p>";
                        $("#userMessage").html(n);
                    }
                });
            });

            //修改信息
            $("#updateSub").click(function () {
                if($("#isUpdataUserName").val()=="true"&&$("#isUpdateEmail").val()=="true"){
                    if ($("#updateImage")[0].files[0]==undefined){
                        console.log("没有更换头像")
                        // $("#updateImage").attr("type","text");
                        // $("#updateImage").val($("#userImage").val());
                        $.ajax({
                            type:"post",
                            url:"${pageContext.request.contextPath}/user/updateUser",
                            data:{
                                userId:$("#userId").val(),
                                userName: $("#updataUserName").val(),
                                userEmail:$("#updataUserEmail").val(),
                                userImage:$("#userImage").val()
                            },
                            dataType:"json",
                            success:function(data){
                                console.log(data)
                                if (data==1){
                                    alert("修改成功!");
                                    window.location.reload();
                                    //关闭模态框
                                    //$("#closeUpdate").trigger("click");
                                }else {
                                    alert("修改失败!");
                                }
                            }
                        });
                    }else {
                        console.log("有更换头像")
                        var formData = new FormData();
                        formData.append("userId",$("#userId").val());
                        formData.append("userName",$("#updataUserName").val());
                        formData.append("userEmail",$("#updataUserEmail").val());
                        formData.append("image",$("#updateImage")[0].files[0]);
                        $.ajax({
                            type:"post",
                            url:"${pageContext.request.contextPath}/user/updateUser",
                            data:formData,
                            cache: false,
                            processData: false,
                            contentType: false,
                            dataType:"json",
                            success:function(data){
                                console.log(data)
                                if (data==1){
                                    alert("修改成功!");
                                    window.location.reload();
                                    // $("#closeUpdate").trigger("click");
                                }else {
                                    alert("修改失败!");
                                }
                            }
                        });
                    }

                }else {
                    alert("信息不符合要求！");
                }
            });

            //修改密码
            $("#updatePwdSub").click(function () {
                if ($("#isUpdateUserPwd").val()=="true"&&$("#isUpdateUserPwd1").val()=="true") {
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/user/updateUserPassowrd",
                        data:{
                            userId:$("#userId").val(),
                            userPassword:$("#updateUserPwd").val()
                        },
                        dataType:"json",
                        success:function(data){
                            console.log(data)
                            if (data==1){
                                alert("修改成功!");
                                $("#closeUpdatePwd").trigger("click");
                            }else {
                                alert("修改失败!");
                            }
                        }
                    });
                }else {
                    alert("密码格式错误!");
                }
            });


            // 查看购物车
            $("#shoppingCart").click(function () {
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/user/selectMyShoppingCarts",
                    data:{
                        userId:$("#userId").val(),
                    },
                    dataType:"json",
                    success:function(data){
                        var n = "";
                        $.each(data, function(index,book) {
                            n+="<div style='border: #dca7a7 2px solid;'><p><img src='img/"+book.bookImage+"' width='50px' height='50px' class='rounded-circle'></p>"+
                                "<p>书名："+book.bookName+"</p>"+"<p>数量："+book.numbers+"</p>"+"<p>总价："+book.sumPrice+"</p>"+
                                "<p>添加时间："+book.orderTime+"</p>"+"<button class='btn btn-danger' id='delOrder' value='"+book.orderId+"'>删除</button>"+
                                "</div>";

                        });
                        $("#myCarts").html(n);
                        console.log(data);

                    }
                });
            });

                //删除购物车
                $("#myCarts").on("click","#delOrder",function () {
                    console.log($(this).val());
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath}/user/delMyShoppingCarts",
                        data:{
                            orderId:$(this).val()
                        },
                        dataType:"json",
                        success:function(data){
                            if(data==1){
                                alert("删除成功！");
                                $.ajax({
                                    type:"post",
                                    url:"${pageContext.request.contextPath}/user/selectMyShoppingCarts",
                                    data:{
                                        userId:$("#userId").val(),
                                    },
                                    dataType:"json",
                                    success:function(data){
                                        var n = "";
                                        $.each(data, function(index,book) {
                                            n+="<div style='border: #dca7a7 2px solid;'><p><img src='img/"+book.bookImage+"' width='50px' height='50px' class='rounded-circle'></p>"+
                                                "<p>书名："+book.bookName+"</p>"+"<p>数量："+book.numbers+"</p>"+"<p>总价："+book.sumPrice+"</p>"+
                                                "<p>添加时间："+book.orderTime+"</p>"+"<button class='btn btn-danger' id='delOrder' value='"+book.orderId+"'>删除</button>"+
                                                "</div>";

                                        });
                                        $("#myCarts").html(n);
                                        console.log(data);

                                    }
                                });
                                // window.location.reload();
                            }else {
                                alert("删除失败！")
                            }
                        }

                    });
                });

        });



        /*---------登录的验证---------*/
        //验证账号
        function accountCheck() {
            let reg = /^\d{11}$/;
            let account = $("#account").val();
            if(!reg.test(account) || account==''){
                $(".account").html("<span class='red'>请输入正确的账号</span>")
                $("#isAccount").val(false);
            }else{
                $(".account").css("color","green");
                $(".account").css("font-size","25px");
                $(".account").text('√');
                $("#isAccount").val(true);
            }
        }

        //验证密码字段
        function accountPwdCheck() {
            let reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\s\S]{8,16}$/;
            let accountPwd = $("#accountPwd").val();
            if(!reg.test(accountPwd) || accountPwd==''){
                $(".accountPwd").html("<span class='red'>请输入8-16位密码（含大小写字母）</span>")
                $("#isAccountPassword").val(false);
            }else{
                $(".accountPwd").css("color","green");
                $(".accountPwd").css("font-size","25px");
                $(".accountPwd").text('√');
                $("#isAccountPassword").val(true);
            }
        }

        //确认验证码
        function accountVCodeTextCheck() {
            if ($("#accountVCodeText").val()==''){
                $(".accountVCodeText").html("<span class='red'>验证码为空！</span>")
                $("#isAccountCode").val(false);
            }else if($("#accountVCodeText").val()!=''){
                $(".accountVCodeText").html("<span class='red'></span>")
                $("#isAccountCode").val(true);
            }
        }



        /*-----------注册的验证判断-----------*/

        //验证用户名
        function userNameCheck(str) {
            let reg = /^[a-zA-Z0-9_-]{4,16}$/;
            let userName = $("#userName").val();
            if(!reg.test(userName) || userName==''){
                $(".userName").html("<span class='red'>请输入4-6位的用户名</span>")
                $("#registerUserName").val(false);
            }else{
                $(".userName").css("color","green");
                $(".userName").css("font-size","25px");
                $(".userName").text('√');
                $("#registerUserName").val(true);
            }
        }

        //验证电话
        function telCheck(str) {
            let reg = /^\d{11}$/;
            let tel = $("#tel").val();
            if(!reg.test(tel) || tel==''){
                $(".tel").html("<span class='red'>请输入11位电话号码</span>")
                $("#registerPhone").val(false);
            }else{
                $(".tel").css("color","green");
                $(".tel").css("font-size","25px");
                $(".tel").text('√');
                $("#registerPhone").val(true);
            }
        }
        //验证邮箱字段
        function emailCheck(str) {
            let reg = /^\w{3,12}@\w{1,5}\.[a-z]{2,3}$/;
            let email = $("#email").val();
            if(!reg.test(email) || email==''){
                $(".email").html("<span class='red'>请输入正确的邮箱</span>")
                $("#registerMail").val(false);
            }else{
                $(".email").css("color","green");
                $(".email").css("font-size","25px");
                $(".email").text('√');
                $("#registerMail").val(true);
            }
        }
        //验证密码字段
        function pwdCheck(str) {
            let reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\s\S]{8,16}$/;
            let pwd = $("#pwd").val();
            if(!reg.test(pwd) || pwd==''){
                $(".pwd").html("<span class='red'>请输入8-16位密码（含大小写字母）</span>")
                $("#registerPwd").val(false);
            }else{
                $(".pwd").css("color","green");
                $(".pwd").css("font-size","25px");
                $(".pwd").text('√');
                $("#registerPwd").val(true);
            }
        }
        //确认密码
        function pwdSure() {
            if ($("#pwd").val() == $("#pwd1").val()) {
                $(".pwd1").css("color","green");
                $(".pwd1").css("font-size","25px");
                $(".pwd1").text('√');
                $("#registerPwd2").val(true);
            } else {
                $(".pwd1").html("<span class='red'>两次密码输入不一致</span>")
                $("#registerPwd2").val(false);
            }
        }

        //确认验证码
        function codeCheck() {
            if ($("#vCodeText").val()==''){
                $(".vCodeText").html("<span class='red'>验证码为空！</span>")
                $("#registerCode").val(false);
            }else if($("#vCodeText").val()!=''){
                $(".vCodeText").html("<span class='red'></span>")
                $("#registerCode").val(true);
            }
        }

        /*------修改信息的判断-----*/
        function updateUserNameCheck(str) {
            let reg = /^[a-zA-Z0-9_-]{4,16}$/;
            let userName = $("#updataUserName").val();
            if(!reg.test(userName) || userName==''){
                $(".updataUserName").html("<span class='red'>请输入4-6位的用户名</span>")
                $("#isUpdataUserName").val(false);
            }else{
                $(".updataUserName").css("color","green");
                $(".updataUserName").css("font-size","25px");
                $(".updataUserName").text('√');
                $("#isUpdataUserName").val(true);
            }
        }
        //验证邮箱字段
        function updateEmailCheck(str) {
            let reg = /^\w{3,12}@\w{1,5}\.[a-z]{2,3}$/;
            let email = $("#updataUserEmail").val();
            if(!reg.test(email) || email==''){
                $(".updataUserEmail").html("<span class='red'>请输入正确的邮箱</span>")
                $("#isUpdateEmail").val(false);
            }else{
                $(".updataUserEmail").css("color","green");
                $(".updataUserEmail").css("font-size","25px");
                $(".updataUserEmail").text('√');
                $("#isUpdateEmail").val(true);
            }
        }

        //验证密码字段
        function updateUserPwdCheck(str) {
            let reg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[\s\S]{8,16}$/;
            let pwd = $("#updateUserPwd").val();
            if(!reg.test(pwd) || pwd==''){
                $(".updateUserPwd").html("<span class='red'>请输入8-16位密码（含大小写字母）</span>")
                $("#isUpdateUserPwd").val(false);
            }else{
                $(".updateUserPwd").css("color","green");
                $(".updateUserPwd").css("font-size","25px");
                $(".updateUserPwd").text('√');
                $("#isUpdateUserPwd").val(true);
            }
        }
        //确认密码
        function updateUserPwdSure() {
            if ($("#updateUserPwd1").val() == $("#updateUserPwd").val()) {
                $(".updateUserPwd1").css("color","green");
                $(".updateUserPwd1").css("font-size","25px");
                $(".updateUserPwd1").text('√');
                $("#isUpdateUserPwd1").val(true);
            } else {
                $(".updateUserPwd1").html("<span class='red'>两次密码输入不一致</span>")
                $("#isUpdateUserPwd1").val(false);
            }
        }

    </script>
</head>
<body>
<!--头部导航条-->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="#"><img src="img/logo.jpg" width="80px" height="50px"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">首页</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">淘好书</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">价格榜</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">销量版</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">作者预览</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">联系我们</a>
            </li>
            <li class="nav-item">
                <div class="container mt-3">

                        <div class="input-group mt-3 mb-3">
                            <input type="text" class="form-control" size="50px" style="background-color: #f0ece5;" id="keyword">
                            <div class="input-group-prepend">
                                <button type="button" class="btn btn-info " id="selectButton">
                                    <a  href="${pageContext.request.contextPath}/book/selectKeyword" target="mainFrame" id="select">搜索</a>
                                </button>
                            </div>
                        </div>

                </div>
            </li>
            <li class="nav-item" style="margin-left: 30px;line-height: 25px">
<%--                <a class="nav-link"  style="color: green;font-family: 隶书" href="${pageContext.request.contextPath}/user/registerView">登录</a>--%>
                    <c:if test="${user == null}">
                        <a href="#" class="nav-link" style="font-size: 18px;color: #00bf19" data-toggle="modal" data-target="#myModa2">
                            登录
                        </a>
                    </c:if>
                    <c:if test="${user != null}">
                        <input type="hidden" value="${user.userId}" id="userId"/>
                        <div class="dropdown">
                            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
                                <img src="img/${user.userImage}" width="50px" height="50px" class="rounded-circle" alt="Cinque Terre" style="margin-right: 5px">${user.userName}
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#" id="selectUser" data-toggle="modal" data-target="#myModaSelectUser"><i class="fa fa-user" style="font-size:24px"></i><span style="margin-left: 10px">个人信息</span></a>
                                <a class="dropdown-item" href="#" id="updateUserPassword" data-toggle="modal" data-target="#updatePwd"><i class="fa fa-lock" style="font-size:24px"></i><span style="margin-left: 10px">修改密码</span></a>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#myModaUpdateUser"><i class="fa fa-pencil" style="font-size:24px"></i><span style="margin-left: 10px">修改信息</span></a>
                                <a class="dropdown-item" id="shoppingCart" href="#" data-toggle="modal" data-target="#myShoppingCarts"><i class="fa fa-cart-arrow-down" style="font-size:24px"></i><span style="margin-left: 10px">我的购物车</span></a>
                                <a class="dropdown-item" href="${pageContext.request.contextPath}/user/exit"><i class="fa fa-grav" style="font-size:24px"></i><span style="margin-left: 10px">安全退出</span></a>
                            </div>
                        </div>
                    </c:if>

            </li>
            <li class="nav-item">
                <a href="#" class="nav-link" style="font-size: 18px;color: #005cbf" data-toggle="modal" data-target="#myModal">
                    注册账号
                </a>
            </li>




        </ul>
    </div>
</nav>

<!--
	作者：offline
	时间：2019-12-09
	描述：轮播图
-->
<div style="width: 100%;background-color: #8a6d3b21;">
    <div id="demo" class="carousel slide sideshow-img" data-ride="carousel">
        <!-- 指示符 -->
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>

        <!-- 轮播图片 -->
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/235.jpg">
            </div>
            <div class="carousel-item">
                <img src="img/book2.jpg">
            </div>
            <div class="carousel-item">
                <img src="img/book3.jpg">
            </div>
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



<!--内容页面-->
<div class="container-fluid">
    <div class="row">

        <!--
            作者：offline
            时间：2019-12-08
            描述：左边框架
        -->
        <div class="col-sm-2" style="background-color:#8564040f;">

            <!--文学类-->
            <p class="p1">文学类</p>
            <table  class="table table-striped" id="table1">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=文学小说&pageNum=1&pageSize=18" target="mainFrame">文学小说</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=青春文学&pageNum=1&pageSize=18" target="mainFrame" >青春文学</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=中国散文&pageNum=1&pageSize=18" target="mainFrame">中国散文</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=文学理论&pageNum=1&pageSize=18" target="mainFrame">文学理论</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=世界名著&pageNum=1&pageSize=18" target="mainFrame">世界名著</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=武侠小说&pageNum=1&pageSize=18" target="mainFrame">武侠小说</a></td>
                </tr>
            </table>

            <!--社科类-->
            <p class="p1">社科类</p>
            <table  class="table table-striped">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=历史&pageNum=1&pageSize=18" target="mainFrame">历史</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=宗教&pageNum=1&pageSize=18" target="mainFrame">宗教</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=政治军事&pageNum=1&pageSize=18" target="mainFrame">政治军事</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=社会科学&pageNum=1&pageSize=18" target="mainFrame">社会科学</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=哲学&pageNum=1&pageSize=18" target="mainFrame">哲学</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=传记&pageNum=1&pageSize=18" target="mainFrame">传记</a></td>
                </tr>
            </table>

            <!--少儿类-->
            <p class="p1">少儿类</p>
            <table  class="table table-striped">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=中国儿童文学&pageNum=1&pageSize=18" target="mainFrame">中国儿童文学</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=外国儿童文学&pageNum=1&pageSize=18" target="mainFrame">外国儿童文学</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=科普读物&pageNum=1&pageSize=18" target="mainFrame">科普读物</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=少儿漫画&pageNum=1&pageSize=18" target="mainFrame">少儿漫画</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=动漫卡通&pageNum=1&pageSize=18" target="mainFrame">动漫卡通</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=文学小说&pageNum=1&pageSize=18" target="mainFrame">幼儿启蒙</a></td>
                </tr>
            </table>

            <!--生活类-->
            <p class="p1">生活类</p>
            <table  class="table table-striped">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=美食&pageNum=1&pageSize=18" target="mainFrame">美食</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=旅游&pageNum=1&pageSize=18" target="mainFrame">旅游</a></td>
                </tr>

                <tr>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=心理将康&pageNum=1&pageSize=18" target="mainFrame">心理将康</a></td>
                    <td><a href="${pageContext.request.contextPath}/book/bookTypeName?typeName=家居休闲&pageNum=1&pageSize=18" target="mainFrame">家居休闲</a></td>
                </tr>

            </table>
        </div>

        <!--
            作者：offline
            时间：2019-12-08
            描述：中间框架
        -->
        <div class="col-sm-10" style="padding: 0px" id="bi">
            <iframe name="mainFrame" width="100%" height="100%" scrolling="auto" noresize="noresize" src="${pageContext.request.contextPath}/book/goSelectAll" style="border: none;"></iframe>
        </div>


    </div>
</div>


    <!-- 登录模态框 -->
    <div class="modal fade" id="myModa2">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- 模态框头部 -->
                <div class="modal-header">
                    <h2 style="font-family: 隶书;text-align: center;">
                        欢迎登录
                    </h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- 模态框主体 -->
                <div class="modal-body">

                    <form>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">账号</span>
                            </div>
                            <input type="text" id="account" class="form-control" placeholder="请输入手机号" onblur="accountCheck()"/> <span class="account"></span><br/>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">密码</span>
                            </div>
                            <input type="password" id="accountPwd" class="form-control" onblur="accountPwdCheck()" placeholder="请输入密码有大小写字母，数字，和特殊符号" /><span class="accountPwd"></span><br/>
                        </div>

                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">验证码</span>
                            </div>
                            <input type="text" id="accountVCodeText" onblur="accountVCodeTextCheck()"/><br/>
                            <img src="${pageContext.request.contextPath }/getVerifyCode" width="100px" height="40px" id="verifyCodeImage2" style="margin-left: 20px">
                            <span class="accountVCodeText" style="color: red;line-height: 30px;margin-left: 20px;">${isCode}</span>
                        </div>

                        <p style="text-align: center;margin-top: 10px;">
                            <button type="button" class="btn btn-success" id="accountSub" style="width: 100px;margin-right: 50px;">登录</button>
                            <button type="reset " class="btn btn-secondary" style="width: 80px;">重置</button>
                        </p>
                        <input type="hidden" id="isAccount" value="false"/>
                        <input type="hidden" id="isAccountPassword" value="false"/>
                        <input type="hidden" id="isAccountCode" value="false"/>
                    </form>

                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" id="closeModal1" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>

            </div>
        </div>
    </div>


<!-- 注册模态框 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h2 style="font-family: 隶书;text-align: center;margin-left: 36%;">注册账号</h2>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">

                <form>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">昵称</span>
                        </div>
                        <input type="text" id="userName" class="form-control" placeholder="请输入昵称" onblur="userNameCheck()"/> <span class="userName"></span><br/>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">头像</span>
                        </div>
                        <input type="file" id="userIamge"/>
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">电话</span>
                        </div>
                        <input type="text" id="tel" class="form-control" placeholder="请输入手机号" onblur="telCheck()"/> <span class="tel"></span><br/>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">邮箱</span>
                        </div>
                        <input type="email" id="email" class="form-control"  placeholder="ex:123456@qq.com"  onblur="emailCheck()"/><span class="email"></span><br/>
                    </div>


                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">密码</span>
                        </div>
                        <input type="password" id="pwd" class="form-control" placeholder="请输入密码有大小写字母，数字，和特殊符号" onblur="pwdCheck()"/><span class="pwd"></span><br/>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">确认密码</span>
                        </div>
                        <input type="password" id="pwd1" class="form-control" placeholder="请再次输入密码"  onblur="pwdSure()"/> <span class="pwd1"></span><br/>
                    </div>


                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">性别</span>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline"style="padding-top: 8px;margin-left: 20px">
                            <input type="radio" class="custom-control-input" id="customRadio1" name="sex" value="男"/>
                            <label class="custom-control-label" for="customRadio1">男</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline" style="padding-top: 8px;margin-left: 20px">
                            <input type="radio" class="custom-control-input" id="customRadio2" name="sex" value="女"/>
                            <label class="custom-control-label" for="customRadio2" style="margin-right: 40px">女</label>
                        </div>

                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">验证码</span>
                        </div>
                        <input id="vCodeText" onblur="codeCheck()"/><br/>
                        <img src="${pageContext.request.contextPath }/getVerifyCode" width="100px" height="40px" id="verifyCodeImage" style="margin-left: 20px">
                        <span class="vCodeText" style="color: red;line-height: 30px;margin-left: 20px;">${isCode}</span>
                    </div>

                    <p style="text-align: center;margin-top: 10px;">
                        <button type="button" class="btn btn-success" id="accountRegister" style="width: 100px;margin-right: 50px;">注册</button>
                        <button type="reset " class="btn btn-secondary" style="width: 80px;">重置</button>
                    </p>
                        <input id="registerUsertime" type="hidden" value="<%=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime())%>"/>
                        <input id="registerUserName" type="hidden" value="false"/>
                        <input id="registerPhone" type="hidden" value="false"/>
                        <input id="registerMail" type="hidden" value="false"/>
                        <input id="registerPwd" type="hidden" value="false"/>
                        <input id="registerPwd2" type="hidden" value="false"/>
                        <input id="registerCode" type="hidden" value="false"/>
                </form>

            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" id="closeModal2" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>


<!-- 个人信息模态框 -->
<div class="modal fade" id="myModaSelectUser">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">个人信息</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body" id="userMessage">

            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>


<!-- 个人修改信息模态框 -->
<div class="modal fade" id="myModaUpdateUser">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">修改信息</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body" >
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">昵称</span>
                    </div>
                    <input type="text" id="updataUserName" class="form-control" placeholder="请输入4-6位昵称" value="${user.userName}"  onblur="updateUserNameCheck()"/> <span class="updataUserName"></span><br/>
                    <input type="hidden" id="isUpdataUserName" value="true">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">更换头像</span>
                    </div>
                    <input type="file" id="updateImage" style="padding-top: 5px;margin-left: 15px"/>
                    <input type="hidden" id="userImage" value="${user.userImage}">
                </div>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">账号</span>
                    </div>
                    <input type="text" id="updateUserPhone" class="form-control" value="${user.userPhone}" readonly="readonly"/><br/>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">邮箱</span>
                    </div>
                    <input type="email" id="updataUserEmail" value="${user.userEmail}" class="form-control"  placeholder="ex:123456@qq.com"  onblur="updateEmailCheck()"/><span class="updataUserEmail"></span><br/>
                    <input type="hidden" id="isUpdateEmail" value="true"/>
                </div>

                <p style="text-align: center"><button type="button" class="btn btn-secondary" id="updateSub">提交</button></p>
            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" id="closeUpdate" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

<!-- 修改密码模态框 -->
<div class="modal fade" id="updatePwd">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">修改密码</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">密码</span>
                    </div>
                    <input type="password" id="updateUserPwd" class="form-control" placeholder="请输入密码有大小写字母，数字，和特殊符号" onblur="updateUserPwdCheck()"/><span class="updateUserPwd"></span><br/>
                    <input type="hidden" id="isUpdateUserPwd" value="false"/>
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">确认密码</span>
                    </div>
                    <input type="password" id="updateUserPwd1" class="form-control" placeholder="请再次输入密码"  onblur="updateUserPwdSure()"/> <span class="updateUserPwd1"></span><br/>
                    <input type="hidden" id="isUpdateUserPwd1" value="false"/>
                </div>
            </div>
            <p style="text-align: center"><button type="button" class="btn btn-secondary" id="updatePwdSub">确定修改</button></p>
            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" id="closeUpdatePwd" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

<!-- 查询购物车模态框 -->
<div class="modal fade" id="myShoppingCarts">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">我的购物车</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body" id="myCarts">

            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>
<!--底部导航条-->
<p style="height: 20px;padding: 0;"></p>
<p class="fixed-bottom p-bottom">此网站仅用于完成课件作业，锻炼个人技术，如有侵权，请联系我们及时删除，谢谢！</p>
</body>
</html>
