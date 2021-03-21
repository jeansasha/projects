<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>회원정보확인</title>
</head>
<body style="text-align: center;">
	<header>
			<c:import url="/WEB-INF/header.jsp"></c:import>
	</header>
	<c:choose>
	<c:when test="${Userid == null }">
	
	<script>
	location.href = "login";
	</script>
	
	</c:when>
	<c:otherwise>
	
	
	<form action="mypage" name= "mypageForm" method="post" id="mypageForm">
		<h5>회원정보확인</h5>
		<div>
		<table class="mypage" >
		<tr>
		<td class="categoryMem">이름</td>
		<td><input class="logincss" type="text" value="${Username}" readonly></td>
		</tr>
		<tr>
		<td>아이디</td>
		<td><input class="logincss" type="text" value="${Userid}" readonly></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input class="logincss" type="password" name="input_pwd_check" placeholder="비밀번호를 입력하세요." autofocus></td>
		</tr>
		
		</table>
		
		</div>
	
		<div style="margin: 5%">
			<input class="loginbutton" type="submit" value="확인">
		</div>
	</form>

</c:otherwise>
</c:choose>

<!-- footer -->
<c:import url="/WEB-INF/footer.jsp"></c:import>
	
</body>

</html>