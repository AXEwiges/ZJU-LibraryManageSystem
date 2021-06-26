<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 23:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <title>$Title$</title>
    <%--    <link type="text/css" href="./bootstrap-3.4.1/css/bootstrap.css" rel="stylesheet">--%>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="/static/js/jquery.dataTables.min.js"></script>
    <script src="bootstrap-3.4.1/js/jquery.tablesorter.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#register").click(function() {
                $("#registers").submit();
            });
        });
    </script>
    <script>
        $(document).ready(function() {
            $("#register2").click(function() {
                $("#registers2").submit();
            });
        });
    </script>
    <script>
        $(function(){
            $('#booktable').tablesorter();
        });
    </script>
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
                <li><a href="./mindex.jsp">用户信息管理 <span class="sr-only">(current)</span></a></li>
                <li class="active"><a href="./mjump.jsp">图书信息管理 <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">菜单 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="./minfo.jsp">个人信息</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="./mlogout.jsp">退出登录</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-right">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>

        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container-fluid center-block">
    <div class="row">
        <form class="form-inline col-lg-8" action="searchbook" method="post">
            <div class="form-group">
                <label for="lname">图书名称</label>
                <input type="text" class="form-control" placeholder="图书名称" id="lname" name="lname">
            </div>
            <div class="form-group">
                <label for="ltype">图书类型</label>
                <input type="text" class="form-control" placeholder="图书类型" id="ltype" name="ltype">
            </div>
            <div class="form-group">
                <label for="lauth">作者</label>
                <input type="text" class="form-control" placeholder="作者" id="lauth" name="lauth">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form><!-- /.col-lg-6 -->
        <form class="form-inline col-lg-3" action="listenter">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2">信息添加</button>
            <button type="submit" class="btn btn-success" data-toggle="modal" data-target="#myModal2">批量导入</button>
        </form>
    </div><!-- /.row -->
</div>

<table class="table table-hover" id="booktable">
    <thead>
    <tr>
        <td>序号</td>
        <td>图书id</td>
        <td>图书名称</td>
        <td>图书类型</td>
        <td>作者</td>
        <td>出版时间</td>
        <td>出版社</td>
        <td>价格</td>
        <td>库存量</td>
        <td>操作</td>
    </tr>
    </thead>
    <%int i = 1;%>
    <tbody>
    <c:forEach var="f" items="${listu}">
        <tr>
            <td>
                <%=i%>
                <%i++;%>
            </td>
                ${f.toSSString()}
            <td>
                <div class="btn-toolbar" role="toolbar" aria-label="...">
                <div class="btn-group" role="group" aria-label="...">
                <form action="managebookde.jsp">
                    <input type="hidden" class="form-control" name="bookidde" value=${f.bookid}>
                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" value=${f.bookid}>信息修改</button>
                    <button type="submit" class="btn btn-danger" name="deletebutton">删除</button>
                </form>
                </div>
                </div>
            </td>
        </tr>

<%--        <tr>--%>
<%--            <td>--%>
<%--                <%=i%>--%>
<%--                <%i++;%>--%>
<%--            </td>--%>
<%--                ${f.toSSString()}--%>
<%--            <td>--%>
<%--                <form action="managebookde.jsp">--%>
<%--                    <input type="hidden" class="form-control" name="bookid" value=${f.bookid}>--%>
<%--                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" id="modi" value=${f.bookid}>信息修改</button>--%>
<%--                    <button type="submit" class="btn btn-danger" name="deletebutton">删除</button>--%>
<%--                </form>--%>
<%--            </td>--%>
<%--        </tr>--%>
    </c:forEach>
    </tbody>

</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改图书信息</h4>
            </div>
            <div class="modal-body">
                <form action="mchangebook.jsp" method="post" id="registers">
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="bookid" name="bookid">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="bookname" name="bookname">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="booktype" name="booktype">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="bookauthor" name="bookauthor">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="pubtime" name="pubtime">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="publisher" name="publisher">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="price" name="price">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="storge" name="storge">
                    </div>
                    <input type="submit" style="display:none" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="register">commit</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="myModal2" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">增加新图书</h4>
            </div>
            <div class="modal-body">
                <form action="maddbook.jsp" method="post" id="registers2">
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="bookid" name="bookidx">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="bookname" name="booknamex">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="booktype" name="booktypex">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="bookauthor" name="bookauthorx">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="pubtime" name="pubtimex">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="publisher" name="publisherx">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="price" name="pricex">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="storge" name="storgex">
                    </div>
                    <input type="submit" style="display:none" />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="register2">commit</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>
