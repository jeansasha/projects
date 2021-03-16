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
<title>회원정보수정</title>
</head>
<body style="text-align: center;">
	<header>
			<c:import url="/WEB-INF/header.jsp"></c:import>
	</header>
	<form action="update" name= "mypageForm" method="post" id="mypageForm">
		<h5>회원정보수정</h5>
		<div>
		<table class="mypage">
		<tr>
		<td class="categoryMem">이름</td>
		<td><input class="logincss" type="text" value="${Username}" readonly></input></td>
	
		</tr>
		<tr>
		<td >아이디</td>
		<td><input class="logincss" type="text" value="${Userid}" readonly></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input class="logincss" type="password" name="new_pwd" id="pw" placeholder="변경 비밀번호를 입력하세요." autofocus required></td>
		</tr>
		<tr>
		<th colspan = "2">
		<div class="alert alert-danger pwdAlert" id = "password-danger">8자리 ~ 12자리로 입력가능하며 공백은 포함될 수 없습니다</div>
		</th>
		</tr>
		<tr>
		<td>비밀번호 확인</td>
		<td><input class="logincss" type="password" name="new_pwd2" id="pwCheck" placeholder="변경 비밀번호를 입력하세요." required></td>
		</tr>
		<tr>
		<th colspan = "2">
		<div class="alert alert-danger" id = "alert-danger">비밀번호가 일치하지 않습니다</div>
		</th>
		</tr>
		
		<tr>
		<td>전화번호</td>
		<td><input class="logincss" type="text" name="new_num" id = "phnum"  value="${Usernum}"></td>
			
		</tr>
		<tr>
		<th colspan = "2">
		<div class="alert alert-danger" id = "num-danger">전화번호 형식에 맞지 않습니다 </div>
		</th>
		</tr>
		</table>
			
		</div>
	
		<div style="margin-top: 5%">
			<!-- mypageUpdateOk로 이동 -->
			<form action = "update" method="post">
			<input class="loginbutton" type="submit" value="정보수정" onclick="return check()">
			</form>
		</div></br>
		<div style="margin-bottom: 10px">	
			<!-- 회원탈퇴페이지로 이동 -->
			<form action="delete" method="post">
			<input class="loginbutton" type="submit" value="회원탈퇴">
			</form>
		</div>
		
	</form>
	
	</div>
	
	
	<div class="footer text-center" style="margin-top: auto">
		<div style="margin-top: 60px">
			<span>
			YUM YUM | 서울 특별시 구로구 디지털로 29 대륭포스트타워 | 사업자 등록번호: 111-11-1111</span>
		</div>	
	</div>
</body>

<script>
//비밀번호 공식
var reg = /^[a-zA-Z0-9]{8,12}$/;
//전화번호 공식
var reg1 = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;



$(function(){
    $("#password-danger").hide();
    $("#alert-danger").hide();
    $("#num-danger").hide();


   //---- 비밀번호 검사 ----//
   $("#pw").keyup(function() {
      if(!reg.test($("#pw").val())){
         $("#password-danger").show()
      } else {
         $("#password-danger").hide()
      }
   });
   
   // 비밀번호 일치 확인
   $("#pwCheck").keyup(function() {
   var pwd1 = $("#pw").val();
   var pwd2 = $("#pwCheck").val(); 
      if(pwd1 != pwd2){
         $("#alert-danger").show();
      }else {
    	 $("#alert-danger").hide();
      }
   });
   
   //---- 전화번호 검사 ----//
   $("#phnum").keyup(function() {
      if(!reg1.test($("#phnum").val())){
         $("#num-danger").show();
      } else {
         $("#num-danger").hide();
      }
   });

});

function check(){
	 
	   if($("#password-danger").is(":visible")){
	      $("#pw").focus();
	      return false;
	   }
	   
	   if($("#alert-danger").is(":visible")){
	      $("#pwCheck").focus();
	      return false;
	   }
	   
	   if($("#num-danger").is(":visible")){
	      $("#phnum").focus();
	      return false;
	   }
	}

</script>


</html>