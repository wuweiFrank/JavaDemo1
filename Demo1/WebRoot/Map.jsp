<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

    <title>Map Pages</title>

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
		            <li>
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
		            <li class="active">
		            	<a href="Map.jsp"><span class="glyphicon glyphicon-map-marker"></span>Map</a>
		            </li>
		            <li>
		            	<a href="#">Help</a>
		            </li>
		        </ul>
		    </div>
		</nav>
  	</div>

<script type="text/javascript">  
    $(function(){  
        $("dl  dd").hide();  
        $("dt").click(function(){  
            if ($(this).attr("state")=="show") {  
                $(this).nextUntil("dt").hide(500)  
                $(this).attr("state","hide");  
            }else{  
                $(this).nextUntil("dt").show(500);  
                $(this).attr("state","show");  
            }  
        });  
    });  
</script> 
	<div class="container" align=left style="background:#AAA; color:#111">
	<div class="row">
	<div class="col-xs-2">
			<!-- 想在这里添加一个系统左右功能的操作  -->
			<dl >
			<dt class='dl-horizontal unstyled'><h3>点操作</h3></dt>
				<dd><a  class="btn red-stripe" onClick='add_marker()'><span class="glyphicon glyphicon-plus">添加点</span></a></dd>
				<dd><a  class="btn red-stripe" onClick='hidden_marker()'><span class="glyphicon glyphicon-eye-close">隐藏点</span></a></dd>
				<dd><a  class="btn red-stripe" onClick='show_marker()'><span class="glyphicon glyphicon-eye-open">显示点</span></a></dd>
				<dd><a  class="btn red-stripe" onClick='delete_marker()'><span class="glyphicon glyphicon-remove">删除点</span></a></dd>
				<dd><a  class="btn red-stripe" onClick='clear_marker()'><span class="glyphicon glyphicon-erase">清除点</span></a></dd>
				<dd><a  class="btn red-stripe" onClick='Update_Datebase()'><span class="glyphicon glyphicon-export">更新点</span></a></dd>
			</dl>
	</div>
	<div class="col-xs-10">
	<script type="text/javascript" src="http://maps.google.com/maps/api/js?Key=AIzaSyBUemsCiV4Z5TA2ujtKKdVu4meOdvGf2x4&sensor=false"></script>
	<script type="text/javascript"> 
	var mapCenter = new google.maps.LatLng(30.5508543,114.20503299999996); //Google map Coordinates
    var map;
	var markernumber=1;
	var markersArray = [];
	function init_map(){
	   		var googleMapOptions =
	        {
	            center: mapCenter, // map center
	            zoom: 12, //zoom level, 0 = earth view to higher value
	            panControl: true, //enable pan Control
	            zoomControl: true, //enable zoom control
	            zoomControlOptions: {
	                style: google.maps.ZoomControlStyle.SMALL //zoom control size
	             },
	            scaleControl: true, // enable scale control
	            mapTypeId: google.maps.MapTypeId.ROADMAP // google map type
	        };
	        map = new google.maps.Map(document.getElementById("googleMap"), googleMapOptions);
	        google.maps.event.addListener(map,'center_changed',function(){mapCenter=map.getCenter();});
	        CreateTable();
		}
	//add marker
	function add_marker(){
			var marker = new google.maps.Marker({
                position:mapCenter,
                map: map,
                  draggable:true,
                  animation: google.maps.Animation.DROP,
                title:"marker"+markernumber.toString(),
              icon: "http://maps.google.com/mapfiles/ms/micons/blue.png"
              });
            attach_Message(marker);
            var infowindow = new google.maps.InfoWindow({content:marker.title});
			infowindow.open(map,marker);
            markersArray.push(marker);
			markernumber++;
			CreateTable();
	}
	
	//hidden all maker but all marker in marker array
	function hidden_marker(){
		if (markersArray) {
      		for (i in markersArray) {
		        markersArray[i].setMap(null);
      		}
    	}
	}
	
	//show all markers
	function show_marker(){
		if (markersArray) {
      		for (i in markersArray) {
       	 		markersArray[i].setMap(map);
     		 }
    	}
    	CreateTable();
	}
	
	//delete last point
	function delete_marker(){
	if (markersArray) {
		markersArray[markersArray.length-1].setMap(null);
		markersArray.pop();
		markernumber-=1;
	    CreateTable();
	    }
	}

	//delete all markers
	function clear_marker(){
		if (markersArray) {
	      for (i in markersArray) {
	        markersArray[i].setMap(null);
	      }
	      markersArray.length = 0;
	    }
	    markernumber=1;
	    CreateTable();
	}
	
	function attach_Message(marker){
		var infowindow = new google.maps.InfoWindow({
		     content: marker.title
		    });
 		marker.addListener('click', function() {
	     infowindow.open(marker.get('map'), marker);
	    });
	    marker.addListener('dragend', function() {
	    	CreateTable();
	    });
	}
	
	google.maps.event.addDomListener(window, 'load', init_map);
	
	//本函数为动态更新表格的函数
	</script>
	<div id="googleMap" style="width:900px;height:600px;"></div>
	</div>
	</div>
</div>

<script type="text/javascript">
function CreateTable(){
	  DeleteTable();
      var t = document.createElement('table');
      var r = t.insertRow();
      var c = r.insertCell();
			c.innerHTML = '点名';
			c = r.insertCell();
			c.innerHTML = '经度';
			c = r.insertCell();
			c.innerHTML = '纬度';  
	for (var i in markersArray) {
		 r = t.insertRow();
		 c = r.insertCell();
		 c.innerHTML =markersArray[i].title; //google.maps.Marker(i).title;
		 c = r.insertCell();
		 c.innerHTML =markersArray[i].position.lng(); //google.maps.Marker(i).position.lng;
		 c = r.insertCell();
		 c.innerHTML =markersArray[i].position.lat(); //google.maps.Marker(i).position.lat;
     }
      
     document.getElementById('table_points').appendChild(t);
     t.setAttribute('class', 'table table-striped');
}

function DeleteTable() {
       var tab=document.getElementById('table_points');
    	for(var r=tab.childNodes.length-1;r>=0;r--)
    		tab.removeChild(tab.childNodes[r]);
}

</script>
<div class="container" align=center style="background:#AAA; color:#111">
	<div id="table_points" style="border: 1px solid black">
  </div> 
	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</body>
</html>