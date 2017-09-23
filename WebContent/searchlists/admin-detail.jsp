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
<link rel="stylesheet" href="../assets/css/admin-detail.css" />
<%
	String code = request.getParameter("c");
	String _pg = request.getParameter("p");
	String _q = request.getParameter("q");
	
	int pg=1;
	String q="";
	if (_pg != null && !_pg.equals("")) // 전달된 page값이 있다면
		pg = Integer.parseInt(_pg);
	
	if (_q != null && !_q.equals("")) // 전달된 page값이 있다면
		q = _q;
	
	ParcelDao parceldao = new MySQLParcelDao();
	Parcel pc = parceldao.get(code);
%>
<script>
	window.addEventListener("load", function() {
		var logo = document.querySelector("#logo");
		var deleteCheck = document.querySelector("#deleteCheck");
		
		logo.onclick = function() {
			open("../index.jsp","_self");
		}
		
		deleteCheck.onclick = function() {
			if(confirm("삭제 하시겠습니까?")) {
				open("admin-del-proc.jsp?c=<%=code%>","_self");
			} else {
				alert("삭제 취소되었습니다.");
				return;
			}
		}
	});
	/*
	function deleteCheck(){ 
if (confirm("삭제 하시겠습니까?")){ 
// 삭제하는 페이지로 Go Go 
}else{ 
alert("삭제 취소 되었습니다."); 
return; 
} 
} 
	*/
</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div id="header-logo">
			<img id="logo" src="../images/logofinal.png" alt="" class="header-logo" style="cursor: pointer;" />
		</div>
	</header>
	
	<table border="1" class="table notice-table board-cell-width-60">
				<tbody>
					<tr>
						<th>번호</th>
						<td><%=pc.getPriceCode() %></td>
					</tr>
					<tr>
						<th>회사명</th>
						<td><%=pc.getCompany() %></td>
					</tr>
					<tr>
						<th>회사 디테일</th>
						<td><%=pc.getComdetail() %></td>
					</tr>
					<tr>
						<th>크기</th>
						<td><%=pc.getBoxSize() %></td>
					</tr>
					
					<tr>
						<th>무게</th>
						<td><%=pc.getBoxWeigtht()%></td>
					</tr>
					
					<tr>
						<th>동일권역</th>
						<td><%=pc.getSameCity() %></td>
					</tr>
					
					<tr>
						<th>타지역</th>
						<td><%=pc.getOtherCity()%></td>
					</tr>
				</tbody>	
	</table>
	<div id="margin-to-table">
		<a href="admin.jsp?p=<%=pg%>&q=<%=q%>">목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="admin-edit.jsp?c=<%=code%>&p=<%=pg%>&q=<%=q%>">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a id="deleteCheck" style="cursor: pointer;">삭제</a>
	</div>
	

	<!-- Footer -->
	<footer id="footer">
		<ul class="copyright">
			<%
				if (session.getAttribute("id") == null) {
			%>
			<li><a href="../login.jsp">Manager login.</a></li>
			<%
				} else {
					System.out.print(session.getAttribute("id") + " 님 환영합니다");
			%>
			<li><a href="../logout.jsp"><%=session.getAttribute("id")%>님
					로그아웃</a></li>
			<li><a href="admin.jsp">관리자 페이지</a></li>
			<%}%>

			<li><a id="cr">Credits:</a> <a
				href="http://blog.naver.com/kooyomi0114">EJKOO LAB.</a></li>
		</ul>
	</footer>

	
	<!-- Scripts -->
	<script src="../assets/js/admin-detail.js"></script>
</body>
</html>