<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>진행중인 카드</title>
<script type="text/javascript">
	function matching() {
		if (confirm("매칭이 되었습니다.")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>

</head>
<%
	String edit = request.getParameter("edit");
%>
</head>
<script type="text/javascript">
	function addToCart() {
		if (confirm("하트가 20개 차감됩니다.")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron mx-4"style="background-color: ffefca;">
		<div class="container" align = "center">
			<img src="../resources/images/진행중인_카드.png" alt="images"style="width:290px; height:70px;"/>
		</div>
	</div>
		<%
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("sessionId");
	String receive = (String) session.getAttribute("sessionReceive");
/* 	System.out.println(id); */
	%>
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

				
				String sql = "select * from member where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, receive);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
			<img src=".<%=rs.getString("photo")%>" style="width: 250px; height:250px">
				<h3><%=rs.getString("name")%></h3>
				<p><b>나이</b> : <%=rs.getString("age")%>
				<p><b>성별</b> : <%=rs.getString("gender")%>
				<p><b>주소</b> : <%=rs.getString("address")%>
				 <p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("id")%>" method="post">
				<a href="#" class="btn btn-info" onclick="matching()"> 좋아요 &raquo;</a>
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
