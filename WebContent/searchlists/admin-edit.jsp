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
<link rel="stylesheet" href="../assets/css/admin-edit.css" />
<%
	String code = request.getParameter("c");
	String _pg = request.getParameter("p");
	String _q = request.getParameter("q");
	
	int pg=1;
	String q="";
	if (_pg != null && !_pg.equals("")) // 전달된 page값이 있다면
		pg = Integer.parseInt(_pg);
	
	if (_q != null && !_q.equals(""))
		q = _q;
	
	ParcelDao parceldao = new MySQLParcelDao();
	Parcel pc = parceldao.get(code);
%>
<script>
	window.addEventListener("load", function() {
		var logo = document.querySelector("#logo");
		logo.onclick = function() {
			open("../index.jsp","_self");
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
	<form action="admin-edit-proc.jsp" method="post">
		<table border="1" class="table notice-table board-cell-width-60">
				<tbody>
					<tr>
						<th>번호</th>
						<td><input name="number" type="text" value="<%=pc.getPriceCode() %>" required="required"/></td>
					</tr>
					<tr>
						<th>회사명</th>
						<td><input name="comp" type="text" value="<%=pc.getCompany() %>" required="required"/></td>
					</tr>
					<tr>
						<th>회사 디테일</th>
						<td><input name="compdet" type="text" value="<%=pc.getComdetail() %> " required="required"/></td>
					</tr>
					<tr>
						<th>크기</th>
						<td><input name="si" type="text" value="<%=pc.getBoxSize() %>"/></td>
					</tr>
					
					<tr>
						<th>무게</th>
						<td><input name="wei" type="text" value="<%=pc.getBoxWeigtht() %>"/></td>
					</tr>
					
					<tr>
						<th>동일권역</th>
						<td><input name="samc" type="text" value="<%=pc.getSameCity() %>" required="required"/></td>
					</tr>
					
					<tr>
						<th>타지역</th>
						<td><input name="othc" type="text" value="<%=pc.getOtherCity() %>" required="required"/></td>
					</tr>
				</tbody>
		</table>
		<div id="margin-to-table">
			<a href="admin.jsp?p=<%=pg%>&q=<%=q%>">목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<input type="hidden" name=number value="<%=code %>" />
			<input type="hidden" name=pg value="<%=pg %>" />
			<input type="hidden" name=query value="<%=q %>" />		
			<input type="submit" value="저장"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%-- <a href="admin-detail.jsp?c=<%=code%>">저장</a> --%>
			<a href="admin-detail.jsp?c=<%=code%>&p=<%=pg%>&q=<%=q %>">취소</a>
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
	<script src="../assets/js/admin-edit.js"></script>
</body>
</html>