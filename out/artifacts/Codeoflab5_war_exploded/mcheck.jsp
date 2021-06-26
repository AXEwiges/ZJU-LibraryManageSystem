<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.sql.*"%>
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
    Class.forName("com.mysql.cj.jdbc.Driver");//动态加载mysql驱动
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","123456");
    Statement stmt =conn.createStatement();
    String Name = "123",Password = "123";
    String name = new String((request.getParameter("user")).getBytes("ISO-8859-1"),"UTF-8");
    String pass = new String((request.getParameter("password")).getBytes("ISO-8859-1"),"UTF-8");

%>
<%
    //String sql="Insert into gamer(gname,usetime) values('"+name+"','"+score+"')";
    //Statement  pstmt=conn.createStatement();
    //int n = pstmt.executeUpdate(sql);
    ResultSet RS_result = stmt.executeQuery("select * from manage;");
    int Uid = 0;
    int Uyear = 0;
    int k = 0;
    while(RS_result.next())//RS_result.next()
    {
        k = 0;
        Name = RS_result.getString("username");
        Password = RS_result.getString("passwords");
        Uid = RS_result.getInt("userid");
        if(name.equals(Name) && pass.equals(Password)){
            k = 1;
            session.setAttribute("muser", name);
            session.setAttribute("muserid", Uid);
            session.setAttribute("mpass",pass);
            session.setAttribute("user", name);
            session.setAttribute("ouserid", Uid);
            session.setAttribute("oyear", 2021);
            session.setMaxInactiveInterval(600);
            System.out.println("成功");
//            Cookie cookie=new Cookie("username",request.getParameter("user"));
//            cookie.setPath("/");
//            cookie.setMaxAge(100);
//            response.addCookie(cookie);
            break;
        }
    }
    if(k == 1){%>
<script type="text/javascript">
    window.location="showuser";
    alert("登录成功！");
</script>
<%}
else{  %>
<script type="text/javascript">
    alert("请输入正确的用户名和密码");
    window.location="manage.jsp";
</script>
<% }%>
</body>
</html>

</body>
</html>
