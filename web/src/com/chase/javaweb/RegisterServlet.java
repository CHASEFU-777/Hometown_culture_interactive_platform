package com.chase.javaweb;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 处理GET请求
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    // 处理POST请求
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        // 生成随机的盐值
        String salt = UUID.randomUUID().toString();

        // 加密用户密码，以便更安全地存储
        String encryptedPassword = encryptPassword(password, salt);

        // 建立数据库连接
        String driverName = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/final?serverTimezone=UTC";
        String dbUsername = "root";
        String dbPassword = "123456";

        try {
            Class.forName(driverName);
            Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);

            // 创建PreparedStatement对象并插入数据
            String query = "INSERT INTO userinfo (username, password, email) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, encryptedPassword);
            ps.setString(3, email);
            int count = ps.executeUpdate();

            // 确保插入了一行记录
            if (count == 1) {
                request.setAttribute("message", "用户注册成功！");
            } else {
                request.setAttribute("message", "用户注册失败，请重试。");
            }

            // 关闭连接
            ps.close();
            con.close();
        } catch (Exception e) {
            request.setAttribute("message", e.getMessage());
        }

        request.getRequestDispatcher("//register.jsp").forward(request, response);
    }

    // 加密密码的方法
    private String encryptPassword(String password, String salt) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] bytes = (password + salt).getBytes("UTF-8");
            byte[] encryptedBytes = md.digest(bytes);
            return byteArrayToHexString(encryptedBytes);
        } catch (Exception e) {
            return null;
        }
    }

    // 将字节数组转换为十六进制字符串的方法
    private String byteArrayToHexString(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b & 0xff));
        }
        return sb.toString();
    }
}
