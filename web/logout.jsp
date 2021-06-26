<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/11
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.sql.*"%>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.lang.Object" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page session="true" language="java" %>
<html>
<head>
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
    session.removeAttribute("user");
    session.removeAttribute("ouserid");
    session.removeAttribute("oyear");
    session.removeAttribute("opass");
    int k = 1;
    if(k == 1){%>
    <script type="text/javascript">
        alert("已退出！");
        window.location="login.jsp";
    </script>
    <%}
%>

</body>
</html>
