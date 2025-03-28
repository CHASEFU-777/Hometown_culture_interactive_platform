<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/29
  Time: 0:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Page</title>

    <!-- 使用 Font Awesome 图标字体库 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <style>
        /* 全局样式 */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Montserrat', sans-serif;
        }

        body {
            background-color: #f8f8f8;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            position: relative;
        }

        h2 {
            color: #333;
            font-size: 42px;
            font-weight: 600;
            margin-bottom: 30px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        /* 注册表单部分 */
        .form-container {
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

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            background-color: #f8f8f8;
            border: none;
            border-bottom: 2px solid #ccc;
            color: #333;
            font-size: 16px;
            margin-bottom: 20px;
            padding: 10px 30px;
            width: 100%;
            letter-spacing: 1px;
            font-family: 'Lato', sans-serif;

            /* 悬停效果 */
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus {
            border-color: #007bff;
            outline: none;
        }

        button[type="submit"] {
            background-color: #007bff;
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
            z-index: 1;
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.1);
            letter-spacing: 1px;
            font-family: 'Lato', sans-serif;
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

        .form-footer-text {
            color: #333;
            font-size: 14px;
            margin-bottom: 10px;
            letter-spacing: 1px;
        }

        .form-footer-link {
            color: #007bff;
            font-size: 14px;
            margin-top: 10px;
            text-decoration: none;
            transition: color 0.3s ease;
            letter-spacing: 1px;
        }

        .form-footer-link:hover {
            color: #0066cc;
        }

        /* 社交媒体登录部分 */
        .social-container {
            align-items: center;
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
            width: 100%;
            max-width: 400px;
        }

        .social-button {
            background-color: #007bff;
            border: none;
            border-radius: 50%;
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
            color: #fff;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 60px;
            position: relative;
            transition: all 0.3s ease;
            width: 60px;
            z-index: 1;
        }

        .social-button:hover {
            background-color: #0066cc;
            box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .social-button i {
            font-size: 24px;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            h2 {
                font-size: 36px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                font-size: 14px;
                padding: 10px 20px;
            }

            button[type="submit"] {
                font-size: 16px;
                padding: 12px 0;
            }

            .social-button {
                height: 50px;
                width: 50px;
                margin: 0 10px;
            }
        }

        @media (max-width: 480px) {
            h2 {
                font-size: 30px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"] {
                font-size: 14px;
                padding: 10px 20px;
            }

            button[type="submit"] {
                font-size: 16px;
                padding: 12px 0;
            }

            .social-button {
                height: 40px;
                width: 40px;
                font-size: 20px;
                margin: 0 5px;
            }
        }

        .modal {
            background:#fff;
            padding:20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            position:absolute;
            top:50%;
            left:50%;
            width: 1000px;
            transform:translate(-50%,-50%);
            z-index:9999;
        }

        .modal h2 {
            margin-top:0;
        }

        .modal p {
            margin-bottom:15px;
        }

        .modal button {
            padding:10px 20px;
            background:#007bff;
            color:#fff;
            border:none;
            border-radius:3px;
            cursor:pointer;
        }

        .modal button:hover {
            background:#0062cc;
        }

    </style>
</head>

<body>
<div class="form-container">
    <h2>Register</h2>
    <form action="register" method="post">
        <input type="text" name="username" placeholder="Userame">
        <input type="email" name="email" placeholder="Email">
        <input type="password" name="password" placeholder="Password">
        <button type="submit">Create Account</button>
    </form>
    <% if (request.getAttribute("message") != null) { %>
    <p><%= request.getAttribute("message") %></p>
    <% } %>
    <div class="form-footer">
        <p class="form-footer-text">Already have an account? <a href="login.jsp" class="form-footer-link">Sign in</a></p>
        <a href="#" class="form-footer-link" onclick="showTerms()">Terms and Conditions</a>
        <!-- 弹出层开始 -->
        <div id="modal" class="modal" style="display:none;">
            <h5>网站注册条款和条件</h5>
            <p>以下是我们的网站注册条款和条件：</p>
            <ol>
                <li>对于本网站的注册，您必须提供真实、准确和完整的信息。您需要确保您的个人资料信息随时保持最新和正确。</li>
                <li>您的用户名、密码以及账户信息是您自己的责任。您需要采取措施来确保您的账户信息得到妥善保管，并且禁止与他人共享或泄露您的账户信息。</li>
                <li>您不得在本网站上发布、传输、分发或存储任何非法、侵犯版权或其他知识产权、色情、诈骗、诋毁他人等违反国家法律法规、公序良俗的内容。</li>
                <li>如果您违反了以上条款和条件，我们有权暂停或终止您的账户，删除您的内容，以及采取适当的法律行动。</li>
                <li>本网站对用户注册信息和用户上传的内容进行保密，但是在国家司法机关、政府执法部门、第三方知识产权相关方或者投诉人提出正式申请的情况下，我们将会根据法律法规和政策要求提供相应信息。</li>
                <li>本网站拥有修改以上条款和条件的权利，恕不另行通知。在任何时候，您都应该定期查看本网站的条款和条件。</li>
                <li>您的注册表示您同意并遵守以上条款和条件。如果您不同意这些条款和条件，请勿在本网站注册。</li>
            </ol>
            <button onclick="hideTerms()">关闭</button>
        </div>
        <!-- 弹出层结束 -->    </div>
</div>
<div class="social-container">
    <a href="https://zh-cn.facebook.com/login.php"><button class="social-button"><i class="fab fa-facebook-f"></i></button></a>
    <a href="https://myaccount.google.com/"><button class="social-button"><i class="fab fa-google"></i></button></a>
    <a href="http://www.twitter.com/"><button class="social-button"><i class="fab fa-twitter"></i></button></a>
</div>
<script>
    function showTerms() {
        // 显示弹出层
        document.getElementById('modal').style.display = 'block';
    }

    function hideTerms() {
        // 隐藏弹出层
        document.getElementById('modal').style.display = 'none';
    }
</script>

</body>

</html>

