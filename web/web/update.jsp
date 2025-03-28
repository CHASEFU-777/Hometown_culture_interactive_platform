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
            Class.forName("com.mysql.jdbc.Driver");//动态加载mysql驱动
            String url = "jdbc:mysql://localhost:3306/final?"+ "useSSL=false&serverTimezone=CST&characterEncoding=utf-8";
            String user = "root";
            String password = "123456";
            Connection conn =DriverManager.getConnection(url, user, password);
            Statement sql =conn.createStatement();

            String delete=request.getParameter("delete");
            String update=request.getParameter("update");

            String fooddelete=request.getParameter("fooddelete");
            String foodupdate=request.getParameter("foodupdate");

            String scdelete=request.getParameter("scdelete");
            String scupdate=request.getParameter("scupdate");

            String culdelete=request.getParameter("culdelete");
            String culupdate=request.getParameter("culupdate");

            String mesdelete=request.getParameter("mesdelete");

            if(update !=null || delete != null){
          %>
          <script type="text/javascript">
            document.getElementById("usermanager").style.color = "#ffe047";
          </script>
          <%
            }
            if(fooddelete !=null || foodupdate != null){
          %>
          <script type="text/javascript">
            document.getElementById("foodmanager").style.color = "#ffe047";
          </script>
          <%
            }
            if(delete!=null){
              String SQL = "DELETE FROM userinfo WHERE id="+delete;
              int isUpdate=sql.executeUpdate(SQL);
              response.sendRedirect("admin-user-update.jsp");
            }
            String id=null;
            String username=null;
            String pass=null;
            String role=null;
            String nickname=null;
            String email=null;
            String gender=null;
            String birthday=null;
            String phone=null;
            String address=null;

            if(update!=null){
              Statement stmt =conn.createStatement();
              ResultSet introduceresult=stmt.executeQuery("select * from userinfo");
              while(introduceresult.next()){
                if(introduceresult.getString("id").equals(update)){
                  id=introduceresult.getString("id");
                  username=introduceresult.getString("username");
                  pass=introduceresult.getString("password");
                  role=introduceresult.getString("role");
                  nickname=introduceresult.getString("nickname");
                  email=introduceresult.getString("email");
                  gender=introduceresult.getString("gender");
                  birthday=introduceresult.getString("birthday");
                  phone=introduceresult.getString("phone");
                  address=introduceresult.getString("address");

                  break;
                }
              }
              out.print("<form action='change.jsp' method='post'>");
              out.print("<label for='用户名'>用户名:</label>");
//              out.print("<textarea type='username' id='username' name='username'>"+username+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='username' rows='2' style='width:600px' placeholder='内容..'>"+username+"</textarea>");
              out.print("<label for='密码'>密码:</label>");
//              out.print("<textarea type='pass' id='pass' name='pass'>"+pass+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='pass' rows='2' style='width:600px' placeholder='内容..'>"+pass+"</textarea>");
              out.print("<label for='用户类型'>用户类型:</label>");
//              out.print("<textarea type='role' id='role' name='role'>"+role+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='role' rows='2' style='width:600px' placeholder='内容..'>"+role+"</textarea>");
              out.print("<label for='昵称'>昵称:</label>");
//              out.print("<textarea type='nickname' id='nickname' name='nickname'>"+nickname+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='nickname' rows='2' style='width:600px' placeholder='内容..'>"+nickname+"</textarea>");
              out.print("<label for='电子邮件地址'>电子邮件地址:</label>");
//              out.print("<textarea type='email'  id='email' name='email'>"+email+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='email' rows='2' style='width:600px' placeholder='内容..'>"+email+"</textarea>");
              out.print("<label for='性别'>性别:</label>");
//              out.print("<textarea type='gender'  id='gender' name='gender'>"+gender+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='gender' rows='2' style='width:600px' placeholder='内容..'>"+gender+"</textarea>");
              out.print("<label for='出生日期'>出生日期:</label>");
//              out.print("<textarea type='birthday'  id='birthday' name='birthday'>"+birthday+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='birthday' rows='2' style='width:600px' placeholder='内容..'>"+birthday+"</textarea>");
              out.print("<label for='电话号码'>电话号码:</label>");
//              out.print("<textarea type='phone'  id='phone' name='phone'>"+phone+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='phone' rows='2' style='width:600px' placeholder='内容..'>"+phone+"</textarea>");
              out.print("<label for='地址'>地址:</label>");
//              out.print("<textarea type='address'  id='address' name='address'>"+address+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='address' rows='2' style='width:600px' placeholder='内容..'>"+address+"</textarea>");
              out.print("<button class='btn btn-label btn-primary' name='add' value='"+update+"'><label><i class='mdi mdi-checkbox-marked-circle-outline'></i></label> 确认提交</button>");
              out.print("</form>");
            }

            if(fooddelete!=null){
              String SQL = "DELETE FROM food WHERE id="+fooddelete;
              int isUpdate=sql.executeUpdate(SQL);
              response.sendRedirect("admin-food.jsp");
            }

            String name=null;
            String description=null;
            String image=null;

            if(foodupdate!=null){
              Statement stmt =conn.createStatement();
              ResultSet introduceresult=stmt.executeQuery("select * from food");
              while(introduceresult.next()){
                if(introduceresult.getString("id").equals(foodupdate)){
                  name=introduceresult.getString("name");
                  description=introduceresult.getString("description");
                  image=introduceresult.getString("image");
                  break;
                }
              }
              out.print("<form action='change.jsp' method='post'>");
              out.print("<label for='名称'>名称:</label>");
//              out.print("<textarea type='name' id='name' name='name'>"+name+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='name' rows='6' style='width:600px' placeholder='内容..'>"+name+"</textarea>");
              out.print("<label for='描述'>描述:</label>");
//              out.print("<textarea type='description' id='description' name='description'>"+description+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='description' rows='6' style='width:600px' placeholder='内容..'>"+description+"</textarea>");
              out.print("<label for='图片'>图片:</label>");
//              out.print("<textarea type='image' id='image' name='image'>"+image+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='image' rows='6' style='width:600px' placeholder='内容..'>"+image+"</textarea>");
              out.print("<button class='btn btn-label btn-primary' name='foodadd' value='"+foodupdate+"'><label><i class='mdi mdi-checkbox-marked-circle-outline'></i></label> 确认提交</button>");
              out.print("</form>");
            }

            if(scdelete!=null){
              String SQL = "DELETE FROM attraction WHERE id="+scdelete;
              int isUpdate=sql.executeUpdate(SQL);
              response.sendRedirect("admin-scene.jsp");
            }
            name=null;
            description=null;
            image=null;
            address=null;
            if(scupdate!=null){
              Statement stmt =conn.createStatement();
              ResultSet introduceresult=stmt.executeQuery("select * from attraction");
              while(introduceresult.next()){
                if(introduceresult.getString("id").equals(scupdate)){
                  name=introduceresult.getString("name");
                  description=introduceresult.getString("description");
                  image=introduceresult.getString("image");
                  address=introduceresult.getString("address");
                  break;
                }
              }
              out.print("<form action='change.jsp' method='post'>");
              out.print("<label for='名称'>名称:</label>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='name' rows='6' style='width:600px' placeholder='内容..'>"+name+"</textarea>");
              //out.print("<textarea type='name' id='name' name='name'>"+name+"</textarea><br><br>");
              out.print("<label for='描述'>描述:</label>");
//              out.print("<textarea type='description' id='description' name='description'>"+description+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='description' rows='6' placeholder='内容..'>"+description+"</textarea>");
              out.print("<label for='图片'>图片:</label>");
//              out.print("<textarea type='image' id='image' name='image'>"+image+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='image' rows='6' placeholder='内容..'>"+image+"</textarea>");
              out.print("<label for='地址'>地址:</label>");
//              out.print("<textarea type='address' id='address' name='address'>"+address+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='address' rows='6' placeholder='内容..'>"+address+"</textarea>");
              out.print("<button class='btn btn-label btn-primary' name='scadd' value='"+scupdate+"'><label><i class='mdi mdi-checkbox-marked-circle-outline'></i></label> 确认提交</button>");

              out.print("</form>");
            }

            if(culdelete!=null){
              String SQL = "DELETE FROM culture WHERE id="+culdelete;
              int isUpdate=sql.executeUpdate(SQL);
              response.sendRedirect("admin-culture.jsp");
            }
            name=null;
            description=null;
            image=null;
            if(culupdate!=null){
              Statement stmt =conn.createStatement();
              ResultSet introduceresult=stmt.executeQuery("select * from culture");
              while(introduceresult.next()){
                if(introduceresult.getString("id").equals(culupdate)){
                  name=introduceresult.getString("name");
                  description=introduceresult.getString("description");
                  image=introduceresult.getString("image");
                  break;
                }
              }
              out.print("<form action='change.jsp' method='post'>");
              out.print("<label for='名称'>名称:</label>");
//              out.print("<textarea type='name' id='name' name='name'>"+name+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='name' rows='6' style='width:600px' placeholder='内容..'>"+name+"</textarea>");
              out.print("<label for='描述'>描述:</label>");
//              out.print("<textarea type='description' id='description' name='description'>"+description+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='description' rows='6' style='width:600px' placeholder='内容..'>"+description+"</textarea>");
              out.print("<label for='图片'>图片:</label>");
//              out.print("<textarea type='image' id='image' name='image'>"+image+"</textarea><br><br>");
              out.print("<textarea class='form-control' id='example-textarea-input' name='image' rows='6' style='width:600px' placeholder='内容..'>"+image+"</textarea>");
              out.print("<button class='btn btn-label btn-primary' name='culadd' value='"+culupdate+"'><label><i class='mdi mdi-checkbox-marked-circle-outline'></i></label> 确认提交</button>");
              out.print("</form>");
            }
            if(mesdelete!=null){
              String SQL = "DELETE FROM message WHERE id="+mesdelete;
              int isUpdate=sql.executeUpdate(SQL);
              response.sendRedirect("admin-message.jsp");
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