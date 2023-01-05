<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>내정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron mx-4" style="background-color: ffefca;">
		<div class="container" align="center">
			<img src="./resources/images/내정보.png" alt="images"
				style="width: 150px; height: 60px;" />
		</div>
	</div>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("sessionId");
	/* 	System.out.println(id); */
	%>
	<!--  디비에 연결하기 위한 정보를 담아둔 페이지. -->
	<%@ include file="dbconn.jsp"%>
	<div class="container">
		<div class="row" align="center">
			<%
			// 동적쿼리, 해당 sql 문장을 전달할 때 이용할 객체
			PreparedStatement pstmt = null;
			// 디비에서 조회된 정보들을 담을 객체.
			ResultSet rs = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;

			// 해당 상품의 정보를 가져오기 위한 쿼리 문장. 
			// member로 교체

			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			String sql2 = "select * from member_Images where id = ? order by num ASC limit 1";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, id);
			rs2 = pstmt.executeQuery();

			String sql3 = "select * from member_Images where id = ? order by num DESC limit 1";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, id);
			rs3 = pstmt.executeQuery();

			while (rs.next() && rs2.next() && rs3.next()) {
			%>

			<div class="container">
				<div class="row">
					<div class="col-6">
						<img src=".<%=rs2.getString("photo")%>"
							style="width: 200px; height: 300px;" rounded
							float-start" alt="..."> <img
							src=".<%=rs3.getString("photo")%>"
							style="width: 200px; height: 300px;" rounded
							float-start" alt="...">
							
					</div>
					<div class="col col-lg-2">
					<div class="jumbotron mx-4" style="background-color: ffffff;">
					</div>
					</div>
					<div class="col">
					<div class="text-left">
					
						<h3><%=rs.getString("name")%></h3>
						<p>
						<b>아이디</b> :
							<%=rs.getString("id")%>
						<p>
						<b>나이</b> :
							<%=rs.getString("age")%>
						<p>
						<b>성별</b> :
							<%=rs.getString("gender")%>
						<p>
						<b>주소</b> :
							<%=rs.getString("address")%>
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
					</div>
					</div>
					<hr>
				</div>
				<jsp:include page="footer.jsp" />
</body>
</html>