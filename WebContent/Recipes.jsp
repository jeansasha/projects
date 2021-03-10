<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "project.RecipesDAO" %>
<%@ page import= "project.RecipesVO" %>

<%RecipesDAO rdao = new RecipesDAO();%>

<%int code = Integer.parseInt(request.getParameter("code")); 
	RecipesVO rvo = rdao.getRecipes(code);
	request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html lang="ko">
<style>
@import url("css/recs.css");
</style>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="stylesheet" href="css/style.css?" type="text/css">



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


<title>레시피</title>
</head>



<body style="font-family: myfont">
	<!--  헤더부분 -->
	<c:import url="/WEB-INF/header.jsp"></c:import>

	<!-- 메인 내용 -->
	<div class="container p-3 my-3">


		<!--메뉴 고르기 & 최근 레시피 기능  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table recipe">
					<tr>
						<th>디저트 이름</th>

						<td><%=rvo.getDes_name() %></td>
					</tr>
					
						<tr>
						<th>간단정보</th>
						<td><%=rvo.getDes_summ() %></td>
					</tr>
						<tr>
						<th>재료</th>
						<td><%=rvo.getDes_mete() %></td>

					</tr>
					<tr>
						<th>음식 사진</th>
						<td><img src = <%=rvo.getDes_img() %>></td>
					</tr>
				
					<tr>
						<th>레시피</th>
						<td><%=rvo.getDes_rec() %></td>

					</tr>
				
					<tr>
						<th>분류</th>
						
						<td><%=rvo.getKinds_name() %></td>
					</tr>
				</table>


			</div>

			</div>
			</div>

		<div class="footer text-center" style="margin-top: auto">
			<p>문의사항 : gunlee1226@gmail.com</p>
			<P>주소 : 서울 특별시 구로구 디지털로 29 대륭포스트타워 3차</P>
			<p>11층 1109호 한국직업전문학교</p>
		</div>
</body>

</html>
<script>

</script>
