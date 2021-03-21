<%@page import="model.DessertVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="model.RecipesDAO"%>
<%@ page import="model.RecipesVO"%>
<%@ page import="java.util.List"%>
<%@ page import= "model.MainVO"%>
<%@ page import= "model.MainDAO"%>
<%@ page import= "model.DessertAllVO"%>
<%request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>밥먹고 뭐 먹지?</title>
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/recs.css" type="text/css">

<!-- 폰트 -->


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
<script type="text/javascript">

	//자바에서 DAO 및 VO 호출
	<%
		MainDAO maindao = new MainDAO();
		DessertAllVO allVo = maindao.get_dessertList();
	%>
	
    var randomlinks;
    
    randomlinks = "<%=allVo.getDes_code()%>";
    
    //substring(1, 10) -> 1 - 10 까지 추출
    randomlinks = randomlinks.substring(1, randomlinks.length-1);
    
    console.log(randomlinks);
    
    arrLinks = randomlinks.split(', ');
    
    console.log(arrLinks);
    
    		
    for (var i = 0; i < arrLinks.length; i++) {
    	arrLinks[i] = "http://localhost:8088/Recipes.jsp?code=" + arrLinks[i];
    	console.log(arrLinks[i]);
	}
    
    function randomlink(){
    	window.location=arrLinks[Math.floor(Math.random()*arrLinks.length)]
    }
</script>

