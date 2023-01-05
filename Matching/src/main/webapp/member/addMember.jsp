<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.id.value) {
			alert("아이디를 입력하세요.");
			return false;
		}

		if (!document.newMember.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (document.newMember.password.value != document.newMember.password_confirm.value) {
			alert("비밀번호를 동일하게 입력하세요.");
			return false;
		}
	}
</script>
<title>회원 가입</title>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class="jumbotron mx-4" style="background-color: ffefca;">
		<div class="container" align="center">
			<img src="../resources/images/회원정보.png" alt="images"
				style="width: 190px; height: 60px;" />
		</div>
	</div>
	<!-- enctype 을 multipart/form-data로 바꿔줘야 한다. -->
	<div class="container">

		<form name="newMember" class="form-horizontal"
			action="processAddMember.jsp" method="post"
			onsubmit="return checkForm()" enctype="multipart/form-data">
			<div class="form-group  row">
				<label class="col-sm-2 ">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="id">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="text" class="form-control"
						placeholder="password">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">비밀번호확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="text" class="form-control"
						placeholder="password confirm">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control"
						placeholder="name">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<input name="gender" type="radio" value="남" /> 남 <input
						name="gender" type="radio" value="여" /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">나이</label>
				<div class="col-sm-3">
					<input name="age" type="text" class="form-control"
						placeholder="name">
				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control"
						placeholder="phone">

				</div>
			</div>
			<div class="form-group  row">
				<label class="col-sm-2 ">지역</label>
				<div class="col-sm-10">
					<select name="address">
						<option>서울</option>
						<option>부산</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">사진등록<fmt:message key="productImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="photo" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">사진등록2<fmt:message key="productImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="photo2" class="form-control">
				</div>
			</div>


			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록 ">
					<input type="reset" class="btn btn-primary " value="취소 "
						onclick="reset()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>