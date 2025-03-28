<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/30
  Time: 23:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" type="text/css" href="admin/style.css">
  <link rel="stylesheet" type="text/css" href="admin/table.css">
</head>
<body>
<%
  String add=request.getParameter("add");
  String foodadd=request.getParameter("foodadd");
  String scadd=request.getParameter("scadd");
  String culadd=request.getParameter("culadd");

  Class.forName("com.mysql.jdbc.Driver");//动态加载mysql驱动
  String url = "jdbc:mysql://localhost:3306/final?"+ "useSSL=false&serverTimezone=CST&characterEncoding=utf-8";
  String user = "root";
  String password = "123456";
  Connection conn =DriverManager.getConnection(url, user, password);
  Statement sql =conn.createStatement();

  if(add!=null){

        String username=request.getParameter("username");
        String pass=request.getParameter("pass");
        String role=request.getParameter("role");
        String nickname=request.getParameter("nickname");
        String email=request.getParameter("email");
        String gender=request.getParameter("gender");
        String birthday=request.getParameter("birthday");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");

        String SQL = "UPDATE userinfo SET username='"+username+"', password='"+pass+"', role='"+role+"', nickname='"+nickname+"' ,email='"+email+"', gender='"+gender+"',birthday='"+birthday+"',phone='"+phone+"',address='"+address+"' WHERE id="+add;
        int isUpdate=sql.executeUpdate(SQL);
        response.sendRedirect("admin-user.jsp");

  }
  if(foodadd!=null){
    try {
        String name=request.getParameter("name");
        String description=request.getParameter("description");
        String image=request.getParameter("image");

        String SQL = "UPDATE food SET name='"+name+"', description='"+description+"', image='"+image+"' WHERE id="+foodadd;
        int isUpdate=sql.executeUpdate(SQL);
        response.sendRedirect("admin-food.jsp");
      }
    catch (Exception e) {
      e.printStackTrace();
      System.out.println("x-c-f");
    }
  }

  if(scadd!=null){
    try {
      String name=request.getParameter("name");
      String description=request.getParameter("description");
      String image=request.getParameter("image");
      String address=request.getParameter("address");

      String SQL = "UPDATE attraction SET name='"+name+"', description='"+description+"', image='"+image+"',address='"+address+"' WHERE id="+scadd;
      int isUpdate=sql.executeUpdate(SQL);
      response.sendRedirect("admin-scene.jsp");
    }
    catch (Exception e) {
      e.printStackTrace();
      System.out.println("x-c-f");
    }
  }

  if(culadd!=null){
    try {
      String name=request.getParameter("name");
      String description=request.getParameter("description");
      String image=request.getParameter("image");

      String SQL = "UPDATE culture SET name='"+name+"', description='"+description+"', image='"+image+"' WHERE id="+culadd;
      int isUpdate=sql.executeUpdate(SQL);
      response.sendRedirect("admin-culture.jsp");
    }
    catch (Exception e) {
      e.printStackTrace();
      System.out.println("x-c-f");
    }
  }
%>
</body>
</html>
