<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!String greeting = "Romance에 오신 것을 환영합니다";
	String tagline = "Welcome to Romance!";%>


    <div class="jumbotron mx-4">
        <div class="container">
        </div>
    </div>
    
	<div class="container text-center">
	  <div class="row">
	    <div class="col">
	     <img src="./resources/images/love.png" alt="images"style="width:350px; height:350px;"/> 
	    </div>
	    <div class="col">
	    	<div class="row">
	      		<img src="./resources/images/write.png" alt="images"style="width:350px; height:100px;"/>
	      	</div>
	      	<div class="row">
	      		<img src="./resources/images/romance.png" alt="images"style="width:350px; height:100px;"/> 
	    	</div>
	    </div>

	  </div>
	  <div class="row">
	  </div>
	</div>
		<div class="container text-end">

			<%
				response.setIntHeader("Refresh", 5);
				Date day = new java.util.Date();
				String am_pm;
				int hour = day.getHours();
				int minute = day.getMinutes();
				int second = day.getSeconds();
				if (hour / 12 == 0) {
					am_pm = "AM";
				} else {
					am_pm = "PM";
					hour = hour - 12;
				}
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				
			%>
		
		
			<div class="col text-end">
	  			현재 접속  시각: <%=CT%>
	  		</div>
	<hr>
	</div>	
	<%@ include file="footer.jsp"%>
</body>
</html>