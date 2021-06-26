<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
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
        $('button[name="mdelete_button"]').on('click', function(e) {
            var $form = $(this).closest('form');
            e.preventDefault();
            $('#confirm').modal({
                backdrop: 'static',
                keyboard: false
            }).on('click', '#delete', function(e) {
                $form.trigger('submit');
            });
        });
    </script>
    <script>
        $(document).ready(function(){
            $("#modi").click(function (){
                var x = $("#modi").value();
                $("#userid2").val(x);
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
    <style>
        .center-block{
            display: block;
            margin-left: auto;
            margin-right: auto;
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
                <li class="active"><a href="./mindex.jsp">用户信息管理 <span class="sr-only">(current)</span></a></li>
                <li><a href="./mjump.jsp">图书信息管理 <span class="sr-only">(current)</span></a></li>
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
        <form class="form-inline col-lg-9" action="searchuser" method="post">
            <div class="form-group">
                <label for="lid">用户ID</label>
                <input type="text" class="form-control" placeholder="用户ID" id="lid" name="lid">
            </div>
            <div class="form-group">
                <label for="lname">用户名</label>
                <input type="text" class="form-control" placeholder="用户名" id="lname" name="lname">
            </div>
            <div class="form-group">
                <label for="lyear">注册年份</label>
                <input type="text" class="form-control" placeholder="注册年份" id="lyear" name="lyear">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
        </form><!-- /.col-lg-6 -->
        <form class="form-inline col-lg-2">
            <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal2">信息添加</button>
        </form>
    </div><!-- /.row -->
</div>

<%
    int i = 1;
    String want;
%>
<table class="table table-hover" id="booktable">
    <thead>
    <tr>
        <td>序号</td>
        <td>用户id</td>
        <td>用户名</td>
        <td>注册时间</td>
        <td>操作</td>
    </tr>
    </thead>
    <%--@elvariable id="list" type="servlet.showuser"--%>
    <tbody>
    <c:forEach var="f" items="${listuser}">
    <tr><td>
        <%=i%>
        <%i++;%>
    </td>

        ${f.toSSString()}
        <td>
            <div class="btn-toolbar" role="toolbar" aria-label="...">
                <div class="btn-group" role="group" aria-label="...">
                <form action="./mdelete.jsp" method="post">
                <input type="hidden" class="form-control" name="useridx" value=${f.userid}>
                <a type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal" id="modi" value=${f.userid}>信息修改</a>
                <button type="submit" class="btn btn-danger" name="mdelete_button">删除</button>
                </form>
                </div>
                <div class="btn-group" role="group" aria-label="...">
                <form action="managebook" method="post">
                <input type="hidden" class="form-control" name="useridy" value=${f.userid}>
                <button type="submit" class="btn btn-info" name="detail">借阅详情</button>
                </form>
                </div>
            </div>
        </td>
    </tr>

    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">修改密码</h4>
            </div>
            <div class="modal-body">
                <form action="mcommit.jsp" method="post" id="registers">
                    <input type="text" class="form-control" name="userid2" placeholder="Input id again">
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" id="ps2" placeholder="new password" name="password1">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" id="ps3" placeholder="enter new password again" name="password2">
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
                <h4 class="modal-title">添加新用户</h4>
            </div>
            <div class="modal-body">
                <form action="madduser.jsp" method="post" id="registers2">
                    <input type="hidden" class="form-control" name="userid2" placeholder="Input id again">
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="new user ID" name="userids">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="new user name" name="usernames">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="new user password" name="passwordss">
                    </div>
                    <div class="form-group" style="margin-top:30px;width:100%;">
                        <input type="text" class="form-control" placeholder="new user regiyear" name="regiyears">
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

<div id="confirm" class="modal hide fade">
    <div class="modal-body">
        Are you sure?
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn btn-primary" id="delete">Delete</button>
        <button type="button" data-dismiss="modal" class="btn">Cancel</button>
    </div>
</div>

</body>
</html>
