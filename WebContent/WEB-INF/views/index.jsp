<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE HTML>
<html>
<head>
<script type="text/javascript">
        function checkFrm() {
               document.frm1.submit();               //submit()
        }
</script>

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
		<form name="signupForm" method="get" action="searchlists/searchlists.jsp">
			
			<p>*무게 단위는 g입니다.</p>
			<input type="text" name="weight" id="weight" placeholder="무게를 입력하세요"/><br />
			<p>*크기는 세 변의 합입니다.</p>
			<input type="text" name="size" id="size" placeholder="크기를 입력하세요" /><br />
			<p>*현재 위치를 입력해주세요.(ex.신촌, 강남)</p>
			<input type="text" name="location" id="location" placeholder="지역을 입력하세요" /><br />
	
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
				<input id="send-button" type="submit" value="Enter"/>
			</div>
		</form>
	</div>

	<!-------- Footer -------->
	<footer id="footer">
		<ul class="copyright">
	<!-----클릭시 보여주기 ----->
	
	<li><a href="#" onclick="setVisibility('layer', 'inline');">Manager ver.</a></li>
	<li>Credits: <a href="http://blog.naver.com/k_seonmin">SM
			LAB.</a></li>
		</ul>
	</footer>

	<!-- Scripts -->
	<script src="assets/js/common.js"></script>
	<script src="assets/js/main.js"></script>
	
	<!-- ---js 클릭시 보여주기 --- -->
	<script language="JavaScript">
		function setVisibility(id, visibility) {
			document.getElementById(id).style.display = visibility;
		}
	</script>
	
	<!-- layer -->
	<div id="layer">
	  <div class="content">
	  <div id="close" onclick="setVisibility('layer','none');" style="cursor: pointer;"><h3>x</h3></div>
		<h2>관리자 로그인</h2>
		<!-- 안보이게 -->
		 <section class="container">
		    <div class="login">
		       <form method="post" action="index-proc.jsp">
		        <p><input type="text" name="login" value="" placeholder="Username or Email"></p>
		        <p><input type="password" name="password" value="" placeholder="Password"></p>
		        <p class="remember_me">
		          <!-- <label>
		            <input type="checkbox" name="remember_me" id="remember_me">
		            Remember me on this computer
		          </label> -->
		        </p>
		        <p class="submit"><input type="submit" name="commit" value="Login"></p>
		      </form>
		    </div>

		    <div class="login-help">
		      <p>Forgot your password? <a href="index.jsp">Click here to reset it</a>.</p>
		    </div>
		  </section>
	  </div>
	 <span class="blank"></span>
	</div>

</body>
</html>