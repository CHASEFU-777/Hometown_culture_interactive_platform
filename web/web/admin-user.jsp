<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/30
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
  <title>后台管理系统</title>
  <link rel="icon" href="img/favicon.ico" type="image/ico">
  <meta name="keywords" content="后台管理系统">
  <meta name="description" content="后台管理系统">
  <link href="admin/css/bootstrap.min.css" rel="stylesheet">
  <link href="admin/css/materialdesignicons.min.css" rel="stylesheet">
  <link href="admin/css/style.min.css" rel="stylesheet">
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
  <meta name="keywords"
        content="app, app landing, clean, landing, landing page, marketing, marketing landing, product, product landing, responsive, seo, startup landing ">
  <meta name="author" content="Vue Laboratories">
  <!-- include the site stylesheet -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i%7COswald:400,700"
        rel="stylesheet">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/plugins.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/colors.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/responsive.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/gridgum.css">
  <style class="color_css"></style>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <link rel="stylesheet" type="text/css" href="admin/style.css">
  <%--    <link rel="stylesheet" type="text/css" href="admin/table.css">--%>
</head>

<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">

      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="images/logo-sidebar.png" title="LightYear" alt="LightYear"/></a>
      </div>
      <div class="lyear-layout-sidebar-scroll">

        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item active"><a href="admin.jsp"><i class="mdi mdi-home"></i> 后台首页</a></li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-palette"></i> 用户管理</a>
              <ul class="nav nav-subnav">
                <li><a href="admin-user.jsp">用户表</a></li>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-format-align-justify"></i> 内容管理</a>
              <ul class="nav nav-subnav">
                <li><a href="admin-food.jsp">美食管理</a></li>
                <li><a href="admin-scene.jsp">景点管理</a></li>
                <li><a href="admin-culture.jsp">文化管理</a></li>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav">
              <a href="javascript:void(0)"><i class="mdi mdi-file-outline"></i> 留言板管理</a>
              <ul class="nav nav-subnav">
                <li> <a href="admin-message.jsp">留言表</a> </li>
              </ul>
            </li>
          </ul>
        </nav>

        <div class="sidebar-footer">
          <p class="copyright">Copyright &copy; 2023. 张榆琪&傅琳雯 All rights reserved.</p>
        </div>
      </div>

    </aside>
    <!--End 左侧导航-->

    <!--头部信息-->
    <header class="lyear-layout-header">

      <nav class="navbar navbar-default">
        <div class="topbar">

          <div class="topbar-left">
            <div class="lyear-aside-toggler">
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
            </div>
            <span class="navbar-page-title"> 后台首页 </span>
          </div>
        </div>
      </nav>

    </header>
    <!--End 头部信息-->

    <!--页面主要内容-->
    <main class="lyear-layout-content">
      <div class="container">
        <div class="">
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
          %>
          <div style="float: left;width: 1000px">
            <form action="search.jsp" method="post">
              <div class="col-xs-7">
                <input class="form-control" name="searchTerm" type="text" placeholder="请输入你要搜索的内容">
              </div>
              <button type="submit" class="btn btn-w-md btn-round btn-success" style="float: left">Search</button>
            </form>
          </div>
          <div style="float: right;width: 100px;margin-right: 10px">
            <form action='admin-user-update.jsp' method='post'>
              <button name='add' value='999' class='btn btn-w-md btn-round btn-warning' >添加</button>
            </form>
          </div>
          <%
            // 处理查询结果集
            out.print("<form action='admin-user-update.jsp' method='post'><table class='table table-hover'><tr><th>用户ID</th><th>用户名</th><th>密码</th><th>账户类型（1表示管理员，0表示普通用户）</th><th>昵称</th><th>电子邮件地址</th><th>性别</th><th>出生日期</th><th>电话号码</th><th>地址</th><th>头像</th><th>创建时间</th><th>更新时间</th><th>修改</th></tr>");
            while (rs.next()) {
              int id = rs.getInt("id");
              String username = rs.getString("username");
              String password = rs.getString("password");
              int role = rs.getInt("role");
              String nickname = rs.getString("nickname");
              String email = rs.getString("email");
              String gender = rs.getString("gender");
              Date birthday = rs.getDate("birthday");
              String phone = rs.getString("phone");
              String address = rs.getString("address");
              String image = rs.getString("image");
              Date updatedtime = rs.getDate("updated_time");
              Date createdtime = rs.getDate("created-time");
              out.print("<tr>");
              out.print("<td>"+id+"</td>");
              out.print("<td>"+username+"</td>");
              out.print("<td>"+password+"</td>");
              out.print("<td>"+role+"</td>");
              out.print("<td>"+nickname+"</td>");
              out.print("<td>"+email+"</td>");
              out.print("<td>"+gender+"</td>");
              out.print("<td>"+birthday+"</td>");
              out.print("<td>"+phone+"</td>");
              out.print("<td>"+address+"</td>");
              out.print("<td>"+image+"</td>");
              out.print("<td>"+createdtime+"</td>");
              out.print("<td>"+updatedtime+"</td>");
              out.print("<td><button class='btn btn-w-md btn-round btn-primary' name='tom' value='"+id+"'>"+"修改"+"</button></td>");
              out.print("</tr>");
            }
            out.print("</table></form>");
          %>
          <%

              // 关闭数据库连接
              rs.close();
              stmt.close();
              conn.close();

            } catch (Exception e) {
              e.printStackTrace();
              System.out.println("x-au");
            }
          %>
        </div>
      </div>
    </main>
    <!--End 页面主要内容-->
  </div>
</div>

<script type="text/javascript" src="admin/js/jquery.min.js"></script>
<script type="text/javascript" src="admin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="admin/js/main.min.js"></script>
<script>
  flatpickr("#birthday", {
    dateFormat: "Y-m-d",
    allowInput: true,
  });
</script>

</body>
</html>