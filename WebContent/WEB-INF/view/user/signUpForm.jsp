<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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

</head>
<body style = "text-align : center">
<!--  헤드 -->
	<c:import url="/WEB-INF/header.jsp"></c:import>
	<!-- 회원가입 -->
	<form action="signUp" method="post" >
	
		<div>
		<h5>회원가입</h5>
			<br><p style="color: steelblue">*  는 필수 입력칸입니다</p>
			<!-- 이름 -->
			*<input class="logincss" type="text" name="mem_name" id = "name" autofocus placeholder=" 이름을 입력하세요." required><br> 
			 <div class="alert alert-danger" id = "name-danger">이름에 숫자, 특수문자, 공백은 포함될 수 없습니다</div>
			 			 
			<!-- 아이디 -->
			*<input class="logincss" type="text" name="mem_id" id= "id" placeholder=" 아이디를 입력하세요." onkeydown="idCh" maxlength="10" required><br>
			<!--  <input class="loginbutton" type="button" value="중복확인" name="confirm_id" onClick="confirmId()"><br> -->
			 <div class="alert alert-danger" id = "id-danger">4~10자리의 영문으로 입력가능하며 공백은 포함될 수 없습니다 </div>
				
			<!-- 비밀번호 -->
			*<input class="logincss" type="password" name="mem_pwd" id="pwd1" placeholder=" 비밀번호."  maxlength="12" required><br>
				<div class="alert alert-danger" id = "password-danger">8자리 ~ 12자리로 입력가능하며 공백은 포함될 수 없습니다</div>
				
			<!-- 비밀번호확인 -->
			*<input class="logincss" type="password" name="mem_pwd1" id="pwd2" placeholder=" 비밀번호확인." maxlength="12" required><br>
				<div class="alert alert-danger" id = "alert-danger">비밀번호가 일치하지 않습니다</div> 
			
			<!-- 전화번호 -->	
			<p>' - '를 포함해서 입력해주세요.</p>
			*<input class="logincss" type="text" name="mem_num" id="num" placeholder=" 전화번호." required><br>
				<div class="alert alert-danger" id = "num-danger">전화번호 형식에 맞지 않습니다 </div>
					
		</div>
		<div style="margin-top: 5%">
			<input class="loginbutton" type="submit" value="회원가입" onclick="return check()" id="signup" />
		</div>
	</form>
	
	<br>
	<div style="margin: -5px">
		<form action="loginform.jsp" method="post">
			<input class="loginbutton" type="submit" value="로그인">
		</form>
	</div>
	<br>

<c:if test="${vo1 != null }">
	<script>
			alert("현재 사용중인 아이디입니다.")
			location.href = "/signUp"
			</script>
		
		</c:if>
	<!-- footer -->
	
	<div class="footer text-center" style="margin-top: auto">
		<div style="margin-top: 60px">
			<span>
			YUM YUM | 서울 특별시 구로구 디지털로 29 대륭포스트타워 | 사업자 등록번호: 111-11-1111</span>
		</div>	
	</div>
</body>
<script>
function confirmId(){
	
	var url = "/confirmId.jsp?" 
	window.open(url,"get","toolbar=no,location=no,status=no, menubar=no, resizable=no, width=300, height=100");
}


//이름 공식
var reg1 = /^[가-힣a-zA-Z]{2,}$/;
//아이디 공식
var reg2 = /^[a-zA-Z0-9]{4,10}$/; 
//비밀번호 공식
var reg3 = /^[a-zA-Z0-9]{8,12}$/;
//전화번호 공식
var reg4 = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;

$(function(){
    $("#name-danger").hide();
    $("#id-danger").hide();
    $("#password-danger").hide();
    $("#alert-danger").hide();
    $("#num-danger").hide();

   //---- 이름 검사 ----//
   $("#name").keyup(function() {
      if(!reg1.test($("#name").val())){
         $("#name-danger").show();
      } else {
         $("#name-danger").hide();
      }
   });
   
   //---- 아이디 검사 ----//
   $("#id").keyup(function() {
      if(!reg2.test($("#id").val())){
         $("#id-danger").show();
      } else {
         $("#id-danger").hide();
      }
   });
      
   //---- 비밀번호 검사 ----//
   $("#pwd1").keyup(function() {
      if(!reg3.test($("#pwd1").val())){
         $("#password-danger").show()
      } else {
         $("#password-danger").hide()
      }
   });
   
   // 비밀번호 일치 확인
   $("#pwd2").keyup(function() {
   var pwd1 = $("#pwd1").val();
   var pwd2 = $("#pwd2").val(); 
      if(pwd1 != pwd2){
         $("#alert-danger").show();
      }else {
         $("#alert-danger").hide();
      }
   });
   
   //---- 전화번호 검사 ----//
   $("#num").keyup(function() {
      if(!reg4.test($("#num").val())){
         $("#num-danger").show();
      } else {
         $("#num-danger").hide();
      }
   });

});

function check(){
   if($("#name-danger").is(":visible")){
      //alert("Check Name validation.");
      $("#name").focus();
      return false;
   }
   
   if($("#id-danger").is(":visible")){
      //alert("Check ID validation.");
      $("#id").focus();
      return false;
   }
   
   if($("#password-danger").is(":visible")){
      //alert("Check Password validation.");
      $("#pwd1").focus();
      return false;
   }
   
   if($("#alert-danger").is(":visible")){
      //alert("Check Password match or not.");
      $("#pwd2").focus();
      return false;
   }
   
   if($("#num-danger").is(":visible")){
      //alert("Check Mobile Phone validation.");
      $("#num").focus();
      return false;
   }
}
	
</script>

</html>