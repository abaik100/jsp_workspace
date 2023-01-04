<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>
	
	<jsp:include page="/menu.jsp" />
	
	<div class="jumbotron mx-4"style="background-color: ffefca;">
		<div class="container"align="center">
<%@ include file="../dbconn.jsp"%>
			<%
			String msg = request.getParameter("msg");
			String id = (String) session.getAttribute("sessionId");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

		
			while (rs.next()) {
				
				session.setAttribute("sessionGender",rs.getString("gender"));
				session.setAttribute("sessionAddress",rs.getString("address"));
				session.setAttribute("sessionReceive",rs.getString("receive"));
			}
				if (rs != null)
					rs.close();
					if (pstmt != null)
					pstmt.close();
					if (conn != null)
					conn.close();
			
				

			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
				}				
			} else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}

		%>
		</div>
	</div>
		
	</div>
</body>
</html>

<!-- response.sendRedirect("/welcome.jsp");
 -->		 
		