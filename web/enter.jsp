<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/14
  Time: 12:27
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
        .center_part2 {
            width: 85%;
            height: 30%;
            border-radius: 1rem;
            background-color: rgb(47,148,240);
            align-self: center;
            text-align: center;
            display: inline-block;
            margin-top: 20px;
            color: azure;
            line-height: 75px;
            font-size: 30px;
        }
    </style>
<%--    <style>--%>
<%--        html{--%>
<%--            font-family: sans-serif;--%>
<%--            background-color:rgb(246,248,251);--%>
<%--            background-image: url("./img/play.png");--%>
<%--        }--%>
<%--        body{--%>
<%--            windows: 100%;--%>
<%--            height: 100%;--%>
<%--            margin: 0 auto;--%>
<%--            align-items: center;--%>
<%--            text-align: center;--%>
<%--            background-image: url("./img/play.png");--%>
<%--        }--%>
<%--        .center_part{--%>
<%--            width: 100%;--%>
<%--            height: 30%;--%>
<%--            border-radius: 1rem;--%>
<%--            background-color: rgba(61, 154, 248, 0.5);--%>
<%--            box-shadow: black 5px 5px 2px;--%>
<%--            align-self: center;--%>
<%--            text-align: center;--%>
<%--            display: inline-block;--%>
<%--            margin-top:20px;--%>
<%--            color:azure;--%>
<%--            line-height: 75px;--%>
<%--            font-size: 30px;--%>
<%--        }--%>
<%--        .big_con{--%>
<%--            background-color:rgba(255,255,255,0.5);--%>
<%--            border-radius: 1rem;--%>
<%--            margin-top: 140px;--%>
<%--            height:300px;--%>
<%--            margin-left: 0;--%>
<%--            margin-right: 0;--%>
<%--            align-items: center;--%>
<%--            text-align: center;--%>
<%--            display: inline-block;--%>
<%--        }--%>
<%--        .top_part{--%>
<%--            border-top-left-radius: 1rem;--%>
<%--            border-top-right-radius: 1rem;--%>
<%--            background-color: rgb(47,148,251);--%>
<%--            height: 20%;--%>
<%--            text-align: center;--%>
<%--            width: 100%;--%>
<%--            font-size: 20px;--%>
<%--            color:azure;--%>
<%--            line-height: 60px;--%>
<%--        }--%>
<%--    </style>--%>
    <%--  <script src="./bootstrap-3.4.1/js/bootstrap.js"></script>--%>

</head>
<body>

<div class="center_part">
    <div class = "top_part">
        图书管理系统
    </div>
    <a type="button" class="btn btn-default btn-lg center_part2" href="./login.jsp">
        用户入口
<%--        <span class="glyphicon glyphicon-align-left" aria-hidden="true"></span>--%>
    </a>
    <a type="button" class="btn btn-default btn-lg center_part2" href="./manage.jsp">
        管理员入口
<%--        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>--%>
    </a>
</div>



</body>
</html>
