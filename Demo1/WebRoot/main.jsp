<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Main Pages</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.5/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
  
<!-- NAVBAR
================================================== -->
  <body>
  	<div class="container">
  		<nav class='navbar navbar-inverse' role="navigation" style="height: auto;">
			 <div class="navbar-header">
	      		<a class="navbar-brand" href="#">Project</a>
	   		</div>
		    <div>
		        <ul class="nav navbar-nav">
		            <li class="active">
		                <a href="main.jsp"><span class="glyphicon glyphicon-home"></span>Home</a>
		            </li>
		            <li >
		                <a href="Notification.jsp"><span class="glyphicon glyphicon-info-sign"></span>Notification</a>
		            </li>
		            <li>
		                <a href="conference.jsp"><span class="glyphicon glyphicon-user"></span>Conference</a>                
		            </li>
		            <li>
		            	<a href="schedule.jsp"><span class="glyphicon glyphicon-list"></span>Schedule</a>
		            </li>
		            <li>
		            	<a href="Map.jsp"><span class="glyphicon glyphicon-map-marker"></span>Map</a>
		            </li>
		            <li>
		            	<a href="#">Help</a>
		            </li>
		        </ul>
		    </div>
		</nav>
  	</div>

	<div class="container" align=left style="background:#AAA; color:#111">
	<div class="row">
	<div class="col-xs-3">
			<!-- 想在这里添加一个系统左右功能的操作  -->
			<dl >
			<dt class='dl-horizontal unstyled'><h3><span class="glyphicon glyphicon-search">数据查询</span></h3></dt>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#1';">人员查询</a></dd>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#2';">项目查询</a></dd>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#3';">通知查询</a></dd>
			<dt class='dl-horizontal unstyled'> <h3><span class="glyphicon glyphicon-tasks">数据管理 </span></h3></dt>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#4';">人员管理</a></dd>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#5';">项目管理</a></dd>
			<dt class='dl-horizontal unstyled'><h3> <span class="glyphicon glyphicon-eye-open">数据发布</span></h3></dt>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#6';">新闻发布</a></dd>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#7';">通知发布</a></dd>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#8';">会议发布</a></dd>
			<dt class='dl-horizontal unstyled'> <h3><span class="glyphicon glyphicon-cloud-download">数据上传与下载</span></h3></dt>	
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#9';">数据上传</a></dd>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='#10';">数据下载</a></dd>
			</dl>
	</div>
	<div class="col-xs-9">
			
	<div id="myCarousel" class="carousel slide">
	   <!-- 轮播（Carousel）指标 -->
	   <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	   </ol>   
	   <!-- 轮播（Carousel）项目 -->
	   <div class="carousel-inner">
	      <div class="item active">
	         <img src="slide/slide1.jpg" alt="First slide">
	      </div>
	      <div class="item">
	         <img src="slide/slide2.jpg" alt="Second slide">
	      </div>
	      <div class="item">
	         <img src="slide/slide3.jpg" alt="Third slide">
	      </div>
	   </div>
	   <!-- 轮播（Carousel）导航 -->
	   <a class="carousel-control left" href="#myCarousel" 
	      data-slide="prev">&lsaquo;</a>
	   <a class="carousel-control right" href="#myCarousel" 
	      data-slide="next">&rsaquo;</a>
	</div> 
	
	</div>
	</div>
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

  </body>
</html>