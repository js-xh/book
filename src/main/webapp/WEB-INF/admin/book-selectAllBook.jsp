<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Js
  Date: 2019/12/7
  Time: 22:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>查看图书的全部信息页面</title>

	<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		$(function(){
			$("#tbodyId").on("click", "#delBook", function() {
				var d = $(this).parent().siblings().first().text();
				alert("删除："+d);
				$.ajax({
					type:"get",
					url:"${pageContext.request.contextPath}/book/deleteBook",
					contentType:"application/json;charset=utf-8",
					data:{
						bookId:$(this).parent().siblings().first().text()
					},
					dataType:"json",
					success:function(data){
						if(data !=null){
							alert("成功删除了"+data+"条数据。");
						}
					}
				});
			});

			// 模糊查询

            $("#keyBtn").click(function () {
            var b = $("#keyword").val();
            alert(b);
                $.ajax({
                	type:"get",
                	url:"${pageContext.request.contextPath}/book/selectKeyword",
                	data:{
                	keyword:$("#keyword").val()
                	},
                    dataType:"json",
                    success:function(data){
                       alert(data)
                    }
                });
            })
		});
	</script>
</head>
<body>
	<p>
		<input type="text" id="keyword"/><button id="keyBtn">提交</button>
	</p>
	<ul>
	<c:forEach var="bookAsstis" items="${list}">
		<li style="border: 1px red solid; float: left;margin: 10px 0 0 20px;text-align: center;list-style-type: none">
            <a href="${pageContext.request.contextPath}/book/selectByBookId?bookId=${bookAsstis.bookId}"><img src="../${bookAsstis.bookImage}" width="200px"/></a>
            <p>${bookAsstis.bookName}</p>
            <p>${bookAsstis.authorName}</p>
            <p>${bookAsstis.bookPrice}</p>
        </li>
	</c:forEach>
    </ul>

	
</body>
</html>
