<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/18
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    int k = 1;
    if(k == 1){%>
<script type="text/javascript">
    alert("批量导入成功");
    window.location="givebook";
</script>
<%}
else{  %>
<script type="text/javascript">
    alert("失败，请重试");
    window.location="manage.jsp";
</script>
<% }%>
<script>
    window.location="givebook";
</script>
</body>
</html>