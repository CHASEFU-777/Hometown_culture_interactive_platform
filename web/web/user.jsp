<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/29
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>User Information Management</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f5f5;
    }

    h1, h2 {
      text-align: center;
      margin-top: 50px;
    }

    .card {
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      margin: 0 auto 50px;
    }

    .card-header {
      background-color: #f9f9f9;
      padding: 20px;
      border-radius: 10px 10px 0 0;
      position: relative;
    }

    .card-header:before {
      content: '';
      position: absolute;
      bottom: -15px;
      left: 50%;
      transform: translateX(-50%);
      border-style: solid;
      border-width: 0 15px 15px 15px;
      border-color: transparent transparent #f9f9f9 transparent;
    }

    .card-body {
      padding: 30px;
    }

    label {
      display: block;
      margin-bottom: 15px;
      font-weight: 600;
    }

    input[type=text], input[type=email], input[type=tel], input[type=password], input[type=url] {
      width: 100%;
      padding: 10px;
      border-radius: 5px;
      border: none;
      margin-bottom: 20px;
      box-sizing: border-box;
      background-color: #f9f9f9;
    }

    button[type=submit] {
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      padding: 10px 20px;
      cursor: pointer;
      transition: background-color 0.3s ease-in-out;
    }

    button[type=submit]:hover {
      background-color: #3e8e41;
    }
  </style>
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
  <style class="color_css"></style>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <style>
    .img-container {
      width: 300px;
      height: 300px;
      overflow: hidden;
      float: right;
      margin-right:300px;
      margin-top: 30px;
      margin-bottom: 50px;
    }

    .img-container img {
      min-width: 100%;
      min-height: 100%;
      max-width: none;
      max-height: none;
      width: auto;
      height: auto;
      margin: -50% 0 0 -50%;
      position: relative;
      top: 50%;
      left: 50%;
    }

  </style>
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
            out.print("<a href='user.jsp' target='_blank' class='btn btn-default btn-white' style='color:#ffe047;'>用户中心</a>");
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
            <li><a href="PERSONALRESUME.jsp" target="_blank">留言板</a></li>
          </ul>
        </div>
      </nav>
      <!-- Navbar of the page end -->
    </div>
  </div>
</header>
<aside class="demo-block">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-md-7">
        <img src="img/scgj.png" height="80px" style="padding-top: 1px;">
      </div>
    </div>
  </div>
</aside>
<h1>User Information Management</h1>
<%
  try {
    // 加载 MySQL 驱动程序
    Class.forName("com.mysql.jdbc.Driver");

    // 创建数据库连接
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final?serverTimezone=UTC", "root", "123456");

    // 创建 SQL 语句
    String sql = "SELECT * FROM userinfo";

    // 执行 SQL 查询
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);

    String nickname;
    String email;
    String gender;
    String is;
    Date birthday;
    String phone;
    String address;
    String createdtime;
    String image;
    String pass;
    int ID;
    // 处理查询结果集
    while (rs.next()) {

      if(rs.getString("username").equals(username))
      {
          ID = rs.getInt("id");
          nickname = rs.getString("nickname");
          email = rs.getString("email");
          gender = rs.getString("gender");
          birthday = rs.getDate("birthday");
          phone = rs.getString("phone");
          address = rs.getString("address");
          createdtime = rs.getString("created-time");
          boolean isChecked1 = gender.equals("F");
          boolean isChecked2 = gender.equals("M");
          boolean isChecked3 = gender.equals("U");
          image = rs.getString("image");
          pass = rs.getString("password");


%>
<div class="card" style="float: right;margin-right: 100px;">
  <div class="card-header">
    <h2>Personal Information</h2>
  </div>
  <div class="card-body">
    <form action="user_update.jsp" method="post">
      <input type="hidden" name="user_id" value="<%=ID%>">
      <label>Username:</label><%=username%>
      <br>

      <label for="nickname">Nickname:</label>
      <input type="text" id="nickname" name="nickname" placeholder="<%=nickname%>">

      <label for="email">Email:</label>
      <input type="email" id="email" name="email" placeholder="<%=email%>">

      <label>Gender:</label>
      <input type="radio" name="gender" value="<%=gender%>" <%=isChecked1 ? "checked" : ""%>>Female
      <input type="radio" name="gender" value="<%=gender%>" <%=isChecked2 ? "checked" : ""%>>Male
      <input type="radio" name="gender" value="<%=gender%>" <%=isChecked3 ? "checked" : ""%>>Unknown
      <br>

      <label for="birthday">Birthday:</label>
      <input type="date" id="birthday" name="birthday" value="<%=birthday%>">
      <br>

      <label for="phone">Phone:</label>
      <input type="tel" id="phone" name="phone" placeholder="<%=phone%>">

      <label for="address">Address:</label>
      <input type="text" id="address" name="address" placeholder="<%=address%>">

      <label>Created-time:</label><%=createdtime%>
      <br>

      <button type="submit" name="submit">Save</button>
    </form>
    <br>
    <form action="index.jsp" method="post">
      <button name="up" value="11">退出登录</button>
    </form>
  </div>
</div>

<div class="img-container">
  <img src="<%=image%>" alt="<%=username%>的头像">
</div>

</div>

<%
      }
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
</body>
<script>
  flatpickr("#birthday", {
    dateFormat: "Y-m-d",
    allowInput: true,
  });
</script>
</html>

