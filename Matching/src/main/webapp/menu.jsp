<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	// 로그인 후 세션으로 등록된 아이디를 가져오는 알고리즘. 
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand  navbar-dark bg-warning">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="http://localhost:8080/WebMarket/welcome.jsp">ROMANCE</a>
			<!-- <a class="navbar-brand" href="/ch18_WebMarket_2/welcome.jsp">Home</a> -->
		</div>
		<div>
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${empty sessionId}">
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/loginMember.jsp"/>">로그인 </a></li>
						<li class="nav-item"><a class="nav-link" href='<c:url value="/member/addMember.jsp"/>'>회원 가입</a></li>
					</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: black">[<%=sessionId%>님]</li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/logoutMember.jsp"/>">로그아웃 </a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/member/updateMember.jsp"/>">회원 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/products.jsp"/>">오늘의 카드</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/addProduct.jsp"/>">내정보</a></li>
						<li class="nav-item"><a class="nav-link" href="<c:url value="/editProduct.jsp?edit=update"/>">진행중인카드</a></li>
					
					</c:otherwise>
				</c:choose>
								<!-- 상품목록 -->
				
								<!-- 상품등록 -->
				
								<!-- 상품수정 -->
				
								<!-- 상품삭제 -->
				<%-- <li class="nav-item"><a class="nav-link" href="<c:url value="/editProduct.jsp?edit=delete"/>">상품 삭제</a></li> --%>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a></li>
			</ul>
		</div>
	</div>
</nav>
