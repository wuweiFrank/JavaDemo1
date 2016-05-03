<!doctype html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>schedule Pages</title>
	<link rel="stylesheet" type="text/css" href="bootstrap-3.3.5/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-year-calendar.min.css">
	<style type="text/css">
		#calendar{
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
	</style>
	<!--[if IE]>
		<script src="http://libs.useso.com/js/html5shiv/3.7/html5shiv.min.js"></script>
	<![endif]-->
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
		            <li >
		                <a href="conference.jsp"><span class="glyphicon glyphicon-user"></span>Conference</a>                
		            </li>
		            <li class="active">
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
	<article class="jq22-container">
		<div id="calendar"></div>
	</article>
	<div class="modal modal-fade" id="event-modal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">x</span><span class="sr-only">Close</span></button>
	        <h4 class="modal-title">
	         Event
	        </h4>
	      </div>
	      <div class="modal-body">
	        <input type="hidden" name="event-index" value="">
	        <form class="form-horizontal">
	          <div class="form-group">
	            <label for="min-date" class="col-sm-4 control-label">Name</label>
	            <div class="col-sm-7">
	              <input name="event-name" type="text" class="form-control">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="min-date" class="col-sm-4 control-label">Info</label>
	            <div class="col-sm-7">
	              <input name="event-info" type="text" class="form-control">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="min-date" class="col-sm-4 control-label">Location</label>
	            <div class="col-sm-7">
	              <input name="event-location" type="text" class="form-control">
	            </div>
	          </div>
	          <div class="form-group">
	            <label for="min-date" class="col-sm-4 control-label">Dates</label>
	            <div class="col-sm-7">
	              <div class="input-group input-daterange" data-provide="datepicker">
	                <input name="event-start-date" type="text" class="form-control" value="2012-04-05">
	                <span class="input-group-addon">to</span>
	                <input name="event-end-date" type="text" class="form-control" value="2012-04-19">
	              </div>
	            </div>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
	        <button type="button" class="btn btn-primary" id="save-event">
	          Save
	        </button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<script src="http://libs.useso.com/js/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
	<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
	<script type="text/javascript" src="bootstrap-3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-year-calendar.min.js"></script>
	<script type="text/javascript" src="js/bootstrap-popover.js"></script>
	<script type="text/javascript">
		function editEvent(event) {
		    $('#event-modal input[name="event-index"]').val(event ? event.id : '');
		    $('#event-modal input[name="event-name"]').val(event ? event.name : '');
		    $('#event-modal input[name="event-info"]').val(event ? event.info : '');		    
		    $('#event-modal input[name="event-location"]').val(event ? event.location : '');
		    $('#event-modal input[name="event-start-date"]').datepicker('update', event ? event.startDate : '');
		    $('#event-modal input[name="event-end-date"]').datepicker('update', event ? event.endDate : '');
		    $('#event-modal').modal();
		}
		function deleteEvent(event) {
		    var dataSource = $('#calendar').data('calendar').getDataSource();

		    for(var i in dataSource) {
		        if(dataSource[i].id == event.id) {
		            dataSource.splice(i, 1);
		            break;
		        }
		    }
		    
		    $('#calendar').data('calendar').setDataSource(dataSource);
		}

		function saveEvent() {
		    var event = {
		        id: $('#event-modal input[name="event-index"]').val(),
		        name: $('#event-modal input[name="event-name"]').val(),
		        location: $('#event-modal input[name="event-location"]').val(),
		        startDate: $('#event-modal input[name="event-start-date"]').datepicker('getDate'),
		        endDate: $('#event-modal input[name="event-end-date"]').datepicker('getDate')
		    }
		    
		    var dataSource = $('#calendar').data('calendar').getDataSource();

		    if(event.id) {
		        for(var i in dataSource) {
		            if(dataSource[i].id == event.id) {
		                dataSource[i].name = event.name;
		                dataSource[i].location = event.location;
		                dataSource[i].startDate = event.startDate;
		                dataSource[i].endDate = event.endDate;
		            }
		        }
		    }
		    else
		    {
		        var newId = 0;
		        for(var i in dataSource) {
		            if(dataSource[i].id > newId) {
		                newId = dataSource[i].id;
		            }
		        }
		        
		        newId++;
		        event.id = newId;
		    
		        dataSource.push(event);
		    }
		    
		    $('#calendar').data('calendar').setDataSource(dataSource);
		    $('#event-modal').modal('hide');
		}

		$(function() {
		    $('#calendar').calendar({ 
		        enableContextMenu: true,
		        enableRangeSelection: true,
		        contextMenuItems:[
		            {
		                text: 'Update',
		                click: editEvent
		            },
		            {
		                text: 'Delete',
		                click: deleteEvent
		            }
		        ],
		        selectRange: function(e) {
		            editEvent({ startDate: e.startDate, endDate: e.endDate });
		        },
		        mouseOnDay: function(e) {
		            if(e.events.length > 0) {
		                var content = '';
		                
		                for(var i in e.events) {
		                    content += '<div class="event-tooltip-content">'
		                                    + '<div class="event-name" style="color:' + e.events[i].color + '">' + e.events[i].name + '</div>'
		                                    + '<div class="event-location">' + e.events[i].location + '</div>'
		                                + '</div>';
		                }
		            
		                $(e.element).popover({ 
		                    trigger: 'manual',
		                    container: 'body',
		                    html:true,
		                    content: content
		                });
		                
		                $(e.element).popover('show');
		            }
		        },
		        mouseOutDay: function(e) {
		            if(e.events.length > 0) {
		                $(e.element).popover('hide');
		            }
		        },
		        dayContextMenu: function(e) {
		            $(e.element).popover('hide');
		        },
		        dataSource: []
		    });
		    
		    $('#save-event').click(function() {
		        saveEvent();
		    });
		});
	</script>
</body>
</html>