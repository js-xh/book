<%--
  Created by IntelliJ IDEA.
  User: Js
  Date: 2019/12/7
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

	<head>
		<title>用ajax传参数页面</title>

		<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({
					type: "get",
					url: "${pageContext.request.contextPath}/book/selectAllBook2",
					dataType: "json",
					success: function(data) {
						var tr = "";

						$.each(data, function(index, book) {
							tr += "<tr><td>" + book.bookId + "</td><td>" + book.bookName +
								"</td><td>" + book.bookTypeName + "</td><td>" + book.authorName + "</td><td>" +
								'<img src=../' + book.bookImage + ' width="100px"/>' + "</td><td>" + book.bookContent + "</td><td>" + book.bookPrice +
								"</td><td>" + book.gradeNumber + "</td><td>" + book.bookReleaseTime +
									"</td><td><button type='button' id='bySelect' class='btn btn-default btn-sm btn-lg'>详细"+
										"</a></button>" + "<button type='button' id='del' class='btn btn-default btn-sm'>" +
									"<span class='glyphicon glyphicon-trash'></span> 删除</button></td></tr>";
						});
						$("#tbodyId").append(tr);
					}
				});
				$("#tbodyId").on("click", "#bySelect", function() {

					var b =$(this).parent().siblings().first().text();
					alert("图书ID："+b);
					$.ajax({
						type:"get",
						url:"${pageContext.request.contextPath}/book/selectByBookId",
						contentType:"application/json;charset=utf-8",
						data:
					{
						bookId:$(this).parent().siblings().first().text()
					}

					});
				
				});
			})
		</script>
	</head>

	<body>
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="text-align: left;"><span class="glyphicon glyphicon-th-list srt"></span>操作信息管理</th>
				</tr>
				<tr>
					<td>编号</td>
					<td>图书名称</td>
					<td>图书类型</td>
					<td>图书作者</td>
					<td>图书封面</td>
					<td>图书简介</td>
					<td>图书价格</td>
					<td>图书评分</td>
					<td>图书发布时间</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody id="tbodyId">

			</tbody>

		</table>

        <h1 style="color: red">你好世界</h1>
	</body>

</html>