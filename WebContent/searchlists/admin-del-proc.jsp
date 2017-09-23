<%@page import="com.sunDelivery.web.dao.mysql.MySQLParcelDao"%>
<%@page import="com.sunDelivery.web.dao.ParcelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("c");
	ParcelDao parceldao = new MySQLParcelDao();
	int result = parceldao.delete(code);
	
	if(result>0) {
		response.sendRedirect("admin.jsp");
	} else {
		response.sendRedirect("");
	}
%>