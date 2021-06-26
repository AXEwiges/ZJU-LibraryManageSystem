<%--
  Created by IntelliJ IDEA.
  User: 24954
  Date: 2021/6/9
  Time: 16:04
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
      /**
       * 排序主方法
       * @param {} tableId
       * @param {} sortColumn
       * @param {} nodeType
       */
      function sort(tableId, sortColumn, nodeType) {
        var table = document.getElementById(tableId);
        var tableBody = table.tBodies[0];
        var tableRows = tableBody.rows;

        var rowArray = new Array();
        for (var i = 0; i < tableRows.length; i++) {
          rowArray[i] = tableRows[i];
        }
        if (table.sortColumn == sortColumn) {
          rowArray.reverse();
        } else {
          rowArray.sort(generateCompareTR(sortColumn, nodeType));
        }
        var tbodyFragment = document.createDocumentFragment();
        for (var i = 0; i < rowArray.length; i++) {
          tbodyFragment.appendChild(rowArray[i]);
        }
        tableBody.appendChild(tbodyFragment);
        table.sortColumn = sortColumn;
      }

      /**
       * 比较函数
       * @param {} sortColumn
       * @param {} nodeType
       * @return {}
       */
      function generateCompareTR(sortColumn, nodeType) {
        return function compareTR(trLeft, trRight) {
          var leftValue = convert(trLeft.cells[sortColumn].firstChild.nodeValue,
                  nodeType);
          var rightValue = convert(
                  trRight.cells[sortColumn].firstChild.nodeValue, nodeType);
          if (leftValue < rightValue) {
            return -1;
          } else {
            if (leftValue > rightValue) {
              return 1;
            } else {
              return 0;
            }
          }
        };
      }

      /**
       * 值转换
       * @param {} value
       * @param {} dataType
       * @return {}
       */
      function convert(value, dataType) {
        switch (dataType) {
          case "int" :
            return parseInt(value);
          case "float" :
            return parseFloat(value);
          case "date" :
            return new Date(Date.parse(value));
          default :
            return value.toString();
        }
      }
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
          <li class="active"><a href="./index.jsp">图书查询 <span class="sr-only">(current)</span></a></li>
          <li><a href="./borrow.jsp">图书借阅 </a></li>
          <li><a href="./return.jsp">图书归还 </a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">菜单 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="./info.jsp">个人信息</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="./help.jsp">使用帮助</a></li>
              <li role="separator" class="divider"></li>
              <li><a href="./logout.jsp">退出登录</a></li>
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
    <form class="form-inline col-lg-9" action="searchbook" method="post">
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
  </div><!-- /.row -->
  </div>
<%--  <form style="width: 100%" action="sbook.jsp">--%>
<%--    <select id="select-book" class="selectpicker" data-live-search="true">--%>
<%--      <option value="1">图书名称</option>--%>
<%--      <option value="2">图书类型</option>--%>
<%--      <option value="3">作者</option>--%>
<%--    </select>--%>
<%--    <div class="form-group">--%>
<%--      <input type="text" class="form-control" placeholder="Search">--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-default">Submit</button>--%>
<%--  </form>--%>
<%--  <%--%>
<%--  Object user = session.getAttribute("user");--%>
<%--  out.println("欢迎"+user);--%>
<%--%>--%>
  <table class="table table-hover" id="booktable">
    <thead>
    <tr>
      <td>图书id</td>
      <td>图书名称</td>
      <td>图书类型</td>
      <td>作者</td>
      <td>出版时间</td>
      <td>出版社</td>
      <td>价格</td>
      <td>库存量</td>
    </tr>
    </thead>
    <%--@elvariable id="list" type="servlet.showbook"--%>
    <tbody>
    <c:forEach var="f" items="${list}">
      ${f.toSString()}
    </c:forEach>
    </tbody>
  </table>

  </body>
</html>
