<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/29
  Time: 0:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- set the encoding of your site -->
  <meta charset="utf-8">
  <!-- set the viewport width and initial-scale on mobile devices -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- set the apple mobile web app capable -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <!-- set the HandheldFriendly -->
  <meta name="HandheldFriendly" content="True">
  <!-- set the apple mobile web app status bar style -->
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <!-- set the description -->
  <meta name="description" content="App Landing Page">
  <!-- set the Keyword -->
  <meta name="keywords" content="app, app landing, clean, landing, landing page, marketing, marketing landing, product, product landing, responsive, seo, startup landing ">
  <meta name="author" content="Vue Laboratories">
  <title>甬城人文</title>
  <!-- include the site stylesheet -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i%7COswald:400,700" rel="stylesheet">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/plugins.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="style.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/colors.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/responsive.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/gridgum.css">
  <link rel="stylesheet" href="before/food.css">
  <style class="color_css">
    .featurette-divider {
      margin: 5rem 0;
    }
    .featurette-heading {
      font-weight: 300;
      line-height: 1;
      letter-spacing: -.05rem;
    }
  </style>
</head>
<body>
<header id="header">
  <div class="container">
    <div class="holder center-block" style="padding-top: 100px;">
      <!-- Navbar of the page -->
      <nav class="navbar navbar-default">
        <%
          String username=(String)session.getAttribute("username");

          if(username != null) {
            out.print("<h3 class='btn btn-default btn-white'>欢迎你！" + username + "</h3>");
            out.print("<a href='user.jsp' target='_blank' class='btn btn-default btn-white'>用户中心</a>");
          } else {
            out.print("<a href='login.jsp' target='_blank' class='btn btn-default btn-white'>登录</a>");
            out.print("<a href='register.jsp' target='_blank' class='btn btn-default btn-white'>注册</a>");
          }
        %>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="food.jsp" target="_blank">甬城美食</a></li>
            <li><a href="scene.jsp" target="_blank">甬城风光</a></li>
            <li><a href="culture.jsp" style="color:#ffe047;">甬城人文</a></li>
            <li><a href="PERSONALRESUME.jsp" target="_blank">留言板</a></li>
          </ul>
        </div>
      </nav>
      <!-- Navbar of the page end -->
    </div>
  </div>
</header>
<!-- Demo block of the page -->
<aside class="demo-block">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-md-7">
        <img src="img/海定.png" height="80px" style="padding-top: 1px;">
      </div>
    </div>
  </div>
</aside>
<!-- Demo block of the page end -->
<br>
<form action="search1.jsp" method="post"style="position: absolute;right:300px;float: left;">
  <input type="text" name="searchCulture">
  <button type="submit">Search</button>
</form>
<br><br>
<%
  try {
    // 加载 MySQL 驱动程序
    Class.forName("com.mysql.jdbc.Driver");

    // 创建数据库连接
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final?serverTimezone=UTC", "root", "123456");

    // 创建 SQL 语句
    String sql = "SELECT name,description,image FROM culture";

    // 执行 SQL 查询
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    // 处理查询结果集
    while (rs.next()) {
      String name = rs.getString("name");
      String description = rs.getString("description");
      String imagePath = rs.getString("image");


%>
<table class="my-table">
  <tr>
    <th>名称</th>
    <th>描述</th>
    <th>图片</th>
  </tr>
  <tr>
    <td><%=name%></td>
    <td><%=description%></td>
    <td><img src="<%=imagePath%>" alt="<%=name%>"></td>
  </tr>
</table>

<%
    }
    // 关闭数据库连接
    rs.close();
    stmt.close();
    conn.close();

  } catch (Exception e) {
    e.printStackTrace();
    System.out.println("x");
  }
%>

<div class="video overlay">
  <img src="img/鬼斧神工.png" alt="image description" class="img-responsive">
</div>

<!-- Footer of the page -->
<footer id="footer">
  <!-- Aside of the page -->
  <aside class="aside">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 text-center col-sm-6 col-sm-offset-3">
          <p>姓名：傅琳雯</p>
          <p>专业：计算机科学与技术&nbsp;班级：21计算机2班&nbsp;学号：2100303202</p>
          <p>联系电话：18267109723&nbsp;邮箱：lyricandsunset@foxmail.com</p>
          <!-- Social Networks of the page -->
          <ul class="social-networks">
            <li><a href="#"><span class="icon ico-facebook"></span></a></li>
            <li><a href="#"><span class="icon ico-twitter"></span></a></li>
            <li><a href="#"><span class="icon ico-google-plus"></span></a></li>
            <li><a href="#"><span class="icon ico-pinterest"></span></a></li>
            <li><a href="#"><span class="icon ico-icon1"></span></a></li>
          </ul>
          <!-- Social Networks of the page end -->
        </div>
      </div>
    </div>
  </aside>
  <!-- Aside of the page end -->
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center">
        <p>Copyright&nbsp;20220917&nbsp;ChaseFu.AllRightsReserved.</p>
      </div>
    </div>
  </div>
</footer>
<!-- Footer of the page end -->
<!-- Back Top of the page -->
<span id="back-top" class="fa fa-angle-up"></span>
<div id="loader" class="loader-holder">
  <div class="block"><img src="images/svg/hearts.svg" width="100" alt="loader"></div>
</div>
<!-- include jQuery -->
<script src="js/jquery.js"></script>
<!-- include jQuery -->
<script src="js/plugins.js"></script>
<!-- include jQuery -->
<script src="js/jquery.main.js"></script>
<!-- include jQuery -->
<script src="js/particles.js"></script>
<div id="style-changer" data-src="style-changer.html"></div>
</body>
</html>