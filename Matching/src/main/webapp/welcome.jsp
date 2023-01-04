<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.Date"%>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!String greeting = "Romance에 오신 것을 환영합니다";
	String tagline = "Welcome to Romance!";%>
	<div class="jumbotron mx-4" style="background-color: ffefca;">
		<div class="container"></div>
	</div>

	<div class="container text-center">
		<div class="row">
			<div class="col">
				<img src="./resources/images/love.png" alt="images"
					style="width: 250px; height: 250px; margin-top: 50px; " />
			</div>
			<div class="col">
				<img src="./resources/images/R2.gif" alt="images"
					style="width: 500px; height: 350px; vertical-align: top;" />
			</div>


		</div>


	</div>
	<div class="jumbotron mx-4" style="background-color: ffffff;">
		<div class="container"></div>
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
			<%-- 	  			현재 접속  시각: <%=CT%> --%>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>