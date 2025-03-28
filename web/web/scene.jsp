<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/28
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
  <title>甬城风光</title>
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
<!--导航栏-->
<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

    <!--隐藏按钮-->
    <button class="navbar-toggler"
            data-target="#navbarCollapse" data-toggle="collapse" type="button">
      <!--隐藏的图标-->
      <span class="navbar-toggler-icon"></span>
    </button>
    <!--小屏幕下要隐藏的内容，根据id对应-->
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <!--功能列表 mr-auto:向左对齐-->
      <ul class="navbar-nav mr-auto">
        <li class="nav-item ">
          <a class="nav-link" href="index.jsp">首页 </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="food.jsp" target="_blank">甬城美食</a>
        </li>
        <li class="nav-item active">
          <a class="nav-link" href="scene.jsp">甬城风光<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="culture.jsp" target="_blank">甬城人文</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="PERSONALRESUME.jsp" target="_blank">留言板</a>
        </li>
        <li class="nav-item">
        <%
          String username=(String)session.getAttribute("username");

          if(username != null) {
            out.print("<h7 style='position: absolute; right: 20px; color:white;'>欢迎你！" + username + "</h7>");
            out.print("<a href='user.jsp' target='_blank' class='nav-link'>用户中心</a>");
          } else {
            out.print("<a href='login.jsp' target='_blank' style='position: absolute; right: 80px; color:white;'>登录</a>");
            out.print("<a href='register.jsp' target='_blank' style='position: absolute; right: 20px; color:white;'>注册</a>");
          }
        %>
        </li>
      </ul>
    </div>
    <div style="position: absolute;right:300px;float: left;">
      <form action="search.jsp" method="post">
        <input type="text" name="searchScene">
        <button type="submit">Search</button>
      </form>
    </div>

  </nav>
</header>
<!--主体-->
<main>

  <!--轮播图-->
  <div class="carousel slide" data-ride="carousel" id="myCarousel">
    <!--指示器-->
    <ol class="carousel-indicators">
      <li class="active" data-slide-to="0" data-target="#myCarousel"></li>
      <li data-slide-to="1" data-target="#myCarousel"></li>
      <li data-slide-to="2" data-target="#myCarousel"></li>
      <li data-slide-to="3" data-target="#myCarousel"></li>
      <li data-slide-to="4" data-target="#myCarousel"></li>
      <li data-slide-to="5" data-target="#myCarousel"></li>
    </ol>
    <!--轮播内容-->
    <div class="carousel-inner">
      <div class="carousel-item active">
        <!--图片-->
        <img src="img/天一阁2.jpg">
        <!--图片上的文字-->
        <div class="carousel-caption text-left">
          <h1>天一阁</h1>
          <p>Tianyi Pavilion</p>
          <p><a class="btn btn-lg btn-primary" href="TianyiPavilion.jsp" target="mainFrame">Learn more</a></p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="img/宁波港.jfif">
        <div class="carousel-caption">
          <h1>宁波港</h1>
          <p>29°56′N 121°50′E</p>
          <p><a class="btn btn-lg btn-primary" href="PortofNingbo.jsp" target="mainFrame">Learn more</a></p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="img/外滩.jpg">
        <div class="carousel-caption text-right">
          <h1>宁波老外滩</h1>
          <p>Old Bund of Ningbo</p>
          <p><a class="btn btn-lg btn-primary" href="OldBundofNingbo.jsp" target="mainFrame">Learn more</a></p>
        </div>
      </div>
      <div class="carousel-item">
        <!--图片-->
        <img src="img/东钱湖.jpg">
        <!--图片上的文字-->
        <div class="carousel-caption text-left">
          <h1>东钱湖</h1>
          <p>Dongqian Lake</p>
          <p><a class="btn btn-lg btn-primary" href="DongqianLake.jsp" target="mainFrame">Learn more</a></p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="img/方特.jpg">
        <div class="carousel-caption">
          <h1>宁波方特东方神画</h1>
          <p>Oriental Heritage</p>
          <p><a class="btn btn-lg btn-primary" href="OrientalHeritage.jsp" target="mainFrame">Learn more</a></p>
        </div>
      </div>
      <div class="carousel-item">
        <img src="img/浙东第一尖.jpg">
        <div class="carousel-caption text-right">
          <h1>浙东大峡谷</h1>
          <p>Zhedong Grand Canyon</p>
          <p><a class="btn btn-lg btn-primary" href="Zhedong.jsp" target="mainFrame">Learn more</a></p>
        </div>
      </div>
    </div>
    <!--向前和后的按钮-->
    <a class="carousel-control-prev" data-slide="prev" href="#myCarousel">
      <span class="carousel-control-prev-icon"></span>
    </a>

    <a class="carousel-control-next" data-slide="next" href="#myCarousel">
      <span class="carousel-control-next-icon"></span>
    </a>

  </div>

  <iframe id="myFrame" src="mainFrame.jsp" frameborder="0" name="mainFrame" width="100%" scrolling="no" onload="resizeIframe()"></iframe>
  <script type="text/javascript">
    // 定义函数，用于设置 iframe 的高度
    function resizeIframe() {
      var iframe = document.getElementById("myFrame");
      // 获取 iframe 内容的高度
      var height = iframe.contentWindow.document.documentElement.scrollHeight;
      // 设置 iframe 的高度
      iframe.style.height = height + 'px';
    }
  </script>


  <!-- 页脚 -->
  <footer class="container">
    <!--右浮动-->
    <p class="float-right"><a href="#myCarousel">Back to top</a></p>
    <p>Copyright&nbsp;20220917&nbsp;ChaseFu.AllRightsReserved.</p>
  </footer>
</main>

</body>
</html>

