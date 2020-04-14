<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/15
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>管理员主页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#verifyCodeImage").click(function() {

                /* js负责验证码的刷新 */

                <%--window.location.href="${pageContext.request.contextPath }/user/registerView"--%>
                var imgEle = $("#verifyCodeImage");
                imgEle.src = "${pageContext.request.contextPath }/getVerifyCode?"+ new Date().getTime();
                $("#verifyCodeImage").attr("src", imgEle.src);
            })

        })
        function sub() {
            //如果全部输入正确返回成功  输入错误则输出提示
            if(nameCheck() && telCheck() && emailCheck() && pwdCheck() && pwdSure()){
                return true;
            }else{
                return false;
            }
        }
        //验证姓名字段
        function nameCheck() {
            let reg = /^[a-zA-Z0-9_-]{4,16}$/;
            let name = $("#name").val();
            if (!reg.test(name) || name=='') {
                $(".name").html("<span class='red'>请输入4到16位（字母，数字，下划线，减号）</span>");
                return false;
            }else{
                $(".name").css("color","green");
                $(".name").css("font-size","25px");
                $(".name").text('√');
                return true;
            }
        }
        //验证电话
        function telCheck(str) {
            let reg = /^\d{11}$/;
            let tel = $("#tel").val();
            if(!reg.test(tel) || tel==''){
                $(".tel").html("<span class='red'>请输入11位电话号码</span>")
                return false;
            }else{
                $(".tel").css("color","green");
                $(".tel").css("font-size","25px");
                $(".tel").text('√');
                return true;
            }
        }
        //验证邮箱字段
        function emailCheck(str) {
            let reg = /^\w{3,12}@\w{1,5}\.[a-z]{2,3}$/;
            let email = $("#email").val();
            if(!reg.test(email) || email==''){
                $(".email").html("<span class='red'>请输入正确的邮箱</span>")
                return false;
            }else{
                $(".email").css("color","green");
                $(".email").css("font-size","25px");
                $(".email").text('√');
                return true;
            }
        }
        //验证密码字段
        function pwdCheck(str) {
            let reg = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
            let pwd = $("#pwd").val();
            if(!reg.test(pwd) || pwd==''){
                $(".pwd").html("<span class='red'>请输入6-12位密码</span>")
                return false;
            }else{
                $(".pwd").css("color","green");
                $(".pwd").css("font-size","25px");
                $(".pwd").text('√');
                return true;
            }
        }
        //确认密码
        function pwdSure() {
            if ($("#pwd").val() == $("#pwd1").val()) {
                $(".pwd1").css("color","green");
                $(".pwd1").css("font-size","25px");
                $(".pwd1").text('√');
                return true;
            } else {
                $(".pwd1").html("<span class='red'>两次密码输入不一致</span>")
                return false;
            }
        }

        //确认验证码
        function codeCheck() {
            if ($("#vCodeText").val()==''){
                $(".vCodeText").html("<span class='red'>验证码为空！</span>")
                return false;
            }else if($("#vCodeText").val()!=''){
                $(".vCodeText").html("<span class='red'></span>")
            }
        }


        /* ------------登录的jQuery判断-------------*/

        function accountSub() {
            //如果全部输入正确返回成功  输入错误则输出提示
            if(accountCheck() && emailCheck() && pwdCheck() && pwdSure()){
                return true;
            }else{
                return false;
            }
        }

        //验证账号
        function accountCheck(str) {
            let reg = /^\d{11}$/;
            let account = $("#account").val();
            if(!reg.test(account) || account==''){
                $(".account").html("<span class='red'>请输入正确的账号</span>")
                return false;
            }else{
                $(".account").css("color","green");
                $(".account").css("font-size","25px");
                $(".account").text('√');
                return true;
            }
        }

        //验证密码字段
        function accountPwd(str) {
            let reg = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
            let accountPwd = $("#accountPwd").val();
            if(!reg.test(accountPwd) || accountPwd==''){
                $(".accountPwd").html("<span class='red'>请输入6-12位密码</span>")
                return false;
            }else{
                $(".accountPwd").css("color","green");
                $(".accountPwd").css("font-size","25px");
                $(".accountPwd").text('√');
                return true;
            }
        }

        //确认验证码
        function accountVCodeTextCheck() {
            if ($("#accountVCodeText").val()==''){
                $(".accountVCodeText").html("<span class='red'>验证码为空！</span>")
                return false;
            }else if($("#accountVCodeText").val()!=''){
                $(".accountVCodeText").html("<span class='red'></span>")
            }
        }
    </script>
    <style>
        .red{
            color: red;
            font-size: 18px;
        }

        .loginBox{
            width: 500px;
            height: 500px;
            margin: auto;
            border: red;
            margin-top: 15%;
        }

        body{
            background: url(../img/324855.jpg) 100% 100% no-repeat;
        }

    </style>
