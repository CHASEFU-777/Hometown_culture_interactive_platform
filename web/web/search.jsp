<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/31
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理系统-用户管理</title>
    <link rel="stylesheet" type="text/css" href="admin/style.css">
    <link rel="stylesheet" type="text/css" href="admin/table.css">
</head>
<body>
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
                    String username = "root";
                    String password = "123456";
                    Connection conn = DriverManager.getConnection(url, username, password);
                    PreparedStatement statement = conn.prepareStatement("SELECT * FROM userinfo_view WHERE username LIKE ? OR phone LIKE ? OR email LIKE ?");
                    statement.setString(1, "%" + searchTerm + "%");
                    statement.setString(2, "%" + searchTerm + "%");
                    statement.setString(3, "%" + searchTerm + "%");
                    ResultSet rs = statement.executeQuery();
                    out.print("<form action='admin-user-update.jsp' method='post'><table class=\"\"><tr><th>用户ID</th><th>用户名</th><th>昵称</th><th>电子邮件地址</th><th>电话号码</th><th>修改</th></tr>");
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String name = rs.getString("username");
//                        String pass = rs.getString("password");
//                        int role = rs.getInt("role");
                        String nickname = rs.getString("nickname");
                        String email = rs.getString("email");
//                        String gender = rs.getString("gender");
//                        Date birthday = rs.getDate("birthday");
                        String phone = rs.getString("phone");
//                        String address = rs.getString("address");
//                        Date updatedtime = rs.getDate("updated_time");
//                        Date createdtime = rs.getDate("created-time");
                        out.print("<tr>");
                        out.print("<td>"+id+"</td>");
                        out.print("<td>"+name+"</td>");
//                        out.print("<td>"+pass+"</td>");
//                        out.print("<td>"+role+"</td>");
                        out.print("<td>"+nickname+"</td>");
                        out.print("<td>"+email+"</td>");
//                        out.print("<td>"+gender+"</td>");
//                        out.print("<td>"+birthday+"</td>");
                        out.print("<td>"+phone+"</td>");
//                        out.print("<td>"+address+"</td>");
//                        out.print("<td>"+createdtime+"</td>");
//                        out.print("<td>"+updatedtime+"</td>");
                        out.print("<td><button name='tom' value='"+id+"'>"+"修改"+"</button></td>");
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
                    String username = "root";
                    String password = "123456";
                    Connection conn = DriverManager.getConnection(url, username, password);
                    PreparedStatement statement = conn.prepareStatement("SELECT * FROM food WHERE name LIKE ? OR description LIKE ? OR rating LIKE ?");
                    statement.setString(1, "%" + searchFood + "%");
                    statement.setString(2, "%" + searchFood + "%");
                    statement.setString(3, "%" + searchFood + "%");
                    ResultSet rs = statement.executeQuery();
                    out.print("<form action='admin-food-update.jsp' method='post'><table class=\"\"><tr><th>id</th><th>name</th><th>description</th><th>image</th><th>评分</th><th>创建时间</th><th>更新时间</th><th>修改</th></tr>");
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
                        out.print("<td><button name='tom' value='"+id+"'>"+"修改"+"</button></td>");
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
                    String username = "root";
                    String password = "123456";
                    Connection conn = DriverManager.getConnection(url, username, password);
                    PreparedStatement statement = conn.prepareStatement("SELECT * FROM culture WHERE name LIKE ? OR description LIKE ?");
                    statement.setString(1, "%" + searchCulture + "%");
                    statement.setString(2, "%" + searchCulture + "%");
                    ResultSet rs = statement.executeQuery();
                    out.print("<form action='admin-culture-update.jsp' method='post'><table class=\"\"><tr><th>id</th><th>name</th><th>description</th><th>image</th><th>创建时间</th><th>更新时间</th><th>修改</th></tr>");
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
                        out.print("<td><button name='tom' value='"+id+"'>"+"修改"+"</button></td>");
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
                    String username = "root";
                    String password = "123456";
                    Connection conn = DriverManager.getConnection(url, username, password);
                    PreparedStatement statement = conn.prepareStatement("SELECT * FROM attraction WHERE name LIKE ? OR description LIKE ? OR address LIKE ?");
                    statement.setString(1, "%" + searchScene + "%");
                    statement.setString(2, "%" + searchScene + "%");
                    statement.setString(3, "%" + searchScene + "%");
                    ResultSet rs = statement.executeQuery();
                    out.print("<form action='admin-scene-update.jsp' method='post'><table class=\"\"><tr><th>id</th><th>name</th><th>description</th><th>image</th><th>评分</th><th>创建时间</th><th>更新时间</th><th>修改</th></tr>");
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
                        out.print("<td><button name='tom' value='"+id+"'>"+"修改"+"</button></td>");
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
