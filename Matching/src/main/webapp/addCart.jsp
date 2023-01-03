<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>

<%
		
			String id = request.getParameter("id");
			String Mainid = (String) session.getAttribute("sessionId");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int num = 0;
			
			String sql = "UPDATE member SET send=? WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, Mainid);
			pstmt.executeUpdate();
			
			String sql2 = "UPDATE member SET receive=? WHERE id=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, Mainid);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			String sql3 = "select * from member where id = ?";
			pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, Mainid);
			rs = pstmt.executeQuery();
			

	
			
		
			if (rs != null)
				rs.close();
				if (pstmt != null)
				
				if (conn != null)
				conn.close();
				response.sendRedirect("products.jsp?edit=update");
		%>