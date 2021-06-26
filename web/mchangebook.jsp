<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/14
  Time: 0:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page language="java" import="java.sql.*"%>
<%@ page import="jakarta.servlet.*" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.lang.Object" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
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
    int k = 0;
    SimpleDateFormat day = new SimpleDateFormat ("yyyy-MM-dd");
    request.setCharacterEncoding("utf-8");
    String bookname = new String(request.getParameter("bookname"));
    String bookid = new String(request.getParameter("bookid"));
    String booktype = new String(request.getParameter("booktype"));
    String bookauthor = new String(request.getParameter("bookauthor"));
    String pubtime = new String(request.getParameter("pubtime"));
    String publisher = new String(request.getParameter("publisher"));
    String price = new String(request.getParameter("price"));
    String storge = new String(request.getParameter("storge"));
    System.out.println(pubtime);
    if(bookname==null||bookid==null||booktype==null||bookauthor==null||pubtime==null||publisher==null||price==null||storge==null){
        k = 3;
    }
%>
<%
    System.out.println(bookid);
    //String sql="Insert into gamer(gname,usetime) values('"+name+"','"+score+"')";
    //Statement  pstmt=conn.createStatement();
    //int n = pstmt.executeUpdate(sql);
    ResultSet RS_result = stmt.executeQuery("select * from book;");
    String Id;
    int M = 0;
    while(RS_result.next())//RS_result.next()
    {
        if(k != 3) k = 0;
        Id = RS_result.getString("bookid");

        if(bookid.equals(Id)){
            k = 1;
            try{
                String sql = "update book set storge = "+storge+" where bookid = "+Id+";";
                System.out.println(sql);
                stmt.executeUpdate(sql);
                sql = "update book set bookname = "+bookname+" where bookid = "+Id+";";
                System.out.println(sql);
                stmt.executeUpdate(sql);
                sql = "update book set booktype = "+booktype+" where bookid = "+Id+";";
                System.out.println(sql);
                stmt.executeUpdate(sql);
                sql = "update book set author = "+bookauthor+" where bookid = "+Id+";";
                System.out.println(sql);
                stmt.executeUpdate(sql);
                sql = "update book set pubtime = '"+pubtime+"' where bookid = "+Id+";";
                System.out.println(sql);
                stmt.executeUpdate(sql);
                sql = "update book set publisher = "+publisher+" where bookid = "+Id+";";
                System.out.println(sql);
                stmt.executeUpdate(sql);
                sql = "update book set price = "+price+" where bookid = "+Id+";";
                System.out.println(sql);
                stmt.executeUpdate(sql);
                M = 2;
                break;
            }
            catch(Exception e){
                M = 5;
            }
            break;
        }
    }

    if(k == 1 && (M==2 || M==4)){%>
<script type="text/javascript">
    window.location="givebook";
    alert("成功！")
</script>
<%}
else{  %>
<script type="text/javascript">
    window.location="managebook.jsp";
    alert("失败！请重试或检查库存");
</script>
<% }%>

</body>
</html>
