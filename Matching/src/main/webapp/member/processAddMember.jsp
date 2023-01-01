<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
request.setCharacterEncoding("UTF-8");
String path = "/upload/member";
//실제적으로 저장되는 폴더 위치
String savePath = request.getServletContext().getRealPath(path) ;
int maxSize = 100*1024*1024;
String encoding = "utf-8";

// 클라이언트 name = "photo" -> 임시저장소 -> 지정한 위치 파일명으로 저장
MultipartRequest multi = new MultipartRequest(request,savePath,maxSize,encoding,new DefaultFileRenamePolicy());

//multi가 생성되면 request에서 받을 수 없다
String id = multi.getParameter("id");
String password = multi.getParameter("password");
String name = multi.getParameter("name");
String gender = multi.getParameter("gender");
String age = multi.getParameter("age");
String phone = multi.getParameter("phone");
String address = multi.getParameter("address");
//server에 실제적으로 올라간 파일명
//저장데이터 위치 path + "/" + 서버의 파일명
String photo = multi.getFilesystemName("photo");
	if(photo == null || photo.equals(""))
		photo  = "noImage.jpg";
	else
		photo = path + "/"+ photo;


	Date currentDatetime = new Date(System.currentTimeMillis());
	java.sql.Date sqlDate = new java.sql.Date(currentDatetime.getTime());
	java.sql.Timestamp timestamp = new java.sql.Timestamp(currentDatetime.getTime());
%>

<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/WebMarketDB"
	driver="com.mysql.jdbc.Driver" user="root" password="k404" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO member VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
   <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=age%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=photo%>" />
	<sql:param value="<%=timestamp%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp?msg=1" />
</c:if>

