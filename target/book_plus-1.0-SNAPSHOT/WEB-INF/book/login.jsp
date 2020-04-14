<%--
  Created by IntelliJ IDEA.
  User: Js
  Date: 2019/12/8
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/film.css" />
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${pageContext.request.contextPath}/js/film.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
    	$(function(){
    		$("#butn").click(function(){
    			var usern = $("#userName").val();
    			alert("登录账号："+usern);
    			$.ajax({
    				type:"post",
    				url:"${pageContext.request.contextPath}/login",
    				data:{
    					userName:$("#userName").val(),
    					userPassword:$("#userPassword").val()
    				},
					dataType:"json",
    				success:function(data){
    					if(data !=null){
    						alert("后台返回的数据："+data);
    						alert("登录成功！");
    						window.location.href="${pageContext.request.contextPath}/book/doIndex";
    					 }
    				}
    			});
    		})
    	})
    </script>
</head>
<body>
	<p>
		用户：<input type="text" id="userName"/>
	</p>
	<p>
		密码：<input type="password" id="userPassword"/>
	</p>
	<p>
		<button id="butn">提交</button>
	</p>
</body>
</html>
