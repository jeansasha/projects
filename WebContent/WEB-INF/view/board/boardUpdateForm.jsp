<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="project.BoardDAO"%>
<%@ page import="project.BoardVO"%>
<%@ page import="java.util.List"%>


<%
request.setCharacterEncoding("UTF-8");
int no = Integer.parseInt(request.getParameter("no"));

BoardDAO dao = new BoardDAO();
BoardVO vo = dao.getBoard(no);

System.out.println("게시판 넘버:"+no);
%>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/core-img/favicon.ico">
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


<title>글상세</title>
</head>



<body style="font-family: myfont">
	<!--  헤더부분 -->
	<c:import url="/WEB-INF/header.jsp"></c:import>

	<!-- 메인 내용 -->
	<div class="container p-3 my-3">	
	<form action="boardUpdate" method="post">
	
		<!--메뉴 고르기 & 최근 레시피 기능  -->
		<div class="row">
			<div class="col-md-12">
				<input type="hidden" name="no" value="<%= no %>">
					<table class="table writingBoard">
						<tr>
							<th class="category">제목</th>
							<td><input type="text" name="update_title" value="<%=vo.getB_title()%>"></td>
						</tr>
						<tr>
							<th class="category">날짜</th>
							<td><%=vo.getB_date()%></td>
						</tr>
						<tr>
							<th class="category">작성자</th>
							<td><%=vo.getMem_name()%></td>
						</tr>
						<tr>
							<th class="category">내용</th>
							<td><textarea class="boardContent" name="update_content"><%=vo.getB_contents()%></textarea></td>
						</tr>
					</table>
				
			</div>
		</div>
		<!-- 버튼 -->
		<div class="row">
			<div class="col-md-12" style="text-align: right;">
				<input type="submit" class="btn btn-outline-info complete" value="수정">
			</div>
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

</html>

