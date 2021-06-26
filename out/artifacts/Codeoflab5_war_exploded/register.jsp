<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/9
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.sql.*"%>
<%@page language="java" import="java.util.Date" %>
<%@page language="java" import="java.text.SimpleDateFormat" %>
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
    String id = new String((request.getParameter("useridn")).getBytes("ISO-8859-1"),"UTF-8");
    String name = new String((request.getParameter("usernamen")).getBytes("ISO-8859-1"),"UTF-8");
    String pass = new String((request.getParameter("passwordn")).getBytes("ISO-8859-1"),"UTF-8");
    Date date=new Date();//此时date为当前的时间System.out.println(date);
    SimpleDateFormat day = new SimpleDateFormat ("yyyy");
    String year = day.format(date);
    int yy = Integer.valueOf(year).intValue();
%>
<%
    try {
        String sql = "Insert into users(userid,username,passwords,regiyear) values('" + id + "','" + name + "','" + pass + "', '" + yy + "')";
        Statement pstmt = conn.createStatement();
        int n = pstmt.executeUpdate(sql);
    }
    catch (SQLException e){
        e.printStackTrace();
    }

%>
<%
    ResultSet RS_result = stmt.executeQuery("select * from users;");
    int k = 0;
    while(RS_result.next())//RS_result.next()
    {
        k = 0;
        Name = RS_result.getString("username");
        Password = RS_result.getString("passwords");

        if(name.equals(Name) && pass.equals(Password)){
            k = 1;
            break;
        }
    }
    if(k == 1){%>
    <script type="text/javascript">
        alert('注册成功，请登录');
        window.location="login.jsp";
    </script>
    <%}
    else{  %>
    <script type="text/javascript">
        alert('注册失败，请检查格式');
        window.location="login.jsp";
    </script>
    <% }%>
<p>win</p>
</body>
</html>
