<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/14
  Time: 0:05
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
    String Name = "123",Pass = "123";
    request.setCharacterEncoding("utf-8");
    String book = new String(request.getParameter("bookidde"));
    System.out.println(book);
%>
<%
    //String sql="Insert into gamer(gname,usetime) values('"+name+"','"+score+"')";
    //Statement  pstmt=conn.createStatement();
    //int n = pstmt.executeUpdate(sql);

    ResultSet RS_result = stmt.executeQuery("select * from book;");
    String id;
    int k = 0;
    int uu = 0;

    while(RS_result.next())//RS_result.next()
    {
        k = 0;
        id = RS_result.getString("bookid");
        System.out.println(Integer.parseInt(id));
        if(book.equals(id)){
            try{
                String sql = "delete from book where bookid="+id+";";
                stmt.executeUpdate(sql);
                System.out.println(sql);
                k = 1;
                break;
            }
            catch (Exception e){
                k = 0;
                break;
            }
        }
    }
    if(k == 1){%>
<script type="text/javascript">
    alert("删除成功！");
    window.location="givebook";
</script>
<%}
else{  %>
<script type="text/javascript">
    alert("删除失败，请重新尝试");
    window.location="mindex.jsp";
</script>
<% }%>
</body>
</html>
