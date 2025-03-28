<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
    <title>浙东大峡谷</title>
    <link href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>

        body {
            padding-top: 3rem;
            padding-bottom: 3rem;
            color: #5a5a5a;
        }

        /*轮播图下面距离*/
        .carousel {
            margin-bottom: 4rem;
        }
        .carousel-item > img {
            /*指定高度和宽度*/
            height: 32rem;
            width: 100%;
        }

        /*上下边距*/
        .featurette-divider {
            margin: 5rem 0;
        }
        .featurette-heading {
            font-weight: 300;
            line-height: 1;
            letter-spacing: -.05rem;
        }

    </style>
</head>
<body>
<!--主体-->
<main>
    <div class="container">
        <div class="row text-center">
            <%
                try {
                    // 加载 MySQL 驱动程序
                    Class.forName("com.mysql.jdbc.Driver");

                    // 创建数据库连接
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final?serverTimezone=UTC", "root", "123456");

                    // 创建 SQL 语句
                    String sql = "SELECT name,description,image FROM attraction LIMIT 3 OFFSET 21";

                    // 执行 SQL 查询
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    // 处理查询结果集
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String description = rs.getString("description");
                        String imagePath = rs.getString("image");

            %>
            <!--重复的三个 -->
            <br>
            <div class="col-lg-4">
                <!--rounded-circle:圆形-->
                <img class="rounded-circle" src="<%=imagePath%>" style="width: 140px;height: 140px">
                <h2><%=name%></h2>
                <p id="content"><%=description%></p>
            </div>

            <!--重复的三个 -->


            <%
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
        </div>


        <hr class="featurette-divider">

        <div class="row" data-scroll-index="6">
            <%
                try {
                    // 加载 MySQL 驱动程序
                    Class.forName("com.mysql.jdbc.Driver");

                    // 创建数据库连接
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/final?serverTimezone=UTC", "root", "123456");

                    // 创建 SQL 语句
                    String sql = "SELECT name,description,image FROM zhedong";

                    // 执行 SQL 查询
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    // 处理查询结果集
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String description = rs.getString("description");
                        String imagePath = rs.getString("image");

            %>

            <div class="row">
                <div class="col-md-5 text-center">
                    <img src="<%=imagePath%>" style="width: 20rem;
                    height: 20rem">
                </div>
                <div class="col-md-7">
                    <h2 class="featurette-heading"><%=name%></h2>
                    <p class="lead"><%=description%></p>
                </div>
            </div>
            <hr class="featurette-divider">
            <%
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

        </div>
    </div>
</main>

</body>
</html>