<body>

	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-content">
			<h3>Cooking in progress..</h3>
			<div id="cooking">
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div class="bubble"></div>
				<div id="area">
					<div id="sides">
						<div id="pan"></div>
						<div id="handle"></div>
					</div>
					<div id="pancake">
						<div id="pastry"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- header -->
	<c:import url="/WEB-INF/header.jsp"></c:import>

	<!-- ##### Hero Area End ##### -->
   <div class="random" style="margin: 50px auto 50px auto">
   	<form>
   		<img src="/img/bg-img/random.jpg"class="randomDessert" alt="랜덤디저트">
   		<div class="bg"  onclick = "randomlink()" ></div>
   		<span onclick = "randomlink()" class="imgText" >레시피 랜덤 추천</span>
    </form>  
   </div> 


	<!-- 카테고리 -->
	<div class="post-catagory section-padding-100-0 mb-70">
		<h2 href="#" style="text-align: center; margin-bottom: 3%;">공부할때 </h2>
		<div class="container">
			<div class="row justify-content-center">
				<!-- Single Post Catagory -->
				<%
					MainDAO dao = new MainDAO();
					MainVO vo = dao.getDessert(3,4,5);
					RecipesDAO rdao = new RecipesDAO();
					RecipesVO rvo = new RecipesVO();
				
				%>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
					<a href = "Recipes.jsp?code=<%=vo.getMain_code1() %>">
						<img src="<%=vo.getMain_img1() %>" alt="">
						</a>
						</a>
					</div>
					
					<p><%=vo.getMain_name1() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo.getMain_code2() %>">
						<img src="<%=vo.getMain_img2() %>" alt="">
						</a>
					</div>
					<p><%=vo.getMain_name2() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo.getMain_code3() %>">
						<img src="<%=vo.getMain_img3() %>" alt="">
						</a>
					</div>
					<p><%=vo.getMain_name3() %></p>
				</div>
			</div>
		</div>
	</div>

	<div class="post-catagory section-padding-100-0 mb-70">
		<h2 href="#" style="text-align: center; margin-bottom: 3%;">졸릴때 </h2>
		<div class="container">
			<div class="row justify-content-center">
				<%
					MainDAO dao1 = new MainDAO();
					MainVO vo1 = dao1.getDessert(1,3,6);
				%>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo1.getMain_code1() %>">
						<img src="<%=vo1.getMain_img1() %>" alt="">
						</a>
					</div>
					<p><%=vo1.getMain_name1() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo1.getMain_code2() %>">
						<img src="<%=vo1.getMain_img2() %>" alt="">
						</a>
					</div>
					<p><%=vo1.getMain_name2() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo1.getMain_code3() %>">
						<img src="<%=vo1.getMain_img3() %>" alt="">
						</a>
					</div>
					<p><%=vo1.getMain_name3() %></p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="post-catagory section-padding-100-0 mb-70">
		<h2 href="#" style="text-align: center; margin-bottom: 3%;">차박할때 </h2>
		<div class="container">
		<div class="row justify-content-center">
				<%
					MainDAO dao2 = new MainDAO();
					MainVO vo2 = dao2.getDessert(4,6,7);
				%>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo2.getMain_code1() %>">
						<img src="<%=vo2.getMain_img1() %>" alt="">
						</a>
					</div>
					<p><%=vo2.getMain_name1() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo2.getMain_code2() %>">
						<img src="<%=vo2.getMain_img2() %>" alt="">
						</a>
					</div>
					<p><%=vo2.getMain_name2() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo2.getMain_code3() %>">
						<img src="<%=vo2.getMain_img3() %>" alt="">
						</a>
					</div>
					<p><%=vo2.getMain_name3() %></p>
				</div>
			</div> 
		</div>
	</div>
	<div class="post-catagory section-padding-100-0 mb-70">
		<h2 href="#" style="text-align: center; margin-bottom: 3%;">혼술할때 </h2>
		<div class="container">
			<div class="row justify-content-center">
				<%
					MainDAO dao3 = new MainDAO();
					MainVO vo3 = dao3.getDessert(2,4,8);
				%>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo3.getMain_code1() %>">
						<img src="<%=vo3.getMain_img1() %>" alt="">
						</a>
					</div>
					<p><%=vo3.getMain_name1() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo3.getMain_code2() %>">
						<img src="<%=vo3.getMain_img2() %>" alt="">
						</a>
					</div>
					<p><%=vo3.getMain_name2() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo3.getMain_code3() %>">
						<img src="<%=vo3.getMain_img3() %>" alt="">
						</a>
					</div>
					<p><%=vo3.getMain_name3() %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="post-catagory section-padding-100-0 mb-70">
		<h2 href="#" style="text-align: center; margin-bottom: 3%;">건강식 디저트 </h2>
		<div class="container">
			<div class="row justify-content-center">
				<%
					MainDAO dao4 = new MainDAO();
					MainVO vo4 = dao.getDessert(1,4,5);
				
				%>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo4.getMain_code1() %>">
						<img src="<%=vo4.getMain_img1() %>" alt="">
						</a>
					</div>
					<p><%=vo4.getMain_name1() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo4.getMain_code1() %>">
						<img src="<%=vo4.getMain_img2() %>" alt="">
						</a>
					</div>
					<p><%=vo4.getMain_name2() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo4.getMain_code1() %>">
						<img src="<%=vo4.getMain_img3() %>" alt="">
						</a>
					</div>
					<p><%=vo4.getMain_name3() %></p>
				</div>
			</div>
		</div>
	</div>
	<div class="post-catagory section-padding-100-0 mb-70">
		<h2 href="#" style="text-align: center; margin-bottom: 3%;">접대용 디저트 </h2>
		<div class="container">
			<div class="row justify-content-center">
				<%
					MainDAO dao5 = new MainDAO();
					MainVO vo5 = dao5.getDessert(4,6,7);
				%>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo5.getMain_code1() %>">
						<img src="<%=vo5.getMain_img1() %>" alt="">
						</a>
					</div>
					<p><%=vo5.getMain_name1() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo5.getMain_code1() %>">
						<img src="<%=vo5.getMain_img2() %>" alt="">
						</a>
					</div>
					<p><%=vo5.getMain_name2() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo5.getMain_code1() %>">
						<img src="<%=vo5.getMain_img3() %>" alt="">
						</a>
					</div>
					<p><%=vo5.getMain_name3() %></p>
				</div>
			</div>
		</div>
	</div>
	
	<div class="post-catagory section-padding-100-0 mb-70">
		<h2 href="#" style="text-align: center; margin-bottom: 3%;">애기와 함께 </h2>
		<div class="container">
			<div class="row justify-content-center">
				<%
					MainDAO dao6 = new MainDAO();
					MainVO vo6 = dao6.getDessert(3,4,5);
				%>
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo6.getMain_code1() %>">
						<img src="<%=vo6.getMain_img1() %>" alt="">
						</a>
					</div>
					<p><%=vo6.getMain_name1() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo6.getMain_code1() %>">
							<img src="<%=vo6.getMain_img2() %>" alt="">
						</a>
					</div>
					<p><%=vo6.getMain_name2() %></p>
				</div>
				
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-post-catagory mb-30">
						<a href = "Recipes.jsp?code=<%=vo6.getMain_code1() %>">
							<img src="<%=vo6.getMain_img3() %>" alt="">
						</a>
					</div>
					<p><%=vo6.getMain_name3() %></p>
				</div>
			</div>
		</div>
	</div>
	<!-- ##### Catagory Area End ##### -->

<!-- footer -->
<c:import url="/WEB-INF/footer.jsp"></c:import>
	
</body>
</html>

