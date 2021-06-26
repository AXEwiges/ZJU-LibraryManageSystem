<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#register").click(function() {
                $("#registers").submit();
            });
        });
    </script>
    <style>
        .center_part{
            width: 400px;
            height: 240px;
            border-radius: 1rem;
            margin-top:120px;
            background-color: white;
            box-shadow: black 5px 5px 2px;
            align-self: center;
            text-align: center;
            display: inline-block;
        }
        body{
            background-image: url("./img/play.png");
        }
        .top_part{
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
            background-color: rgb(47,148,251);
            height: 60px;
            text-align: center;
            font-size: 20px;
            color:azure;
            line-height: 60px;
        }
    </style>
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
    String u = (String) session.getAttribute("muser");
    int d = (int) session.getAttribute("muserid");
%>
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
                <li><a href="./mjump.jsp">图书信息管理 <span class="sr-only">(current)</span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">菜单 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="./minfo.jsp">个人信息</a></li>
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
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4">
            <div class="center_part">
                <form action="backbook" method="post">
                    <div class = "top_part">
                        图书管理员
                    </div>
                    <input type="hidden" class="form-control" name="id" value=<%=session.getAttribute("ouserid")%>>
                    <p>您的用户名：
                        <%=u%>
                    </p>
                    <p>您的id：
                        <%=d%>
                    </p>
                    <div class="btn-group" role="group" aria-label="...">
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">修改密码</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-4"></div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form action="managecommit.jsp" method="post" id="registers">
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" id="ps1" placeholder="old password" name="password1">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" id="ps2" placeholder="new password" name="password2">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" id="ps3" placeholder="enter new password again" name="password3">
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

</body>
</html>
