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

    <title>Notification Page</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.5/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker.min.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>

      <link rel="stylesheet" type="text/css" media="all" href="daterangepicker.css" />
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
      <script type="text/javascript" src="daterange/moment.js"></script>
      <script type="text/javascript" src="daterange/daterangepicker.js"></script>


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
		            <li>
		                <a href="main.jsp"><span class="glyphicon glyphicon-home"></span>Home</a>
		            </li>
		            <li class="active">
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
	<div class="container" align=left style="background:#AAA; color:#111" style="background-image:url('img\notification_bg.jpg');">

	<div class="col-xs-3">
		<!-- 在这里写一个时间列表的窗口-->
		<a href="${pageContext.request.contextPath}/Notification/NotificationServlet?newPage=1">通知信息</a>
        <table  class="table table-striped">
        	<tr>
        		<th>通知标题</th>
        		<th>通知时间</th>
        	</tr>
          <c:forEach items="${entities}" var="entity">
              <tr onclick="getRowNumber(this)">
                  <td>
                     ${entity.title}
                  </td>
                  <td>
                     ${entity.time}
                   </td>
              </tr>
           </c:forEach>
       </table>
       
       <a href="${pageContext.request.contextPath}/Notification/NotificationServlet?newPage=1">首页</a>
       <a
           href="${pageContext.request.contextPath}/Notification/NotificationServlet?newPage=${newPage-1<=1?1:newPage-1}">上一页</a>
       <a
           href="${pageContext.request.contextPath}/Notification/NotificationServlet?newPage=${newPage+1>=countPage?countPage:newPage+1}">下一页</a>
       <a
           href="${pageContext.request.contextPath}/Notification/NotificationServlet?newPage=${countPage}">末页</a>
		
		<form class="navbar-form" role="search">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" name="daterange" value="01/01/2015 - 01/31/2015">
            <div class="input-group-btn">
              <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
            </div>
          </div>
        </form>
				 
	<script type="text/javascript">
	$(function() {
	    $('input[name="daterange"]').daterangepicker();
	});
	
	</script>
		</div>
		<div class="col-xs-9" align="center">
			<ul class="list-group">
				<li><h2> 通知 </h2></li>
				<li><h3>${entities[tableLine].title}</h3></li>
				<li>${entities[tableLine].time}</li>
				<li>${entities[tableLine].department}</li>
				<a>
					${entities[tableLine].info}
				</a>
			</ul>
		</div>
	</div>
</body>
</html>