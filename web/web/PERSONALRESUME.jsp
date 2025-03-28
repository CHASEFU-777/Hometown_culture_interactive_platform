<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/31
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
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
  <title>留言板</title>
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
  <link rel="stylesheet" href="before/ban.css">
  <style class="color_css"></style>
</head>
<body>
<header id="header">
  <div class="container">
    <div class="holder center-block" style="padding-top: 80px;">
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
            <li><a href="food.jsp" >甬城美食</a></li>
            <li><a href="scene.jsp" target="_blank">甬城风光</a></li>
            <li><a href="culture.jsp" target="_blank">甬城人文</a></li>
            <li><a href="PERSONALRESUME.jsp" target="_blank" style="color:#ffe047;">留言板</a></li>
          </ul>
        </div>
      </nav>
      <!-- Navbar of the page end -->
    </div>
  </div>
</header>

<aside  style="background-image: url('img/IMG_2793.jpg');height: 224px">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-md-7" >
        <img src="img/IMG_2793.png" height="90px" style="padding-top: 1px;">
      </div>
    </div>
  </div>
</aside>

<main id="main">
<div class="liu" style="height: auto;background-color: whitesmoke;">
  <div class="right" style="float: right; width: 700px; margin-right: 100px;">
    <form action="" method="post">

      <label for="message">留言：</label>
      <textarea id="message" name="message" placeholder="快来留言吧！！"></textarea>

      <button name="submit" value="11">提交留言</button>
    </form>
  </div>

  <div class="left" style="float: left; margin-top: 100px; margin-left: 100px;">
    <div class="scrolling-list">
    <ul id="list">
    <%
      try {
        // 加载 MySQL 驱动程序
        Class.forName("com.mysql.jdbc.Driver");

        // 创建数据库连接
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final?serverTimezone=UTC", "root", "123456");

        // 创建 SQL 语句
        String sql = "SELECT username,message,created_time FROM message_view";

        // 执行 SQL 查询
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        // 处理查询结果集
        while (rs.next()) {
          String name = rs.getString("username");
          String message = rs.getString("message");
          Date createdtime = rs.getDate("created_time");

    %>
      <li>
        <span><%=name%> - <%=createdtime%></span>
        <p><%=message%></p>
      </li>


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

        PreparedStatement stmtt = null;
        String message=request.getParameter("message");
        System.out.println(message);
        String submit=request.getParameter("submit");
        // 插入新用户信息
        if(submit!=null){
          try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final?serverTimezone=UTC", "root", "123456");

            String sql1 = "SELECT * FROM userinfo";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql1);
            String email =null;
            while (rs.next()) {
              if (rs.getString("username").equals(username)) {
                email = rs.getString("email");
              }
            }
            System.out.println("username" + username + " email: " + email + " message: " + message);
            stmtt = conn.prepareCall("{call insert_message(?, ?, ?)}");
            stmtt.setString(1, username);
            stmtt.setString(2, email);
            stmtt.setString(3, message);

            int result = stmtt.executeUpdate();

            if (result == 1) {
              response.sendRedirect("PERSONALRESUME.jsp");
            } else {
              out.println("<h1>添加失败！</h1>");
            }
          } catch (Exception e) {
            e.printStackTrace();
            System.out.println("x");
          }
        }

      %>
    </ul>
    </div>
    <script>
      // JavaScript代码用于滚动已有的列表项

      const list = document.getElementById("list");

      function scrollList() {
        const firstItem = list.querySelector("li");
        list.appendChild(firstItem);
      }

      setInterval(scrollList, 1000); // 每3秒滚动一次列表项
    </script>
  </div>
</div>
</main>
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
</body>

</html>
