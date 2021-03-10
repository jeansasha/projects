<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div id="header">
	<header class="header-area">
		<!-- Top Header Area -->
		<div class="top-header-area bg-img" col width="100%"
			style="background-image: url(img/bg-img/header.jpg);">
			<div class="container h-100">
				<div class="row h-100 align-items-center justify-content-between">
					<div class="col-12 col-sm-6"></div>
					<div class="col-12 col-sm-6 col-lg-5 col-xl-4"
						style="margin: auto;" autofocus>
						<!-- Top Search Area -->
					</div>
				</div>
			</div>
		</div>

		<!-- Navbar Area -->
		<div class="bueno-main-menu" id="sticker">
			<div class="classy-nav-container breakpoint-off">
				<div class="container">
					<!-- Menu -->
					<nav class="classy-navbar justify-content-between" id="buenoNav">


						<!-- Navbar Toggler -->
						<div class="classy-navbar-toggler">
							<span class="navbarToggler"><span></span>
							
						</div>

							<!-- Close Button -->
							<div class="classycloseIcon">
								<div class="cross-wrap">
									<span class="top"></span><span class="bottom"></span>
								</div>
							</div>

							<!-- 비로그인/로그인 -->
							<ul>
								<c:choose>
									<c:when test="${Userid == null }">
										<!-- 로그인 전 -->
										<li><a href="login">로그인</a></li>
										<li><a href="signUp">회원가입</a></li>
										<li><a href="boardMain">자유게시판</a></li>
									</c:when>
									<c:otherwise>
										<!-- 로그인 후 -->
										
										<li><a href="#">${Username}</a>님 안녕하세요</li>
										
										<li><a href="logout">로그아웃</a></li>
										<li><a href="mypage">회원정보 수정</a></li>
										<li><a href="boardMain">자유게시판</a></li>
											
									</c:otherwise>
								</c:choose>
							</ul>
						</div>
					</nav>
				</div>

			</div>

		<!-- Logo Area -->
		<div class="logo-area">
			<a href="main"><img src="img/core-img/logo.png"></a>
		</div>


		</div>
	</header>
</div>
