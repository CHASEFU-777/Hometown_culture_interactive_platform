<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/29
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;600&display=swap');

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Raleway', sans-serif;
    }

    body {
      background-color: #f7f7f7;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      position: relative;
    }

    h2 {
      color: #333;
      font-size: 32px;
      font-weight: 600;
      margin-bottom: 30px;
      text-align: center;
      text-transform: uppercase;
    }

    .container {
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 60px 40px;
      max-width: 600px;
      width: 100%;
      position: relative;
    }

    input[type="text"], input[type="password"] {
      background-color: #f7f7f7;
      border: none;
      border-bottom: 2px solid #d9d9d9;
      color: #333;
      font-size: 16px;
      margin-bottom: 20px;
      padding: 10px 30px;
      width: 100%;
    }

    input[type="text"]:focus, input[type="password"]:focus {
      border-color: #333;
      outline: none;
    }

    button[type="submit"] {
      background-color: #333;
      border: none;
      border-radius: 40px;
      color: #fff;
      cursor: pointer;
      font-size: 18px;
      font-weight: 500;
      padding: 15px 30px;
      text-transform: uppercase;
      transition: background-color 0.3s ease;
      width: 100%;
      position: relative;
      overflow: hidden;
      z-index: 1;
    }

    button[type="submit"]:hover {
      background-color: #0066cc;
    }

    button[type="submit"]::before {
      content: "";
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: rgba(255, 255, 255, 0.05);
      border-radius: 50%;
      width: 0;
      height: 0;
      transition: width 0.3s ease, height 0.3s ease;
      z-index: -1;
    }

    button[type="submit"]:hover::before {
      width: 200%;
      height: 200%;
    }

    .form-footer {
      display: flex;
      align-items: center;
      flex-direction: column;
      margin-top: 30px;
    }

    .form-footer a {
      color: #333;
      font-size: 14px;
      margin-top: 10px;
      transition: color 0.3s ease;
    }

    .form-footer a:hover {
      color: #000;
      text-decoration: underline;
    }

    .social-login {
      border-top: 1px solid #d9d9d9;
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin-top: 40px;
      padding-top: 40px;
      width: 100%;
      position: relative;
    }

    .social-login a {
      background-color: transparent;
      border: none;
      color: #333;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-grow: 1;
      margin: 0 10px;
      padding: 15px;
      text-transform: uppercase;
      font-weight: 600;
      font-size: 18px;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
      z-index: 1;
      border-radius: 50%;
      height: 60px;
      width: 60px;
      cursor: pointer;
    }

    .social-login a:hover {
      color: #fff;
      background-color: #0066cc;
      transform: translateY(-5px);
      box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.2);
    }

    .social-login a i {
      font-size: 24px;
    }

    .background {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(to right bottom, #78a0ff, #cbe8ad);
      clip-path: polygon(0% 0%, 100% 0%, 100% 90%, 0% 100%);
      z-index: -1;
    }

    .background::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: linear-gradient(
              to right bottom,
              rgba(255, 255, 255, 0.05),
              rgba(255, 255, 255, 0.025)
      );
      animation: animate 10s linear infinite;//添加动画效果
      z-index: -2;
    }

    @keyframes animate {
      from {
        transform: translateX(-100%);
      }
      to {
        transform: translateX(100%);
      }
    }

    @media (max-width: 768px) {
      h2 {
        font-size: 28px;
      }

      input[type="text"], input[type="password"] {
        font-size: 14px;
        padding: 10px 20px;
      }

      button[type="submit"] {
        font-size: 16px;
        padding: 12px 0;
      }

      .social-login a {
        height: 50px;
        width: 50px;
        margin: 0 5px;
        padding: 0;
      }
    }

    @media (max-width: 480px) {
      h2 {
        font-size: 24px;
      }

      input[type="text"], input[type="password"] {
        font-size: 14px;
        padding: 10px 20px;
      }

      button[type="submit"] {
        font-size: 16px;
        padding: 12px 0;
      }

      .social-login a {
        height: 40px;
        width: 40px;
        font-size: 12px;
        margin: 0 5px;
        padding: 0;
      }
    }
  </style>
</head>

<body>
<div class="background"></div>
<div class="container">
  <h2>Login</h2>
  <form action="" method="post">
    <input type="text" name="username" placeholder="Username">
    <input type="password" name="password" placeholder="Password">
    <br><br>
    <label>User Type:</label>
    <input type="radio" id="normal" name="role" value="0">
    <label for="normal">Normal User</label>
    <input type="radio" id="admin" name="role" value="1">
    <label for="admin">Administrator</label>
    <br><br><br>
    <button type="submit">Sign In</button>
  </form>
  <%
    String u=request.getParameter("username");
    String p=request.getParameter("password");
    String status=request.getParameter("role");
    //out.print(u);
    //out.print(p);
    // 数据库连接信息
    String url = "jdbc:mysql://localhost:3306/final?useSSL=false&serverTimezone=UTC";
    String user = "root";
    String password = "123456";

    // 创建数据库连接对象
    Connection conn = null;
    try {
      Statement sql;
      ResultSet rs;
      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection(url, user, password);
      sql=conn.createStatement();
      //out.println("数据库连接成功！");
      String SQL = "SELECT * FROM userinfo";
      rs=sql.executeQuery(SQL);
      while(rs.next()) {
        if(rs.getString(2).equals(u)&&rs.getString(3).equals(p)&&rs.getString(4).equals(status)){
          int role = rs.getInt("role");
          session.setAttribute("username", u);
          if (role == 0) {
            response.sendRedirect("index.jsp?username="+ u);
          } else if (role == 1) {
            response.sendRedirect("admin.jsp");
          }
        }
      }
    } catch (Exception e) {
      //out.println("数据库连接失败：" + e.getMessage());
    } finally {
      if (conn != null) {
        try {
          conn.close();
        } catch (Exception e) {
          //out.println("关闭数据库连接失败：" + e.getMessage());
        }
      }
    }
  %>
  <div class="form-footer">
    <a href="index.jsp">Back to index</a>
    <a href="register.jsp">Create an account</a>
  </div>
  <div class="social-login">
    <a href="#">
      <i class="fab fa-facebook-f"></i>
    </a>
    <a href="#">
      <i class="fab fa-google"></i>
    </a>
    <a href="#">
      <i class="fab fa-twitter"></i>
    </a>
  </div>
</div>

</body>
</html>
