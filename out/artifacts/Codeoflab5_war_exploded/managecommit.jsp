<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 22:55
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
    String pass0 = new String((request.getParameter("password1")).getBytes("ISO-8859-1"),"UTF-8");
    String pass1 = new String((request.getParameter("password2")).getBytes("ISO-8859-1"),"UTF-8");
    String pass2 = new String((request.getParameter("password3")).getBytes("ISO-8859-1"),"UTF-8");
%>
<%
    //String sql="Insert into gamer(gname,usetime) values('"+name+"','"+score+"')";
    //Statement  pstmt=conn.createStatement();
    //int n = pstmt.executeUpdate(sql);
    ResultSet RS_result = stmt.executeQuery("select * from manage;");
    int Uid = 0;
    int Uyear = 0;
    int k = 0;
    int uu = 0;
    int Id = (int) session.getAttribute("muserid");
    String Uname = (String)session.getAttribute("muser");
    while(RS_result.next())//RS_result.next()
    {
        k = 0;
        Name = RS_result.getString("username");
        Pass = RS_result.getString("passwords");
        uu = RS_result.getInt("userid");
        if(Uname.equals(Name) && pass0.equals(Pass) && Id==uu){
            System.out.println(uu);
            if(pass1.equals(pass2)){
                try{
                    String sql = "update manage set passwords="+pass2+" where userid="+uu+";";
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
    }
    if(k == 1){%>
<script type="text/javascript">
    window.location="minfo.jsp";
    alert("修改成功！");
</script>
<%}
else{  %>
<script type="text/javascript">
    window.location="minfo.jsp";
    alert("更新失败，请重新尝试");
</script>
<% }%>
</body>
</html>
