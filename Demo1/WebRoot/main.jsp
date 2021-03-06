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


    <style>
@import url(http://fonts.googleapis.com/css?family=Anaheim);

*{
  margin: 0;
  padding: 0;
  outline: none;
  border: none;
	box-sizing: border-box;
}
*:before,
*:after{
	box-sizing: border-box;
}
html,
body{
	min-height: 100%;
}
.container{
	position: relative;
	perspective: 1000;
}
#carousel{
	width: 80%;
	height: 100%;
	transform-style: preserve-3d;
	animation: rotation 20s infinite linear;
}
#carousel:hover{
	animation-play-state: paused;
}
#carousel figure{
	display: block;
	position: absolute;
	width: 186px;
	height: 116px;
	left: 40%;
	top: 10px;
	overflow: hidden;
}
#carousel figure:nth-child(1){transform: rotateY(0deg) translateZ(288px);}
#carousel figure:nth-child(2) { transform: rotateY(40deg) translateZ(288px);}
#carousel figure:nth-child(3) { transform: rotateY(80deg) translateZ(288px);}
#carousel figure:nth-child(4) { transform: rotateY(120deg) translateZ(288px);}
#carousel figure:nth-child(5) { transform: rotateY(160deg) translateZ(288px);}
#carousel figure:nth-child(6) { transform: rotateY(200deg) translateZ(288px);}
#carousel figure:nth-child(7) { transform: rotateY(240deg) translateZ(288px);}
#carousel figure:nth-child(8) { transform: rotateY(280deg) translateZ(288px);}
#carousel figure:nth-child(9) { transform: rotateY(320deg) translateZ(288px);}

img{
	-webkit-filter: grayscale(1);
	cursor: pointer;
	transition: all .5s ease;
}
img:hover{
	-webkit-filter: grayscale(0);
  transform: scale(1.2,1.2);
}

@keyframes rotation{
	from{
		transform: rotateY(0deg);
	}
	to{
		transform: rotateY(360deg);
	}
}
</style>

  <script src="gallery/js/prefixfree.min.js"></script>



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
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='searchpeople.jsp';">人员查询</a></dd>
				<dd><a  class="btn red-stripe" onclick="javascript:window.location.href='searchproject.jsp';">项目查询</a></dd>
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
			<div id="carousel">
				<figure><img src="slide/1.jpg" alt=""></figure>
				<figure><img src="slide/2.jpg" alt=""></figure>
				<figure><img src="slide/3.jpg" alt=""></figure>
				<figure><img src="slide/4.jpg" alt=""></figure>
				<figure><img src="slide/5.jpg" alt=""></figure>
				<figure><img src="slide/6.jpg" alt=""></figure>
				<figure><img src="slide/7.jpg" alt=""></figure>
				<figure><img src="slide/8.jpg" alt=""></figure>
				<figure><img src="slide/9.jpg" alt=""></figure>
			</div>
			<script src='gallery/js/none.js'></script>
		  	<script src="gallery/js/index.js"></script>
			<div style="text-align:center;clear:both">
			<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
			<script src="/follow.js" type="text/javascript"></script>
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
