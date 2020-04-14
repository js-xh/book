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
		<title>管理员查询自己信息页面</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" href="./css/x-admin.css" media="all">
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			$(function() {
				// 自动获取数据并实现分页
				$.ajax({
					type: "get",
					url: "http://localhost:8080/admin/selectByAdmin",
					data: {
						adminName: $("#admin").text()
					},
					dataType: "json",
					success: function(data) {
						alert("ghjsgd");
						console.log("后台数据:" + data)
						var tr = "";
						tr += "<tr><td><input type='checkbox' value='" + data.adminId + "'name='box'></td><td>" + data.adminId + "</td><td>" +
							data.adminName + "</td><td>" + data.adminPassword + "</td><td><img src='../img/" + data.adminImage + "'width='100px'/></td><td>" + data.adminSex + "</td><td>" + data.adminPhone +
							"</td><td><button class='layui-btn layui-btn-normal' data-toggle='modal' data-target='#myModal2' id='up'><i class='layui-icon'></i>编辑</button></td></tr>";

						$('#x-link').html(tr);

					}
				});

				//本页面刷新功能
				$("#refresh").click(function() {
					window.location.reload();
				});

				// 获取要修改的值
				$("#x-link").on("click", "#up", function() {
					var s = $(this).parent().siblings().first().children().val();

					var d1 = $(this).parents().first().prev().text();

					var d2 = $(this).parents().first().prev().prev().text();

					var d3 = $(this).parents().first().prev().prev().prev().prev().text();

					var d4 = $(this).parents().first().prev().prev().prev().prev().prev().text();

					var ink = "<label>管理员账号</label><input id='adminId' type='hidden' value='" + s + "'/><div><input type='text' id='adminName' class='form-control' placeholder='请输入要修改的管理员账号' value='" + d4 + "'/></div>" +
						"<label>管理员密码</label><div><input type='text' id='adminPassword' class='form-control' placeholder='请输入要修改后的密码' value='" + d3 + "'/></div>" +
						"<label>管理员头像</label><div><input type='file' id='myfile'/></div>" +
						"<label>管理员性别</label><div><input type='text' id='adminSex' class='form-control' placeholder='请输入要修改后的性别' value='" + d2 + "'/></div>" +
						"<label>管理员手机号码</label><div><input type='text' id='adminPhone' class='form-control' placeholder='请输入要修改后的手机号码' value='" + d1 + "'/></div>";

					$("#uu").html(ink);

				});

				// 实现修改数据
				$("#upAuthor").on("click", function() {
					alert("mi");
					var formData = new FormData();
					formData.append("adminId", $("#adminId").val());
					formData.append("adminName", $("#adminName").val());
					formData.append("adminPassword", $("#adminPassword").val());
					formData.append("myfile", $("#myfile")[0].files[0]);
					formData.append("adminSex", $("#adminSex").val());
					formData.append("adminPhone", $("#adminPhone").val());
					$.ajax({
						type: "post",
						url: "http://localhost:8080/admin/updateAdmin",
						data: formData,
						processData: false,
						contentType: false,
						dataType: "json",
						success: function(data) {
							if(data == 1) {
								alert("修改成功！");
								window.location.reload();
							} else if(data == 0) {
								alert("修改失败！");
							}
						}
					});
				});

			});
		</script>
	</head>

	<body>
		<div class="x-nav">
			<span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>会员管理</cite></a>
              <a><cite>会员列表</cite></a>
            </span>
			<a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
		</div>
		<div class="x-body">
			
			<xblock></xblock>
			<table class="layui-table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" name="" value="">
						</th>
						<th>
							ID
						</th>
						<th>
							管理员账号
						</th>
						<th>
							密码
						</th>
						<th>
							头像
						</th>
						<th>
							性别
						</th>
						<th>
							手机号码
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody id="x-link">

				</tbody>
			</table>
		</div>

		<!--修改模态框-->
		<div class="container">

			<!-- 模态框 -->
			<div class="modal fade" id="myModal2">
				<div class="modal-dialog">
					<div class="modal-content">

						<!-- 模态框头部 -->
						<div class="modal-header">
							<h4 class="modal-title">修改admin信息</h4>

						</div>

						<!-- 模态框主体 -->
						<div class="modal-body">
							<div class="form-group" id="uu">

							</div>
						</div>
						<!-- 模态框底部 -->
						<div class="modal-footer">
							<button type="button" id="upAuthor" class="btn btn-primary" data-dismiss="modal">提交</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<p id="admin" style="display: none;">${admin.adminName}</p>
	</body>

</html>