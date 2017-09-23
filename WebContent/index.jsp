<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>택배비 계산기 | 내 택배비는 얼마?</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body>
	<!-- Header -->
	<header id="header" class="clearfix">
		<h1>택배비 계산기</h1>
		<p>내 택배비는 얼마?</p>
	</header>

	<!-- Signup Form -->
	<div class="signup-form">
		<form name="signupForm" method="get"
			action="searchlists/searchlists.jsp">

			<p>*무게 단위는 g입니다.</p>
			<input type="text" name="weight" id="weight" placeholder="무게를 입력하세요" /><br />
			<p>
				*크기: 세 변의 합<br> (단, 편의점은 크기가 상관없으므로 편의점 검색은 0을 입력해주세요)
			</p>
			<input type="text" name="size" id="size" placeholder="크기를 입력하세요" /><br />
			<p>*현재 위치를 입력해주세요.(ex.신촌, 강남)</p>
			<input type="text" name="location" id="location"
				placeholder="지역을 입력하세요" /><br />

			<div>
				<input type="radio" name="locations" value="same-location"
					autocomplete="off" checked>동일권역 <input type="radio"
					name="locations" value="diff-location" autocomplete="off">타지역
				<input type="radio" name="locations" value="jeju-island"
					autocomplete="off">제주<br />
			</div>

			<div>
				<input type="checkbox" name="visit" value="visit">방문접수
			</div>

			<div id="signup-sub">
				<input id="send-button" type="submit" value="Enter" />
			</div>
		</form>
	</div>

	<!-------- Footer -------->
	<footer id="footer">
		<ul class="copyright">
			<!-----클릭시 보여주기 ----->
			<%
				if (session.getAttribute("id") == null) {
			%>
			<li><a href="login.jsp">Manager login.</a></li>
			<%
				} else {
					System.out.print(session.getAttribute("id") + " 님 환영합니다");
			%>
			<li><a href="logout.jsp"><%=session.getAttribute("id")%>님
					로그아웃</a></li>
			<li><a href="searchlists/admin.jsp">관리자 페이지</a></li>
			<%
				}
			%>

			<li><a id="cr">Credits:</a> <a
				href="http://blog.naver.com/kooyomi0114">EJKOO LAB.</a></li>
		</ul>
	</footer>

	<!-- Scripts -->
	<script src="assets/js/common.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/script.js"></script>

</body>
</html>