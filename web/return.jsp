<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/11
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.sql.*"%>
<%@ page import="jakarta.servlet.http.Cookie" %>
<html>
<head>
    <%--    <link type="text/css" href="./bootstrap-3.4.1/css/bootstrap.css" rel="stylesheet">--%>
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

%>
<nav class="navbar navbar-default navbar-inverse navbar-static-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">图书管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="./index.jsp">图书查询</a></li>
                <li><a href="./borrow.jsp">图书借阅</a></li>
                <li  class="active"><a href="./return.jsp">图书归还<span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">菜单 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="./info.jsp">个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="./help.jsp">使用帮助</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="./logout.jsp">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <%--<ul class="nav nav-tabs">--%>
    <%--    <li role="presentation" class="active"><a href="#">Home</a></li>--%>
    <%--    <li role="presentation"><a href="#">Profile</a></li>--%>
    <%--    <li role="presentation"><a href="#">Messages</a></li>--%>
    <%--</ul>--%>
</div>
<div class="col-lg-12"></div>
<div class="col-lg-12"></div>
<div class="container" style="width: 350px;">
    <form id="aorb" action="./returnback.jsp" method="post">
        <input type="hidden" class="form-control" name="userid" placeholder="用户ID" value=<%=session.getAttribute("user")%>>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">图书ID</div>
                <input type="text" class="form-control" name="bookid" placeholder="图书ID">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">用户密码</div>
                <input type="text" class="form-control" name="password" placeholder="用户密码">
            </div>
        </div>
        <%--        <div class="from-control text-center" style="margin-top: 25px;">--%>
        <%--            <label>--%>
        <%--                <input type="radio" name="borrow" value="borrow" checked>--%>
        <%--                <span>借书</span>--%>
        <%--            </label>--%>
        <%--            <label>--%>
        <%--                <input type="radio" name="return" value="return">--%>
        <%--                <span>还书</span>--%>
        <%--            </label>--%>
        <%--        </div>--%>
        <div class="btn-group" style="margin-top: 20px;"  role="group" aria-label="...">
            <button type="submit" id="submit" class="btn btn-info">确定</button>&nbsp;&nbsp;&nbsp;&nbsp;
            <button type="reset" class="btn btn-info">重置</button>
        </div>
    </form>
</div>

</body>
</html>
