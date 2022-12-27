<html>
<head>
<title>Scripting Tag</title>
</head>
<body>
<!--현재 스크립트 표현 방법 합습중  -->
	<%!int sum(int a, int b) {
		return a + b;
	}%>
	<%
	/*스크립트 태그 내부에서 원래 자바 주석을 하듯이 처리중.*/	
	out.println("2 + 3 = " + sum(2, 3) + "<br>");
	%>
	2 + 3 = 
</body>
</html>