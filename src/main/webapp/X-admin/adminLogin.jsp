<%--
  Created by IntelliJ IDEA.
  User: Js
  Date: 2019/12/29
  Time: 0:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>
        后台登录页面
    </title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="./css/x-admin.css" media="all">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function() {
            $("#subt").click(function() {
                $.ajax({
                    type: "post",
                    url: "http://localhost:8080/adminLogin",
                    data: {
                        adminName: $("#adminName").val(),
                        adminPassword: $("#adminPassword").val()
                    },
                    dataType: "json",
                    success: function(data) {
                        if(data == 1) {
                            alert("登录成功！");
                            window.location.href="list.jsp";
                        } else if(data == 0) {
                            alert("登录失败！");
                        }
                    }
                });
            });
        });
    </script>
</head>
<body style="background-color: #393D49">
<div class="x-box">
    <div class="x-top">
        <i class="layui-icon x-login-close">
            &#x1007;
        </i>
        <ul class="x-login-right">
            <li style="background-color: #F1C85F;" color="#F1C85F">
            </li>
            <li style="background-color: #EA569A;" color="#EA569A">
            </li>
            <li style="background-color: #393D49;" color="#393D49">
            </li>
        </ul>
    </div>
    <div class="x-mid">
        <div class="x-avtar">
            <img src="./images/logo.png" alt="">
        </div>
        <div class="input">
            <div class="layui-form-item x-login-box">
                <label class="layui-form-label">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="adminName" required="" lay-verify="username" autocomplete="off" placeholder="username" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item x-login-box">
                <label  class="layui-form-label">
                    <i class="layui-icon">&#xe628;</i>
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="adminPassword" required="" lay-verify="pass" autocomplete="off" placeholder="******" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" id="loginbtn">
                <button class="layui-btn" lay-filter="save" id="subt">
                    登 录
                </button>
            </div>
        </div>
    </div>
</div>
<p style="color:#fff;text-align: center;">Copyright © 2017.Company name All rights X-admin </p>
</body>
</html>
