<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<style>

</style>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/recs.css" type="text/css">
	<!-- ##### All Javascript Script ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
<title>로그인</title>
</head>
<body style="text-align: center;">
	<header>
			<c:import url="/WEB-INF/header.jsp"></c:import>
	</header>
	<form action="login" name="login" method="post" id="login-form">
		
		<div>
			<input class="logincss" type="text" name="input_mem_id" placeholder=" 아이디를 입력하세요." autofocus><br> 
			<input class="logincss" type="password" name="input_mem_pwd" placeholder=" 비밀번호를 입력하세요."><br>
		</div>
		
		<div style="margin-top: 5%">
			<input class="loginbutton" type="submit" value="로그인 ">
		</div>
	</form>
	<br>
	<div style="margin-bottom: 10px">
		<form action="user?a=signUpForm" method="post">
			<input class="loginbutton" type="submit" value="회원가입">
		</form>
	</div>
	
	<!-- footer -->

	<div class="footer text-center" style="margin-top: auto">
		<div style="margin-top: 60px">
			<span>
			YUM YUM | 서울 특별시 구로구 디지털로 29 대륭포스트타워 | 사업자 등록번호: 111-11-1111</span>
		</div>	
	</div>
	<c:if test="${vo != null }">
		<script>alert("비밀번호가 일치하지 않습니다.")	
	location.href = "/login"
	
	
	</script>
		
		</c:if>
</body>
</html>