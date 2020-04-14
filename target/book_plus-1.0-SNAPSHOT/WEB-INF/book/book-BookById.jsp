<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/8
  Time: 19:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>详情页面</title>
</head>
<body>
    <table>
        <tr>
            <td>编号</td>
            <td>图书名称</td>
            <td>作者</td>
            <td>类型</td>
        </tr>
        <tr>
            <td>${bookAssist.bookId}</td>
            <td>${bookAssist.bookName}</td>
            <td>${bookAssist.bookTypeName}</td>
        </tr>
    </table>
</body>
</html>
