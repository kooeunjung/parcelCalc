<%@page import="java.util.Arrays"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Array"%>
<%@page import="com.sunDelivery.web.calc.CompanyCalc"%>
<%@page import="com.sunDelivery.web.calc.resultcalc"%>
<%@page import="com.sunDelivery.web.dao.ParcelDao2"%>
<%@page import="com.sunDelivery.web.dao.mysql.MySQLParcelDao3"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sunDelivery.web.calc.costcalc"%>
<%@page import="com.sunDelivery.web.entity.Parcel"%>
<%@page import="java.util.List"%>
<%@page import="com.sunDelivery.web.dao.mysql.MySQLParcelDao"%>
<%@page import="com.sunDelivery.web.dao.ParcelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<%
	String _weight = request.getParameter("weight");
	String _size = request.getParameter("size");
	String _location = request.getParameter("location");
	String _locations= request.getParameter("locations");
	String _visit = request.getParameter("visit");
	
	int weight = 0;
	int size=0;
	int cost=0;
	
	String company="";
	String location="empty";
	String locations="empty";
	String visit="empty";
	
	if(_weight != null && !_weight.equals("")){
		weight = Integer.parseInt(_weight);
	}
	if(_size != null && !_size.equals("")){
		size = Integer.parseInt(_size);
	}
	if(_location != null && !_location.equals("")){
		location =_location;
	}
	if(_locations != null && !_locations.equals("")){
		locations =_locations;
	}
	if(_visit != null && !_visit.equals("")){
		visit =_visit;
	}
	 System.out.println("-----------1-----------");
	 
	 //-----------입력받은 값들--------------
	 resultcalc[] result=new resultcalc[7];
	 CompanyCalc calc= new CompanyCalc();
	 
		 for(int i=0;i<7;++i){
		  result[i]= new resultcalc();
		 }
		 
		 System.out.println("-----------2-----------");
		 ParcelDao2 parceldao = new MySQLParcelDao3(); 	
		 List<Parcel> list = parceldao.getcompany();
			for(Parcel p:list) { //회사 이름가져오는 리스트
		    
			System.out.print(p.getCompany()+" ");
			System.out.println(); 
			}
			
			System.out.println("-----------3-----------");
			for (int i = 0; i < list.size(); ++i) {//계산하기 위한 객체에 함수대입
				
				company = list.get(i).getCompany();
				result[i].setCompany(company);

				System.out.println("company: " + result[i].getCompany());
			}

			for (int i = 0; i < list.size(); ++i) { //계산과정
				String tmp = result[i].getCompany();
				cost = calc.getcost(tmp, weight, size, visit, locations);
				if (cost == 0)
					cost = 99999;
				result[i].setCost(cost);
			}
			
			
				/* Arrays.sort(result); //가격순으로 정렬 하면 RESULT[0] */
	
	String url = "http://map.daum.net/link/search/" + location + " " + result[0].getCompany();
	System.out.println("-----------url-----------");
	System.out.println(url);
	
	if (result[0].getCompany().equals("편의점")) {
		url = url + " 택배";
	}
%>
<html>
<head>
<meta charset="utf-8" />
<title>택배비 계산기 | 계산 결과</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/searchlists.css" />
<script type="text/javascript">
	window.addEventListener("load", function(e) {
		var mapButton = document.querySelector("#map-button");
		mapButton.onclick = function() {
			open("<%=url%>","_blank");
		}
	});
	
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
			<img id="logo" src="../images/logofinal.png" alt="" class="header-logo" style="cursor: pointer;"/>
		</div>
	</header>
	<div id="resultmain" style="	margin-top: 100px;">
		<h1 id="resultpage">최저가 택배</h1>
		<%if(result[0].getCost()==99999){%>
			<h1>규격초과</h1>
		<%}else{ %>
			<h1><%=result[0].getCompany() %> 
			 <%=result[0].getCost() %>원</h1>
			 <%} %>
	</div>
	<div id="close-div">
		<input id="map-button" type="submit" value="가까운 지점 찾기" />
	</div>
	<div class="notice margin">
		<h3 class="hidden">공지목록</h3>
		<table class="table notice-table">
			<thead>
				<tr>
					<td>순위</td>
					<td>회사명</td>
					<td>가격</td>
				</tr>
			</thead>
			<tbody>
			<%for(int i=0;i<list.size();++i){ %>
				<tr>
					<td><%=i+1 %></td>		
					<td><%=result[i].getCompany()%></td>
					<%if(result[i].getCost()==99999){%>
						<td>규격초과</td>
					<%}else{ %>
					<td><%=result[i].getCost() %></td>
					<%} %>
				</tr>
				<%} %>
			</tbody>
		</table>
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
			<li><a href="searchlists/admin.jsp">관리자 페이지</a></li>
			<%
				}
			%>
			<li><a id="cr">Credits:</a> <a
				href="http://blog.naver.com/kooyomi0114">EJKOO LAB.</a></li>
		</ul>
	</footer>
	<!-- Scripts -->
	<script src="../assets/js/searchlists.js"></script>
	<script src="../assets/js/script.js"></script>
</body>
</html>