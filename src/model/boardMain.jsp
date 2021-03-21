<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<style>
@import url("/css/recs.css");


</style>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style.css?" type="text/css">


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


<title>자 유 게 시 판</title>
</head>
<body style="font-family: myfont">
	<!--  헤더부분 -->
	<c:import url="/WEB-INF/header.jsp"></c:import>

	<!-- 메인 내용 -->
	<div class="container p-3 my-3" id=board >
		<form class="table-form">
			<fieldset>
				<legend class="hidden text-center m-4">자유게시판</legend>
				<label class="hidden text-light m-4">검색분류</label>
					 <select name="f">
						<option ${(param.f == "b_title")?"selected":"" } value="b_title">제목</option>
						<option ${(param.f == "mem_name")?"selected":"" } value="mem_name">작성자</option>
					</select> 
						<label class="hidden text-light">검색어</label> 
						<input type="text" name="q"value="${param.q}" /> 
						<input class="btn-dark btn-search" type="submit" value="검색" />
			</fieldset>
		</form>

		<!--메뉴 고르기 & 최근 레시피 기능  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">작성자</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="n" items="${list}">
							<tr>
								<td>${n.num}</td>
								<td>${n.mem_name}</td>
								<td><a href="getBoard?no=${n.b_no}">${n.b_title}</a></td>
								<td><fmt:formatDate  pattern="yyyy-MM-dd" value="${n.b_date}"></fmt:formatDate></td>
								<td>${n.b_view}</td>
								<td>${n.cmtCount}</td>
							</tr>
						</c:forEach>
					</tbody>
			</table>
			</div>
		</div>
<!----------------------------------------------페이징------------------------------------------->
		<c:set var="page" value="${(empty param.p)?1:param.p}"></c:set>
		<!--널일경우에 오류강아닉위해 파람 -->
		<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
		<c:set var="lastNum"
			value="${fn:substringBefore(Math.ceil(count/10),'.')}"></c:set>



		<div class="indexer margin-top align-right ">
			<h3 class="hidden">현재 페이지</h3>
			<div>
				<span class="text-orange text-strong">${empty (param.p)?1:param.p }/${lastNum} pages</span>
			</div>
		</div>

			<div>
				<ul class="pagination justify-content-center">

					<!-- 이전페이지번호 -->
					<li class="page-item disabled"><c:if test="${startNum>1}">
							<a href="?p=${startNum-1}&f=${param.f}&q=${param.q}"
								class="btn btn-dark">이전</a>
						</c:if> <c:if test="${startNum<=1}">
							<span class="btn btn-dark" onclick="alert('이전 페이지가 없습니다.');">이전</span>
						</c:if></li>

					<c:forEach var="i" begin="0" end="4">
						<c:if test="${ (startNum) <= lastNum}"></c:if>
						<li class="page-item"><a
							class="text-${(page==(startNum+i))?'primary':''} bold"
							href="?p=${startNum+i}&f=${param.f}&q=${param.q}">${startNum+i}
						</a></li>
					</c:forEach>

					<!-- 다음페이지번호 -->
					<li class="page-item disabled ">
							<c:if
							test="${startNum+4<lastNum}">
							<!-- test다음엔 조건 23넘어설땐 -->
							<a href="?p=${startNum+5}&f=${param.f}&q=${param.q}"
								class="btn btn-dark">다음</a>
							</c:if> 
							<c:if test="${startNum+4>=lastNum}">
							<span class="btn btn-dark" onclick="alert('다음 페이지가 없습니다.');">다음</span>
						</c:if></li>
				</ul>
			</div>

		</div>

		<div class="row m-4">
			<div class="col-md-12 "  style="text-align: right;">
				<input class="btn btn-dark" type="button" value="글쓰기" onclick="Insertform()" id="write" style="width: 10%">
			</div>
		</div>


<!-- footer -->
	<div class="footer text-center" style="margin-top: auto">
		<p>문의사항 : gunlee1226@gmail.com</p>
		<P>주소 : 서울 특별시 구로구 디지털로 29 대륭포스트타워 3차</P>
		<p>11층 1109호 한국직업전문학교</p>
	</div>
</body>

</html>
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
 --%>