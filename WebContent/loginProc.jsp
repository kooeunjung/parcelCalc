<%@page import="com.sunDelivery.web.dao.mysql.MySQLAdminDao"%>
<%@page import="com.sunDelivery.web.entity.Admin"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	System.out.println("id: "+id);
	System.out.println("pwd: "+pwd);
	Admin admin = new MySQLAdminDao().get(id);
	
	boolean validate = true;
	
	if(admin==null) {
		validate = false;
		System.out.println("멤버 아님");
	} else if(!admin.getPassword().equals(pwd)) {
		validate = false;		
		System.out.println("비밀번호 틀림");
	} else {
		System.out.println("로그인 성공");
		session.setAttribute("id", id);
		response.sendRedirect("index.jsp");
	}
	
	if(validate==false) {
		
		System.out.println("validate넘기기");
		request.setAttribute("validate", validate);
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

%>