</head>
<body>


<div class="loginBox">
    <h2 style="font-family: 隶书;text-align: center;">
        欢迎登录
    </h2>
    <form:form modelAttribute="user" action="${pageContext.request.contextPath}/user/login" onsubmit="accountSub()" method="post">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">账号</span>
            </div>
            <form:input path="phone" id="account" class="form-control" placeholder="请输入手机号" onblur="accountCheck()"/> <span class="account"></span><br/>
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">密码</span>
            </div>
            <form:password path="password" id="accountPwd" class="form-control" placeholder="请输入密码有大小写字母，数字，和特殊符号" onblur="accountPwdCheck()"/><span class="accountPwd"></span><br/>
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">验证码</span>
            </div>
            <form:input path="code" id="accountVCodeText" onblur="accountVCodeTextCheck()"/><br/>
            <img src="${pageContext.request.contextPath }/getVerifyCode" width="100px" height="40px" id="verifyCodeImage" style="margin-left: 20px">
            <span class="accountVCodeText" style="color: red;line-height: 30px;margin-left: 20px;">${isCode}</span>
        </div>

        <p style="text-align: center;margin-top: 10px;">
            <button type="submit" class="btn btn-success" onclick="accountSub()" style="width: 100px;margin-right: 50px;">登录</button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                注册账号
            </button>
        </p>
    </form:form>

</div>




<!-- 模态框 -->
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

                <form:form modelAttribute="user" action="${pageContext.request.contextPath}/user/register" onsubmit="sub()" method="post">
                    <%--                    <div class="input-group mb-3">--%>
                    <%--                        <div class="input-group-prepend">--%>
                    <%--                            <span class="input-group-text">账号</span>--%>
                    <%--                        </div>--%>
                    <%--                        <form:input path="userName" id="name" class="form-control" placeholder="请输入账号" onblur="nameCheck()"/><span class="name"></span>--%>
                    <%--                    </div>--%>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">电话</span>
                        </div>
                        <form:input path="phone" id="tel" class="form-control" placeholder="请输入手机号" onblur="telCheck()"/> <span class="tel"></span><br/>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">邮箱</span>
                        </div>
                        <form:input path="mail" id="email" class="form-control"  placeholder="ex:123456@qq.com"  onblur="emailCheck()"/><span class="email"></span><br/>
                    </div>


                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">密码</span>
                        </div>
                        <form:password path="password" id="pwd" class="form-control" placeholder="请输入密码有大小写字母，数字，和特殊符号" onblur="pwdCheck()"/><span class="pwd"></span><br/>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">确认密码</span>
                        </div>
                        <form:password path="" id="pwd1" class="form-control" placeholder="请再次输入密码"  onblur="pwdSure()"/> <span class="pwd1"></span><br/>
                    </div>


                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">性别</span>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline"style="padding-top: 8px;margin-left: 20px">
                            <form:radiobutton path="sex" class="custom-control-input" id="customRadio1" name="sex" value="男"/>
                            <label class="custom-control-label" for="customRadio1">男</label>
                        </div>
                        <div class="custom-control custom-radio custom-control-inline" style="padding-top: 8px;margin-left: 20px">
                            <form:radiobutton path="sex" class="custom-control-input" id="customRadio2" name="sex" value="女"/>
                            <label class="custom-control-label" for="customRadio2" style="margin-right: 40px">女</label>
                            <form:errors path="sex" cssStyle="color: red"/>
                        </div>

                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">验证码</span>
                        </div>
                        <form:input path="code" id="vCodeText" onblur="codeCheck()"/><br/>
                        <img src="${pageContext.request.contextPath }/getVerifyCode" width="100px" height="40px" id="verifyCodeImage" style="margin-left: 20px">
                        <span class="vCodeText" style="color: red;line-height: 30px;margin-left: 20px;">${isCode}</span>
                    </div>

                    <p style="text-align: center;margin-top: 10px;">
                        <button type="submit" class="btn btn-success" onclick="sub()" style="width: 100px;margin-right: 50px;">注册</button>
                        <button type="reset " class="btn btn-secondary" onclick="reset()" style="width: 80px;">重置</button>
                    </p>

                </form:form>

            </div>

            <!-- 模态框底部 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>
</div>

</body>
</html>
