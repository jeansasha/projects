<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">


<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="stylesheet" href="css/style.css?" type="text/css">
<link rel="stylesheet" href="css/recs.css?" type="text/css">

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

<title>자유게시판</title>
</head>

<body style="font-family: myfont">
	<!--  헤더부분 -->
	<c:import url="/WEB-INF/header.jsp"></c:import>
<div class="container">
		<!--게시판글  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table">
				<tr>
				<td class="category">DATE</td>
				<td>${vo.b_date}</td>
				</tr>
				<tr>
				<td>TITLE</td>
				<td>${vo.b_title}</td>
				</tr>
				<tr>
				<td>NAME</td>
				<td>${vo.mem_name}</td>
				</tr>
				<tr>
				<td>CONTENT</td>
				<td>${vo.b_contents}</td>
				</tr>
				</table>
			</div>
		</div>
		
		<div class="row m-4 divUpdate">
			<div class="col-md-12" style="text-align: right;">
				<input class="btn btn-outline-secondary" type="button" value="목록" onclick="location.href='/boardMain'" style="width: 80px">
				<!-- 수정삭제 -->
				<c:set var="mem_code" value="${vo.mem_code}" />
				<c:choose>
					<c:when test="${Usercode == null}">
						
						<input class="btn btn-outline-secondary" type="button" value="로그인" onclick="location.href='/login'" style="width: 80px">
					</c:when>

					<c:when test="${Usercode == vo.mem_code}">
						
						<a href="boardUpdate?no=${no}"> <input class="btn btn-outline-secondary update" type="button"
						value="수정"></a>
						<a href="boardDelete?no=${no}"> <input class="btn btn-outline-secondary update" type="button"
						value="삭제"></a>
								
						
					</c:when>
				</c:choose>
			</div>

		</div>
</div>

<!-- footer -->
<c:import url="/WEB-INF/footer.jsp"></c:import>
</body>

<script>
function Insertform() {
	var Userid = '<%=(String) session.getAttribute("Userid")%>';
		if (Userid == "null") {
			alert("로그인 후 이용가능합니다.");
			location.href = '/login';
		}

		else {

			location.href = '/insertBoard';
		}
	}
</script>

</html>

