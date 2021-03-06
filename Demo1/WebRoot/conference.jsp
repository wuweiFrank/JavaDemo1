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

    <title>Conference Pages</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="bootstrap-3.3.5/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.js"></script>

    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
<body>
<div class="container">
  		<nav class='navbar navbar-inverse' role="navigation" style="height: auto;">
			 <div class="navbar-header">
	      		<a class="navbar-brand" href="#">Project</a>
	   		</div>
		    <div>
		        <ul class="nav navbar-nav">
		            <li >
		                <a href="main.jsp"><span class="glyphicon glyphicon-home"></span>Home</a>
		            </li>
		            <li >
		                <a href="Notification.jsp"><span class="glyphicon glyphicon-info-sign"></span>Notification</a>
		            </li>
		            <li class="active">
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
  	<div class="container" align=center style="background:#AAA; color:#111" style="background-image:url('img\notification_bg.jpg');">
  			<a href="${pageContext.request.contextPath}/paging?newPage=1">会议信息</a>
        <table  class="table table-striped">
        	<tr>
        		<th>会议名称</th>
        		<th>会议申请人</th>
        		<th>出席人员</th>
        		<th>会议时间 </th>
        		<th>会议状态 </th>
        		<th>会议室 </th>
        	</tr>
          <c:forEach items="${entities}" var="entity">
              <tr onclick="getRowNumber(this)">
                  <td>
                     ${entity.title}
                  </td>
                  <td>
                     ${entity.applyPerson}
                   </td>
                   <td>
                     ${entity.people}
                   </td>
                   <td>
                     ${entity.time}
                   </td>
                   <td>
                     ${entity.statue}
                   </td>
                   <td>
                     ${entity.room}
                   </td>
              </tr>
           </c:forEach>
       </table>
       
       <a href="${pageContext.request.contextPath}/conference/conferenceServlet?newPage=1">首页</a>
       <a
           href="${pageContext.request.contextPath}/conference/conferenceServlet?newPage=${newPage-1<=1?1:newPage-1}">上一页</a>
       <a
           href="${pageContext.request.contextPath}/conference/conferenceServlet?newPage=${newPage+1>=countPage?countPage:newPage+1}">下一页</a>
       <a
           href="${pageContext.request.contextPath}/conference/conferenceServlet?newPage=${countPage}">末页</a>
  	
  	</div>
  	
</body>
</html>