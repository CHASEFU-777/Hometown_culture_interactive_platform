<%--
  Created by IntelliJ IDEA.
  User: Chase Fu
  Date: 2023/5/28
  Time: 23:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
  <meta name="keywords" content="app, app landing, clean, landing, landing page, marketing, marketing landing, product, product landing, responsive, seo, startup landing ">
  <meta name="author" content="Vue Laboratories">
  <title>书藏古今 港通天下</title>
  <!-- include the site stylesheet -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i%7COswald:400,700" rel="stylesheet">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/bootstrap.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/plugins.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/font-awesome.min.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="style.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/colors.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/responsive.css">
  <!-- include the site stylesheet -->
  <link rel="stylesheet" href="css/gridgum.css">
  <link rel="stylesheet" href="ban.css">
  <style class="color_css"></style>
</head>
<body>
<!-- Wrapper of the page -->
<div id="wrapper">
  <!-- Header of the page -->
  <header id="header">
    <div class="container">
      <div class="holder center-block">
        <!-- Logo of the page -->
        <div class="">
          <img src="img/校徽.png" alt="CJLU" width="450px" style="padding-left: 20px;float: left;">
          <font style="font-size: 40px;font-family: 华文行楷;line-height: 200px;float: left;text-indent: 115px;">数据库设计课程设计</font>
        </div>
        <!-- Logo of the page end -->
        <!-- Navbar of the page -->
        <nav class="navbar navbar-default">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
          </div>
          <%
            String username=(String)session.getAttribute("username");
            String up=request.getParameter("up");
            if(up!=null){
              session.setAttribute("username",null);
              out.print("<a href='login.jsp' target='_blank' class='btn btn-default btn-white'>登录</a>");
              out.print("<a href='register.jsp' target='_blank' class='btn btn-default btn-white'>注册</a>");
            }else{


            if(username != null) {
              out.print("<h3 class='btn btn-default btn-white'>欢迎你！" + username + "</h3>");
              out.print("<a href='user.jsp' target='_blank' class='btn btn-default btn-white'>用户中心</a>");
            } else {
              out.print("<a href='login.jsp' target='_blank' class='btn btn-default btn-white'>登录</a>");
              out.print("<a href='register.jsp' target='_blank' class='btn btn-default btn-white'>注册</a>");
            }}
          %>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="index.jsp">首页</a></li>
              <li><a href="food.jsp" target="_blank">甬城美食</a></li>
              <li><a href="scene.jsp" target="_blank">甬城风光</a></li>
              <li><a href="culture.jsp" target="_blank">甬城人文</a></li>
              <li><a href="PERSONALRESUME.jsp" target="_blank">留言板</a></li>
            </ul>
          </div>
        </nav>
        <!-- Navbar of the page end -->
      </div>
    </div>
  </header>
  <!-- Header of the page end -->
  <!-- Main of the page -->
  <main id="main">
    <!-- Hero area of the page -->
    <section class="hero-area text-center overlay" style="background-image: url(img/NINGBO.jpg);height: 900px;" data-scroll-index="0" >
      <div id="particles-js"></div>
      <br><br><br><br><br><br>
      <div class="container">
        <div class="row">
          <header class="heading-holder col-xs-12 col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
            <h1 style="font-family: 华文行楷;"><span class="text-small"></span>书藏古今<br>港通天下</h1>
            <p>Ningbo·Zhejiang</p>
            <p>DREAM:become a ctiy of culture and a gateway to the world.</p>
            <img src="img/甬.png" alt="image description m-top" style="width: 300px;">
          </header>
        </div>
      </div>
    </section>
    <!-- Hero area of the page end -->
    <!-- Features area of the page -->
    <section class="features-area container" data-scroll-index="1">
      <div class="row">
        <header class="col-xs-12 heading-wrap col-sm-6 col-sm-offset-3 text-center">
          <h2>WELCOME TO NINGBO!</h2>
          <br>
          <P>Once you have chosen the road of life, <br>you have to be brave enough to go to the end and never look back. <br>-- Zola</P>
        </header>
      </div>
      <!-- Features of the page -->
      <ul class="features-list">
        <li>
          <div class="icon-holder">
            <img src="images/speech-bubble.png" width="54" height="52" alt="icon id-card" class="img-responsive">
          </div>
          <h3>中文名:宁波</h3>
          <h3>外文名:Ningbo</h3>
          <h3>别名:甬城、甬上、四明、明州</h3>
        </li>
        <li>
          <div class="icon-holder">
            <img src="images/time-left.png" width="56" height="50" alt="icon clock" class="img-responsive">
          </div>
          <h3>行政区划代码:330200</h3>
          <h3>行政区类别:地级市</h3>
          <h3>所属地区:中国浙江省</h3>
        </li>
        <li>
          <div class="icon-holder">
            <img src="images/download.png" width="51" height="45" alt="icon notes" class="img-responsive">
          </div>
          <h3>地理位置:华东地区，浙江省东部，杭州湾南岸</h3>
          <h3>面积:9816 km²(陆域面积)</h3>
          <h3>下辖地区:6个区、2个县、代管2个县级市</h3>
        </li>
        <li>
          <div class="icon-holder">
            <img src="images/line-chart.png" width="52" height="60" alt="icon calculator" class="img-responsive">
          </div>
          <h3>政府驻地:鄞州区宁穿路2001号</h3>
          <h3>电话区号:0574</h3>
          <h3>邮政编码:315000</h3>
        </li>
        <li>
          <div class="icon-holder">
            <img src="images/medal.png" width="52" height="60" alt="icon cleaning" class="img-responsive">
          </div>
          <h3>气候条件:亚热带季风气候</h3>
          <h3>人口数量:954.4 万(2021年常住人口)</h3>
          <h3>地区生产总值:14594.9 亿元(2021年)</h3>
        </li>
        <li>
          <div class="icon-holder">
            <img src="images/calendar.png" width="49" height="51" alt="icon calandar" class="img-responsive">
          </div>
          <h3>机场:宁波栎社国际机场</h3>
          <h3>火车站:宁波站、宁波东站等</h3>
          <h3>车牌代码:浙B</h3>
        </li>
      </ul>
      <!-- Features of the page end -->
    </section>
    <!-- Features area of the page end -->
    <!-- Video block of the page -->
    <aside class="video-block" data-scroll-index="3">
      <video autoplay="autoplay" loop="loop" id="video" x-webkit-airplay="true" webkit-playsinline="true" muted=""width=1000px>
        <source src="img/【P1】我们如此热爱宁波bilibili上传.flv" type="video/mp4">
      </video>
      <div style="float: right;">
        <img src="img/loveNB.jpg" style="width: 500px;float: right;padding-right: 20px;">
        <br><br>
        <ul>
          <li><a href="https://www.sohu.com/a/496508301_121124519" target="_blank">《阿拉宁波，书藏古今，港通天下，中西合璧》</a></li>
          <li><a href="https://zhuanlan.zhihu.com/p/314423245" target="_blank">《宁波，一个可以为了海鲜去无数次的地方》</a></li>
          <li><a href="https://hz.house.qq.com/a/20190828/007474.htm" target="_blank">《宁波这座城的前世今生，70年发展与变迁一目了然！》</a></li>
        </ul>
      </div>
    </aside>

    <!-- Video block of the page end -->
    <!-- Brands area of the page -->
    <aside class="brands-area container">
      <div class="row">
        <header class="col-xs-12 heading-wrap col-sm-6 col-sm-offset-3 text-center">
          <h2>Ningbo</h2>
        </header>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <!-- Logos list of the page -->
          <ul class="list-unstyled line-slider">
            <li><a href="#"><img src="img/雅戈尔.png" alt="雅戈尔" class="img-responsive"></a></li>
            <li><a href="#"><img src="img/罗蒙.png" alt="罗蒙" class="img-responsive"></a></li>
            <li><a href="#"><img src="img/公牛.png" alt="公牛" class="img-responsive"></a></li>
            <li><a href="#"><img src="img/得力集团.png" alt="得力集团" class="img-responsive"></a></li>
            <li><a href="#"><img src="img/方太.png" alt="方太" class="img-responsive"></a></li>
            <li><a href="#"><img src="img/太平鸟.png" alt="太平鸟" class="img-responsive"></a></li>
            <li><a href="#"><img src="img/涌优.png" alt="涌优" class="img-responsive"></a></li>
            <li><a href="#"><img src="img/奥克斯.png" alt="奥克斯" class="img-responsive"></a></li>
          </ul>
          <!-- Logos list of the page end -->
        </div>
      </div>
    </aside>
    <!-- Brands area of the page end -->
  </main>
  <!-- Main of the page end -->
  <!-- Footer of the page -->
  <footer id="footer">
    <!-- Aside of the page -->
    <aside class="aside">
      <div class="container">
        <div class="row">
          <div class="col-xs-12 text-center col-sm-6 col-sm-offset-3">
            <p>姓名：傅琳雯</p>
            <p>专业：计算机科学与技术&nbsp;班级：21计算机2班&nbsp;学号：2100303202</p>
            <p>联系电话：18267109723&nbsp;邮箱：lyricandsunset@foxmail.com</p>
            <!-- Social Networks of the page -->
            <ul class="social-networks">
              <li><a href="#"><span class="icon ico-facebook"></span></a></li>
              <li><a href="#"><span class="icon ico-twitter"></span></a></li>
              <li><a href="#"><span class="icon ico-google-plus"></span></a></li>
              <li><a href="#"><span class="icon ico-pinterest"></span></a></li>
              <li><a href="#"><span class="icon ico-icon1"></span></a></li>
            </ul>
            <!-- Social Networks of the page end -->
          </div>
        </div>
      </div>
    </aside>
    <!-- Aside of the page end -->
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-4 col-sm-offset-4 text-center">
          <p>Copyright&nbsp;20220917&nbsp;ChaseFu.AllRightsReserved.</p>
        </div>
      </div>
    </div>
  </footer>
  <!-- Footer of the page end -->
  <!-- Back Top of the page -->
  <span id="back-top" class="fa fa-angle-up"></span>
  <div id="loader" class="loader-holder">
    <div class="block"><img src="images/svg/hearts.svg" width="100" alt="loader"></div>
  </div>
</div>
<!-- Wrapper of the page end -->
<!-- include jQuery -->
<script src="js/jquery.js"></script>
<!-- include jQuery -->
<script src="js/plugins.js"></script>
<!-- include jQuery -->
<script src="js/jquery.main.js"></script>
<!-- include jQuery -->
<script src="js/particles.js"></script>
<div id="style-changer" data-src="style-changer.html"></div>
</body>
</html>
