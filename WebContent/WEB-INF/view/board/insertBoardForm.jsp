<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="project.BoardDAO"%>
<%@ page import="project.BoardVO"%>
<%@ page import="java.util.List"%>


<%
   request.setCharacterEncoding("UTF-8");
	
%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style.css?" type="text/css">
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



<title>오늘 뭐 먹지 ?</title>
</head>



<body style="font-family: myfont";>
	<!-- 로고 부분  (헤더) -->
	<c:import url="/WEB-INF/header.jsp"></c:import>
	<!-- 네비 바   (헤더) -->
	
	<!-- 메인 내용 -->

	<div class="container p-3 my-3">
		<!-- 검색 하기 기능 -->

		<!--메뉴 고르기 & 최근 레시피 기능  -->
		<div class="row">
			<div class="col-md-12">

				<form action="insertBoard" method="post">
					<table class="table writingBoard" style="text-align: left;">
						<tr>
							<td class="category">TITLE</td>
							<td><input type="text" placeholder="제목을 입력해주세요." name="inp_title"></td>
						</tr>
						<tr>
							<td  class="category">CONTENT</td>
							<td><textarea class="boardContent" aria-setsize="2000" placeholder="내용을 작성하세요." name="inp_contetns"></textarea></td>
						</tr>
					</table>
					<div class="postingBtn">
					<input type="submit" class="btn btn-outline-info complete" value="완료">
					</div>	
				</form>
			</div>


		</div>

		<div style="text-align: right;"></div>

	</div>

	<div class="footer text-center" style="margin-top: auto">
		<div style="margin-top: 60px">
			<span>
			YUM YUM | 서울 특별시 구로구 디지털로 29 대륭포스트타워 | 사업자 등록번호: 111-11-1111</span>
		</div>	
	</div>
</body>

</html>