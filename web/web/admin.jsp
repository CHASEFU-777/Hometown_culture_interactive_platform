<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/29
  Time: 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<%--<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>后台管理系统</title>
  <link rel="stylesheet" type="text/css" href="admin/style.css">
  <link rel="stylesheet" type="text/css" href="admin/table.css">
</head>
<body>
<div class="container">
  <div class="sidebar">
    <h1>管理菜单</h1>
    <ul>
      <li><a href="admin.jsp">主页</a></li>
      <li><a href="admin-user.jsp">用户管理</a></li>
      <li><a href="admin-food.jsp">美食管理</a></li>
      <li><a href="admin-scene.jsp">景点管理</a></li>
      <li><a href="admin-culture.jsp">文化管理</a></li>
    </ul>
  </div>
  <div class="main-content">
    <h1>欢迎你</h1>
    <h1>管理员 CHASE</h1>
    <form action="index.jsp" method="post">
    <button name="up" value="11" class="my-button">退出登录</button>
    </form>
  </div>
</div>
</body>
</html>--%>

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
    <style>


        h1, h2 {
            text-align: center;
            margin-top: 50px;
        }

        .card {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            max-width: 600px;
            margin: 0 auto 50px;
            height: 820px;
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
            background-color: #74a3a5;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button[type=submit]:hover {
            background-color: #053638;
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
    <style>
        .img-container {
            width: 300px;
            height: 300px;
            overflow: hidden;
            float: right;
            margin-right: 300px;
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
                <%
                String username = (String) session.getAttribute("username");
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

                        if (rs.getString("username").equals(username)) {
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
            <div style="margin-left: 100px;margin-top: 50px;float: left">
                <h1>欢迎你</h1>
                <h1>管理员 <%=username%>
                </h1>
                <form action="index.jsp" method="post">
                    <button name="up" value="11" class="my-button">退出登录</button>
                </form>
            </div>

            <div class="sx"></div>
            <div class="card" style="float: left;margin-top: 100px;margin-left: 60px">
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
                </div>

                <div class="img-container">
                    <%--            <img src="<%=image%>" alt="<%=username%>的头像">--%>
                </div>

            </div>
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