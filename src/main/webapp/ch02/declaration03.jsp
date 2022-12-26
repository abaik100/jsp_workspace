<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<!-- 전역 static, 공유자원  -->
	<%!String makeItLower(String data) {
		return data.toLowerCase();
	}%>
	<%
		out.println(makeItLower("Hello World"));
	%>
</body>
</html>