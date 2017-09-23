<%@page import="com.sunDelivery.web.entity.Parcel"%>
<%@page import="com.sunDelivery.web.dao.mysql.MySQLParcelDao"%>
<%@page import="com.sunDelivery.web.dao.ParcelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>택배비 계산기 | 택배 데이터 관리</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/admin-reg.css" />
<script>
	window.addEventListener("load", function() {
		var logo = document.querySelector("#logo");
		var cancle = document.querySelector("#cancle");
		logo.onclick = function() {
			open("../index.jsp","_self");
		}
		cancle.onclick = function() {
			open("admin.jsp","_self");
		}
	});
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div id="header-logo">
			<img id="logo" src="../images/logofinal.png" alt="" class="header-logo" style="cursor: pointer;" />
		</div>
	</header>
	<form action="admin-reg-proc.jsp" method="post">
		<table border="1" class="table notice-table board-cell-width-60">
				<tbody>
					<tr>
						<th>회사명</th>
						<td><input name="comp" type="text"/></td>
					</tr>
					<tr>
						<th>회사 디테일</th>
						<td><input name="compdet" type="text" required="required"/></td>
					</tr>
					<tr>
						<th>크기</th>
						<td><input name="si" type="text"/></td>
					</tr>
					
					<tr>
						<th>무게</th>
						<td><input name="wei" type="text"/></td>
					</tr>
					
					<tr>
						<th>동일권역</th>
						<td><input name="samc" type="text" required="required"/></td>
					</tr>
					
					<tr>
						<th>타지역</th>
						<td><input name="othc" type="text" required="required"/></td>
					</tr>
				</tbody>
		</table>
	<div id="margin-to-table">
			<input type="submit" value="등록"/>&nbsp;&nbsp;&nbsp;
			<input id="cancle" type="button" value="취소"/>
			<!-- <a href="admin-detail.jsp">취소</a> -->
	</div>
	</form>
	
	

	<!-- Footer -->
	<footer id="footer">
		<ul class="copyright">
			<%
	if(session.getAttribute("id")==null) {
		%>
		<li><a href="../login.jsp">Manager login.</a></li>
	<%
	} else { 
		System.out.print(session.getAttribute("id") + " 님 환영합니다");
	%>
	<li><a href="../logout.jsp"><%=session.getAttribute("id")%>님 로그아웃</a></li>
	<li><a href="admin.jsp">관리자 페이지</a></li>
	<%}%>
	
			<li><a id="cr">Credits:</a> <a
				href="http://blog.naver.com/kooyomi0114">EJKOO LAB.</a></li>
		</ul>
	</footer>

	
	<!-- Scripts -->
	<script src="../assets/js/admin-reg.js"></script>
</body>
</html>