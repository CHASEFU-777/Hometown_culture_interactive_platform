<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/31
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/31
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
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
            <li><a href="food.jsp" id="foodmanager">甬城美食</a></li>
            <li><a href="scene.jsp" target="_blank" id="scenemanager">甬城风光</a></li>
            <li><a href="culture.jsp" target="_blank" id="culturemanager">甬城人文</a></li>
            <li><a href="PERSONALRESUME.jsp" target="_blank" >留言板</a></li>
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

<div class="container">
  <div class="main-content">
    <%
      String searchTerm=request.getParameter("searchTerm");
      String searchFood=request.getParameter("searchFood");
      String searchCulture=request.getParameter("searchCulture");
      String searchScene=request.getParameter("searchScene");

      if(searchTerm != null)
      {
    %>
    <script type="text/javascript">
      document.getElementById("usermanager").style.color = "#ffe047";
    </script>

    <%
        try {
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://localhost:3306/final?"+ "useSSL=false&serverTimezone=CST&characterEncoding=utf-8";
          String username1 = "root";
          String password = "123456";
          Connection conn = DriverManager.getConnection(url, username1, password);
          PreparedStatement statement = conn.prepareStatement("SELECT * FROM userinfo WHERE username LIKE ? OR phone LIKE ? OR email LIKE ?");
          statement.setString(1, "%" + searchTerm + "%");
          statement.setString(2, "%" + searchTerm + "%");
          statement.setString(3, "%" + searchTerm + "%");
          ResultSet rs = statement.executeQuery();
          out.print("<form action='admin-user-update.jsp' method='post'><table class=\"\"><tr><th>用户ID</th><th>用户名</th><th>密码</th><th>账户类型（1表示管理员，0表示普通用户）</th><th>昵称</th><th>电子邮件地址</th><th>性别</th><th>出生日期</th><th>电话号码</th><th>地址</th><th>创建时间</th><th>更新时间</th></tr>");
          while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("username");
            String pass = rs.getString("password");
            int role = rs.getInt("role");
            String nickname = rs.getString("nickname");
            String email = rs.getString("email");
            String gender = rs.getString("gender");
            Date birthday = rs.getDate("birthday");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            Date updatedtime = rs.getDate("updated_time");
            Date createdtime = rs.getDate("created-time");
            out.print("<tr>");
            out.print("<td>"+id+"</td>");
            out.print("<td>"+name+"</td>");
            out.print("<td>"+pass+"</td>");
            out.print("<td>"+role+"</td>");
            out.print("<td>"+nickname+"</td>");
            out.print("<td>"+email+"</td>");
            out.print("<td>"+gender+"</td>");
            out.print("<td>"+birthday+"</td>");
            out.print("<td>"+phone+"</td>");
            out.print("<td>"+address+"</td>");
            out.print("<td>"+createdtime+"</td>");
            out.print("<td>"+updatedtime+"</td>");
            out.print("</tr>");
          }
          out.print("</table></form>");
          conn.close();
        } catch (Exception e) {
          out.println(e.getMessage());
        }
      }
    %>

    <%
      if(searchFood != null){
    %>
    <script type="text/javascript">
      document.getElementById("foodmanager").style.color = "#ffe047";
    </script>
    <%
        try {
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://localhost:3306/final?"+ "useSSL=false&serverTimezone=CST&characterEncoding=utf-8";
          String username1 = "root";
          String password = "123456";
          Connection conn = DriverManager.getConnection(url, username1, password);
          PreparedStatement statement = conn.prepareStatement("SELECT * FROM food WHERE name LIKE ? OR description LIKE ? OR rating LIKE ?");
          statement.setString(1, "%" + searchFood + "%");
          statement.setString(2, "%" + searchFood + "%");
          statement.setString(3, "%" + searchFood + "%");
          ResultSet rs = statement.executeQuery();
          out.print("<form action='admin-food-update.jsp' method='post'><table class=\"\"><tr><th>id</th><th>name</th><th>description</th><th>image</th><th>评分</th><th>创建时间</th><th>更新时间</th></tr>");
          while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String description = rs.getString("description");
            String image = rs.getString("image");
            String rating = rs.getString("rating");
            Date updatedtime = rs.getDate("updated_time");
            Date createdtime = rs.getDate("created_time");
            out.print("<tr>");
            out.print("<td>"+id+"</td>");
            out.print("<td>"+name+"</td>");
            out.print("<td>"+description+"</td>");
            out.print("<td>"+image+"</td>");
            out.print("<td>"+rating+"</td>");
            out.print("<td>"+createdtime+"</td>");
            out.print("<td>"+updatedtime+"</td>");
            out.print("</tr>");
          }
          out.print("</table></form>");
          conn.close();
        } catch (Exception e) {
          out.println(e.getMessage());
        }
      }
    %>

    <%
      if(searchCulture != null){
    %>
    <script type="text/javascript">
      document.getElementById("culturemanager").style.color = "#ffe047";
    </script>
    <%
        try {
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://localhost:3306/final?"+ "useSSL=false&serverTimezone=CST&characterEncoding=utf-8";
          String username1 = "root";
          String password = "123456";
          Connection conn = DriverManager.getConnection(url, username1, password);
          PreparedStatement statement = conn.prepareStatement("SELECT * FROM culture WHERE name LIKE ? OR description LIKE ?");
          statement.setString(1, "%" + searchCulture + "%");
          statement.setString(2, "%" + searchCulture + "%");
          ResultSet rs = statement.executeQuery();
          out.print("<form action='admin-culture-update.jsp' method='post'><table class=\"\"><tr><th>id</th><th>name</th><th>description</th><th>image</th><th>创建时间</th><th>更新时间</th></tr>");
          while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String description = rs.getString("description");
            String image = rs.getString("image");
            Date updatedtime = rs.getDate("updated_time");
            Date createdtime = rs.getDate("created_time");
            out.print("<tr>");
            out.print("<td>"+id+"</td>");
            out.print("<td>"+name+"</td>");
            out.print("<td>"+description+"</td>");
            out.print("<td>"+image+"</td>");
            out.print("<td>"+createdtime+"</td>");
            out.print("<td>"+updatedtime+"</td>");
            out.print("</tr>");
          }
          out.print("</table></form>");
          conn.close();
        } catch (Exception e) {
          out.println(e.getMessage());
        }
      }
    %>

    <%
      if(searchScene != null){
    %>
    <script type="text/javascript">
      document.getElementById("scenemanager").style.color = "#ffe047";
    </script>
    <%
        try {
          Class.forName("com.mysql.jdbc.Driver");
          String url = "jdbc:mysql://localhost:3306/final?"+ "useSSL=false&serverTimezone=CST&characterEncoding=utf-8";
          String username1 = "root";
          String password = "123456";
          Connection conn = DriverManager.getConnection(url, username1, password);
          PreparedStatement statement = conn.prepareStatement("SELECT * FROM attraction WHERE name LIKE ? OR description LIKE ? OR address LIKE ?");
          statement.setString(1, "%" + searchScene + "%");
          statement.setString(2, "%" + searchScene + "%");
          statement.setString(3, "%" + searchScene + "%");
          ResultSet rs = statement.executeQuery();
          out.print("<form action='admin-scene-update.jsp' method='post'><table class=\"\"><tr><th>id</th><th>name</th><th>description</th><th>image</th><th>评分</th><th>创建时间</th><th>更新时间</th></tr>");
          while (rs.next()) {
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String description = rs.getString("description");
            String image = rs.getString("image");
            String address = rs.getString("address");
            Date updatedtime = rs.getDate("updated_time");
            Date createdtime = rs.getDate("created_time");
            out.print("<tr>");
            out.print("<td>"+id+"</td>");
            out.print("<td>"+name+"</td>");
            out.print("<td>"+description+"</td>");
            out.print("<td>"+image+"</td>");
            out.print("<td>"+address+"</td>");
            out.print("<td>"+createdtime+"</td>");
            out.print("<td>"+updatedtime+"</td>");
            out.print("</tr>");
          }
          out.print("</table></form>");
          conn.close();
        } catch (Exception e) {
          out.println(e.getMessage());
        }
      }
    %>
  </div>
</div>
</body>
</html>
