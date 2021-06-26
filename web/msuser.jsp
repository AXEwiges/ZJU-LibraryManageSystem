<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 20:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="Base.impl.bookimpl" %>
<%@ page import="model.book"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
    try{
        String u = (String) session.getAttribute("muser");
        int d = (int) session.getAttribute("muserid");
    }
    catch(Exception e){%>
<script>
    alert("请先登录！");
    window.location="manage.jsp";
</script>
<%}%>
<%int i = 1;%>
<table class="table table-hover">
    <tr>
        <td>序号</td>
        <td>用户id</td>
        <td>用户名</td>
        <td>注册时间</td>
    </tr>
    <c:forEach var="f" items="${list}">
        <tr><td>
            <%=i%>
            <%i++;%>
        </td>
                ${f.toSSString()}
    </tr>
    </c:forEach>

</table>
</body>
</html>
