<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/11
  Time: 21:06
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
    request.setCharacterEncoding("utf-8");
    String Id = null;
    String Password = null;
    String userid = new String(request.getParameter("userid"));
    String bookid = new String(request.getParameter("bookid"));
    String password = new String(request.getParameter("password"));
//    String st1 = new String(request.getParameter("borrow"));
//    String st2 = new String(request.getParameter("return"));
%>
<%
    System.out.println(userid);
    System.out.println(bookid);
    //String sql="Insert into gamer(gname,usetime) values('"+name+"','"+score+"')";
    //Statement  pstmt=conn.createStatement();
    //int n = pstmt.executeUpdate(sql);
    ResultSet RS_result = stmt.executeQuery("select * from users;");

    int k = 0;
    int M = 0;
    while(RS_result.next())//RS_result.next()
    {
        k = 0;
        Id = RS_result.getString("userid");
        Password = RS_result.getString("passwords");

        if(userid.equals(Id) && password.equals(Password)){
            k = 1;
            break;
        }
    }
    RS_result = stmt.executeQuery("select * from book;");
    SimpleDateFormat day = new SimpleDateFormat ("yyyy-MM-dd");
    while(RS_result.next())//RS_result.next()
    {
        k = 0;
        Id = RS_result.getString("bookid");

        if(bookid.equals(Id)){
            k = 1;
//            if(st1=="borrow"){
                int yy = RS_result.getInt("storge");
                if(yy>=1){
                    yy--;
                    try{
                        String sql = "update book set storge = "+yy+" where bookid = "+Id+";";
                        System.out.println(sql);
                        stmt.executeUpdate(sql);
                        Date date = new Date();
                        int UU = (int) session.getAttribute("ouserid");
                        System.out.println(UU);
                        sql = "insert into borrow values("+UU+","+bookid+",'"+day.format(date)+"',null);";
                        System.out.println(sql);
                        stmt.executeUpdate(sql);
                        M = 2;
                    }
                    catch(Exception e){
                        M = 5;
                    }
//                    String sql = "update book set storge = "+yy+" where bookid = "+Id+";";
//                    System.out.println(sql);
//                    stmt.executeUpdate(sql);
//                    Date date = new Date();
//                    int UU = (int) session.getAttribute("ouserid");
//                    System.out.println(UU);
//                    sql = "insert into borrow values("+UU+","+bookid+",'"+day.format(date)+"',null);";
//                    System.out.println(sql);
//                    stmt.executeUpdate(sql);
                    break;
                }
                else{
                    M = 3;
                }

//            }
//            if(st2=="return"){
//                int yy = RS_result.getInt("storge");
//                yy++;
//                String sql = "update book set storge ="+yy+"where bookid ="+Id;
//                RS_result = stmt.executeQuery(sql);
//                System.out.println(sql);
//                M = 4;
//            }
            break;
        }
    }

    if(k == 1 && (M==2 || M==4)){%>
<script type="text/javascript">
    window.location="borrow.jsp";
    alert("成功！")
</script>
<%}
else{  %>
<script type="text/javascript">
    window.location="borrow.jsp";
    alert("失败！请重试或检查库存");
</script>
<% }%>

</body>
</html>
