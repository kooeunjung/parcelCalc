<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sunDelivery.web.entity.Parcel"%>
<%@page import="java.util.List"%>
<%@page import="com.sunDelivery.web.dao.ParcelDao"%>
<%@page import="com.sunDelivery.web.dao.mysql.MySQLParcelDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	String _page = request.getParameter("p");
	String _query = request.getParameter("q");
	
	int pg = 1;
	String query = "";
	
	if (_page != null && !_page.equals("")) // 전달된 page값이 있다면
		pg = Integer.parseInt(_page);
	
	if (_query != null && !_query.equals(""))
		query=_query;
	
	
	ParcelDao parceldao = new MySQLParcelDao();
	List<Parcel> list = parceldao.getList(pg,query);
	int size = parceldao.getSize(query);
%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<title>택배비 계산기 | 관리자페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/admin.css" />
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
			<img id="logo" src="../images/logofinal.png" alt=""
				class="header-logo" style="cursor: pointer;" />
		</div>
	</header>
	<div id="adminmain" style="margin-top: 100px;">
		<h1 id="admin">관리자페이지[<%=size%>]</h1>
	</div>

	<div id="signup-sub">
	<form id="search-form">
		<fieldset>
			<legend class="hidden">검색필드</legend>
			<div class="form-group">
				<label>회사명</label>
				<input name="q" type="text" value="<%=query %>" placeholder="검색어를 입력하세요"/>
			</div>
			<div>
				<input type="submit" value="검색" />
				<input type="hidden" name="p" value="1" />
			</div>
		</fieldset>
	</form>
	</div>

	<div class="notice margin">
		<h3 class="hidden">공지목록</h3>
		<div class="write">
			<a href="admin-reg.jsp">택배 등록&nbsp;&nbsp;</a>
		</div>
		<table class="table notice-table ">
		
			<thead>
				<tr class="board-cell-hd">
					<td>번호</td>
					<td>회사명</td>
					<td>회사 디테일</td>
					<td>크기</td>
					<td>무게</td>
					<td>동일권역</td>
					<td>타지역</td>
				</tr>
			</thead>
			<tbody>
				<template id="manage-row">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				</template>
				<%
					for(Parcel p:list) {
				%>
				<tr>
					<td><%=p.getPriceCode() %></td>
					<td><%=p.getCompany()%></td>
					<td><a href="admin-detail.jsp?c=<%=p.getPriceCode()%>&p=<%=pg%>&q=<%=query%>"><%=p.getComdetail() %></a></td>
					<td><%=p.getBoxSize() %></td>
					<td><%=p.getBoxWeigtht() %></td>
					<td><%=p.getSameCity() %></td>
					<td><%=p.getOtherCity() %></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		
	</div>
	<%int last = (size %10)>0 ? size/10+1: size/10;%>
	<br />
	<div><%=pg%>/<%=last %>pages</div>
	<div>
		<ul class="pagelist">
			<%for(int i=1; i<=last; i++) {%>
			<li><a href="?p=<%=i%>&q=<%=query%>"><%=i %>&nbsp;</a></li>
			<%}%>
		</ul>
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
			<%
				}
			%>

			<li><a id="cr">Credits:</a> <a
				href="http://blog.naver.com/k_seonmin">SM LAB.</a></li>
		</ul>
	</footer>
	<!-- Scripts -->
	<script src="../assets/js/admin.js"></script>
</body>
</html>