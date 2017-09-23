<%@page import="com.sunDelivery.web.entity.Admin"%>
<%@page import="com.sunDelivery.web.dao.mysql.MySQLAdminDao"%>
<%@page import="com.sunDelivery.web.dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("dd");
	String id = request.getParameter("login");
	String pwd = request.getParameter("password");
	
	id = new String(id.getBytes("8859_1"), "UTF-8");
	pwd = new String(pwd.getBytes("8859_1"), "UTF-8");
	
	Admin admin = new MySQLAdminDao().get(id);
	
	HttpSession session2 = request.getSession();
	boolean validate = true;
	
	if(admin==null) {
		validate = false;
		System.out.println("멤버아님");
	} else if(!admin.getPassword().equals(pwd)){
		validate = false;
		System.out.println("비밀번호 틀림");
	} else {
		session2.setAttribute("id", id);
		System.out.println("로그인 성공");
	}
	
	if(validate) {
		response.sendRedirect("index.jsp");
	} else {
		request.setAttribute("validate", validate);
		request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
}
%>