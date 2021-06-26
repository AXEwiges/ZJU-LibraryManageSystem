<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/13
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--  <link href="./bootstrap-3.4.1/js/jquery.min.js">--%>
    <%--  <link rel="stylesheet" type="text/css" href="./bootstrap-3.4.1/css/bootstrap.min.css">--%>
    <script>
        $(document).ready(function() {
            $("#register").click(function() {
                $("#registers").submit();
            });
        });
    </script>
    <style>
        html{
            font-family: sans-serif;
            background-color:rgb(246,248,251);
            background-image: url("./img/play.png");
        }
        body{
            windows: 100%;
            height: 100%;
            margin: 0 auto;
            align-items: center;
            text-align: center;
            /*background-color:rgb(246,248,251);*/
            background-image: url("./img/play.png");
        }
        .lastResult{
            color:white;
            padding: 3px
        }
        .center_part{
            width: 400px;
            height: 300px;
            border-radius: 1rem;
            margin-top:120px;
            background-color: white;
            box-shadow: black 5px 5px 2px;
            align-self: center;
            text-align: center;
            display: inline-block;
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
        .contain{
            width:320px;
            align-self: center;
            text-align: center;
            display: inline-block;
        }
        .middle_part{
            width:320px;
            align-self: center;
            text-align: center;
            display: inline-block;
        }
        .checkfield{
            width:100%;
            height:60px;
            margin-top: 30px;
            margin-bottom: 0;
            border-radius: 0.5rem;
            font-size: 20px;
        }
        .buttoncss{
            margin-top: 30px;
            width:32%;
            background-color: blue;
            border-radius: 0.5rem;
            color: white;
        }
    </style>
    <%--  <script src="./bootstrap-3.4.1/js/bootstrap.js"></script>--%>

</head>
<body>

<div class = "center_part">
    <div class = "top_part">
        图书管理员入口
    </div>
    <div class = "middle_part">
        <form action="./mcheck.jsp" name="login" method="post">
            <div class="form-group" style="margin-top:30px;width:100%;">
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="User" name="user">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
            </div>
            <div class="btn-group" role="group" aria-label="...">
                <button type="submit" class="btn btn-default">登录</button>
            </div>
        </form>
    </div>
</div>


</body>
</html>
