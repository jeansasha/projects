<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="/img/core-img/favicon.ico">
<link rel="stylesheet" href="/css/style.css?" type="text/css">
<link rel="stylesheet" href="/css/recs.css?" type="text/css">



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
						<input class="btn btn-outline-secondary" type="submit" value="검색" />
					<div class="writeBtn">
					<input class="btn btn-outline-info posting" type="button" value="글쓰기" onclick="Insertform()" id="write">
					</div>	
						
						
			</fieldset>
		</form>

		<!--메뉴 고르기 & 최근 레시피 기능  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<thead>
					
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
<%-- 								<td>${n.cmtCount}</td> --%>
							</tr>
						</c:forEach>
					</tbody>
			</table>
			</div>
		</div>
<!----------------------------------------------페이징------------------------------------------->
		<c:set var="page" value="${(empty param.p)?1:param.p}"></c:set>
		
		<!-- starNum : 첫 페이지그룹 번호 -->
		<c:set var="startNum" value="${page-(page-1)%5}"></c:set>
		<!-- lastNum : 마지막 페이지 번호 -->
		<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(count/10),'.')}"></c:set>

			<div>
				<ul class="pagination justify-content-center">

					<!-- 이전페이지번호 -->
					<li class="page-item disabled">
						<c:if test="${startNum>1}">
							<a href="?p=${startNum-1}&f=${param.f}&q=${param.q}" class="btn btn-outline-secondary paging">이전페이지</a>
						</c:if> 
						<c:if test="${startNum<=1}">
							<span class="btn btn-outline-secondary paging" onclick="alert('이전 페이지가 없습니다.');">이전페이지</span>
						</c:if>
					</li>
					
					<c:set var="loopBreak" value="false" />
					<c:forEach var="i" begin="0" end="4">
						<c:if test="${not loopBreak}" >
							
							<li class="page-item">
								<!--  href="?p => ?뒤부터 넘겨줄 파라미터값 -->
								<a class="text-${(page==(startNum+i))?'primary':''}" href="?p=${startNum+i}&f=${param.f}&q=${param.q}"> ${startNum+i}</a>
							 </li>
							 
							<c:if test="${(startNum+i) >= lastNum}">
								<c:set var="loopBreak" value="true" />
							</c:if>

						</c:if>

					</c:forEach>

					<!-- 다음페이지번호 -->
					<li class="page-item disabled ">
							<c:if
							test="${startNum+4<lastNum}">
							<!-- test다음엔 조건 23넘어설땐 -->
							<a href="?p=${startNum+5}&f=${param.f}&q=${param.q}" class="btn btn-outline-secondary paging">다음페이지</a>
							</c:if> 
							<c:if test="${startNum+4>=lastNum}">
							<span class="btn btn-outline-secondary paging" onclick="alert('다음 페이지가 없습니다.');">다음페이지</span>
						</c:if></li>
				</ul>
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

