<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 22:07
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
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<html>
<head>
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
<%
    Class.forName("com.mysql.cj.jdbc.Driver");//动态加载mysql驱动
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","123456");
    Statement stmt =conn.createStatement();
    request.setCharacterEncoding("utf-8");
    String userid2 = new String(request.getParameter("useridz"));
    String book = new String(request.getParameter("bookid"));
    System.out.println(userid2);
%>
<%
    ResultSet RS_result = stmt.executeQuery("select * from borrow;");
    String Id,B;
    int k = 0;
    int M = 0;
    while(RS_result.next())//RS_result.next()
    {
        k = 0;
        Id = RS_result.getString("userid");
        B = RS_result.getString("bookid");
        if(userid2.equals(Id) && B.equals(book)){
            k = 1;
            String sql = "delete from borrow where userid="+userid2+" and bookid="+book+";";
            System.out.println(sql);
            stmt.executeUpdate(sql);
            break;
        }
    }


    if(k == 1){%>
<script type="text/javascript">
    alert("成功！");
    window.location="managebook";
</script>
<%}
else{  %>
<script type="text/javascript">
    alert("失败！请重试或检查库存");
    window.location="managebook";
</script>
<% }%>

</body>
</html>
