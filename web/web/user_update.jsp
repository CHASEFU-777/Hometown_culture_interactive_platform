<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/31
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
  // 获取表单提交的数据
  String userId = request.getParameter("user_id");
  String nickname=request.getParameter("nickname");
  String email=request.getParameter("email");
  String gender = request.getParameter("gender");
  String birthday = request.getParameter("birthday");
  String phone = request.getParameter("phone");
  String address = request.getParameter("address");
  String submit=request.getParameter("submit");

  if(submit != null){
    // 更新数据库中的用户数据
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      // 建立数据库连接
      Class.forName("com.mysql.jdbc.Driver"); // 加载 JDBC 驱动程序
      conn = DriverManager.getConnection("jdbc:mysql://localhost/final?serverTimezone=UTC", "root", "123456");

      // 执行 SQL 更新语句
      stmt = conn.prepareStatement("UPDATE userinfo SET nickname=?, email=?, gender=?, birthday=?, phone=?, address=? WHERE id=?");
      stmt.setString(1, nickname);
      stmt.setString(2, email);
      stmt.setString(3, gender);
      stmt.setString(4, birthday);
      stmt.setString(5, phone);
      stmt.setString(6, address);
      stmt.setInt(7, Integer.parseInt(userId));

      int rows = stmt.executeUpdate();
      if (rows > 0) {
        //out.println("数据更新成功！");
        response.sendRedirect("user.jsp");
      } else {
        out.println("数据更新失败。");
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (stmt != null)
        stmt.close();
      if (conn != null)
        conn.close();
    }
  }

%>

</body>
</html>
