<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 16:12
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
        int y = (int) session.getAttribute("oyear");
        String u = (String) session.getAttribute("user");
        int d = (int) session.getAttribute("ouserid");
    }
    catch(Exception e){%>
<script>
    alert("请先登录！");
    window.location="login.jsp";
</script>
<%}%>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");//动态加载mysql驱动
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","123456");
    Statement stmt =conn.createStatement();
//    String bname = new String((request.getParameter("lname")).getBytes("ISO-8859-1"),"UTF-8");
//    String btype = new String((request.getParameter("ltype")).getBytes("ISO-8859-1"),"UTF-8");
//    String bauth = new String((request.getParameter("lauth")).getBytes("ISO-8859-1"),"UTF-8");
//    List<book> books = new bookimpl().searchbook(bname,btype,bauth);
%>
<%--<%--%>
<%--    Object user = session.getAttribute("user");--%>
<%--    out.println("欢迎"+user);--%>
<%--%>--%>
<table class="table table-hover">
    <tr>
        <td>图书id</td>
        <td>图书名称</td>
        <td>图书类型</td>
        <td>作者</td>
        <td>出版时间</td>
        <td>出版社</td>
        <td>价格</td>
        <td>库存量</td>
    </tr>

    <c:forEach var="f" items="${list}">
        ${f.toSString()}
    </c:forEach>

</table>
</body>
</html>
