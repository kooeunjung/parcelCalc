<%@page import="com.sunDelivery.web.entity.Parcel"%>
<%@page import="com.sunDelivery.web.dao.mysql.MySQLParcelDao"%>
<%@page import="com.sunDelivery.web.dao.ParcelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String _number = request.getParameter("number");
	String comp = request.getParameter("comp");
	String compdet = request.getParameter("compdet");
	String _si = request.getParameter("si");
	String _wei = request.getParameter("wei");
	String _samc = request.getParameter("samc");
	String _othc = request.getParameter("othc");
	String _pg = request.getParameter("pg");
	String _q = request.getParameter("query");
		
	String number = "";
	int si=1;
	int wei=1;
	int samc=1;
	int othc=1;
	int pg=1;
	String q="";
	
	if (_number != null && !_number.equals(""))
		number = _number;
	
	if (_si != null && !_si.equals(""))
		si = Integer.parseInt(_si);
	
	if (_wei != null && !_wei.equals(""))
		wei = Integer.parseInt(_wei);
	
	if (_samc != null && !_samc.equals(""))
		samc = Integer.parseInt(_samc);
	
	if (_othc != null && !_othc.equals(""))
		othc = Integer.parseInt(_othc);
	
	if (_pg != null && !_pg.equals(""))
		pg = Integer.parseInt(_pg);
	
	if (_q != null && !_q.equals(""))
		q = _q;
	
	
	ParcelDao parceldao = new MySQLParcelDao();
	Parcel parcel = null;
	int result = 0;
	
	if(si==0) {
		result = parceldao.update(number, comp, compdet, wei, samc, othc);
	} else {
		parcel = new Parcel();
		parcel.setPriceCode(number);
		parcel.setCompany(comp);
		parcel.setComdetail(compdet);
		parcel.setBoxSize(si);
		parcel.setBoxWeigtht(wei);
		parcel.setSameCity(samc);
		parcel.setOtherCity(othc);
		
		result = parceldao.update(parcel);
	}
	
	if (result > 0)
		response.sendRedirect("admin-detail.jsp?c=" + number+"&p="+pg+"&q="+q);
	else {
		response.sendRedirect("");
	}
%>