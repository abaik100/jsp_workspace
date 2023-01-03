<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<!-- sql 작업 위해서 해당 클래스들 전부 임포트 -->
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>프로필</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("하트가 20개 차감됩니다.")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron mx-4"style="background-color: ffefca;">
		<div class="container">
			<h1 class="display-3">프로필</h1>
		</div>
	</div>
	<%
	//id 상품의 아이디입니다.
		String id = request.getParameter("id");
	
	//클래스에 등록된 샘플 상품을 사용하는 대신 디비 사용하기위해서. 주석. 
	/* 	ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id); */
	%>
	<!--  디비에 연결하기 위한 정보를 담아둔 페이지. -->
	<!-- 이 파일을 포함하면서 화면상 약간의 간격이 벌어지거나, 틀어지는 현상이 발생할수도 있음. 
	만약, 이상해지면, 이 파일의 위치를 수정 할 예정.  -->
		<%@ include file="dbconn.jsp" %>
	<div class="container">
		<div class="row">
		
		<%
			// 동적쿼리, 해당 sql 문장을 전달할 때 이용할 객체
				PreparedStatement pstmt = null;
			// 디비에서 조회된 정보들을 담을 객체.
				ResultSet rs = null;
				
			// 해당 상품의 정보를 가져오기 위한 쿼리 문장. 
			// ? 의 위치값은 1부터 시작합니다.
					// ?,?,? : 1,2,3 의 순서가 됩니다. 
				String sql = "select * from member where id = ?";
			//현재 작업 중.
			//sql 문장을 pstmt 객체에 담기.
				pstmt = conn.prepareStatement(sql);
			// 동적인 문장에 첫번째 파라미터에 , 해당하는 문자열 값으로 상품의 아이디를 입력 로직. 
				pstmt.setString(1, id);
			// 조회를 할 때, executeQuery() 메소드를 호출
				rs = pstmt.executeQuery();
			// rs ResultSet 라는 형식의 객체에 테이블 형식으로 값을 저장. 
				while (rs.next()) { // 반복문을 통해서 해당 상품의 정보를 불러오면됩니다. 
			%>
		
			<div class="col-md-5">
			<!-- 상세페이지 부분에 사진 출력은 나중에 과제로 제시 예정. 검사는 안함.  -->
			<img src=".<%=rs.getString("photo")%>" style="width: 250px; height:250px">
				<%-- <img src="c:/upload/<%=product.getFilename()%>" style="width: 100%" /> --%>
				<%-- <img src="C:/JSP_Workspace1/ch18_WebMarket_2/src/main/webapp/resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%"> --%>
			</div>
			<div class="col-md-6">
		 	<h3><%=rs.getString("name")%></h3>
				<p><b>아이디 : <%=rs.getString("id")%>
				<p><b>주소</b> : <%=rs.getString("address")%>
				<p><b>전화번호</b> : <%=rs.getString("phone")%>
				<p><b>성별</b> : <%=rs.getString("gender")%>
				
				 <p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("id")%>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 좋아요 &raquo;</a>
<!-- 					<a href="./cart.jsp" class="btn btn-warning">리스트 &raquo;</a>  -->
					<a href="./products.jsp" class="btn btn-secondary"> 되돌아가기 &raquo;</a>
				</form> 
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
