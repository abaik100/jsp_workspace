<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>회원 정보</title>
</head>
<body>

	<jsp:include page="/menu.jsp" />
	<%@ include file="../dbconn.jsp"%>
	<div class="jumbotron mx-4"style="background-color: ffefca;">
		<div class="container"align="center">
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
			if (msg != null) {
				if (msg.equals("0"))
					out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
				else if (msg.equals("1"))
					out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
				else if (msg.equals("2")) {
					String loginId = (String) session.getAttribute("sessionId");
					session.setAttribute("sessionGender",rs.getString("gender"));
					session.setAttribute("sessionAddress",rs.getString("address"));
					out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");

					if(!rs.getString("receive").equals("") && rs.getString("send").equals("")) {
						out.println(" <h2 class='alert alert-danger'>" + rs.getString("receive") + "님에게 부터 좋아요를 받았습니다.</h2>");
						session.setAttribute("sessionReceive",rs.getString("receive"));
					}
					if(rs.getString("receive").equals(rs.getString("send"))) {
						out.println(" <h2 class='alert alert-danger'>" + rs.getString("send") + "님과 매칭되었습니다.</h2>");

					}
					else{
						continue;
					}
			} 
				else {
				out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
			}
			}
			}
/* 			response.sendRedirect("/welcome.jsp");
		 */
		
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
</body>
</html>