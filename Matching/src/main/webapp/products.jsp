<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>오늘의 카드</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">오늘의 카드</h1>
		</div>
	</div>

<!--  디비에 연결하기 위한 정보를 담아둔 페이지. -->
		<%@ include file="dbconn.jsp" %>
	<div class="container">
		<div class="row" align="center">
			<%
			// 동적쿼리, 해당 sql 문장을 전달할 때 이용할 객체
				PreparedStatement pstmt = null;
			// 디비에서 조회된 정보들을 담을 객체.
				ResultSet rs = null;
				
			// 해당 상품의 정보를 가져오기 위한 쿼리 문장. 
			// member로 교체

				String sql = "select * from member";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
			<img src=".<%=rs.getString("photo")%>" style="width: 250px; height:250px">
<%-- 				<img src="<%=rs.getString("photo")%>" style="width: 100%"> --%>
				<%-- system.out.println("<%=rs.getString("photo")%>"); --%>
<!-- 				<img src="./upload/member/애쉬(Ashe).PNG" alt="images"style="width:350px; height:350px;"/>  -->
				<%-- <img src="c:/upload/<%=rs.getString("p_fileName")%>" style="width: 100%"> --%>
			<%-- <img src="C:/JSP_Workspace1/ch18_WebMarket_2/src/main/webapp/resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%"> --%>
				<h3><%=rs.getString("name")%></h3>
				<p><%=rs.getString("age")%>
				<p><%=rs.getString("address")%>
				<p><a href="./product.jsp?id=<%=rs.getString("id")%>"class="btn btn-secondary" role="button">상세 정보 &raquo;></a>
			</div>
			<%
				}
				
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
