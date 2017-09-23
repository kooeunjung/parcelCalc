<%@page import="com.sunDelivery.web.entity.Parcel"%>
<%@page import="com.sunDelivery.web.dao.mysql.MySQLParcelDao"%>
<%@page import="com.sunDelivery.web.dao.ParcelDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String comp = request.getParameter("comp");
	String compdet = request.getParameter("compdet");
	String _si = request.getParameter("si");
	String _wei = request.getParameter("wei");
	String _samc = request.getParameter("samc");
	String _othc = request.getParameter("othc");
	
	int si=0;
	int wei=0;
	int samc=0;
	int othc=0;
	
	if (_si != null && !_si.equals(""))
		si = Integer.parseInt(_si);
	
	if (_wei != null && !_wei.equals(""))
		wei = Integer.parseInt(_wei);
	
	if (_samc != null && !_samc.equals(""))
		samc = Integer.parseInt(_samc);
	
	if (_othc != null && !_othc.equals(""))
		othc = Integer.parseInt(_othc);
	
	System.out.println("comp: "+comp);
	System.out.println("compdet: "+compdet);
	System.out.println("si: "+si);
	System.out.println("wei: "+wei);
	System.out.println("samc: "+samc);
	System.out.println("othc: "+othc);
	
	ParcelDao parceldao = new MySQLParcelDao();
	
	Parcel parcel = new Parcel();
	
	parcel = new Parcel();
	
	parcel.setCompany(comp);
	parcel.setComdetail(compdet);
	parcel.setBoxSize(si);
	parcel.setBoxWeigtht(wei);
	parcel.setSameCity(samc);
	parcel.setOtherCity(othc);
	
	int result = parceldao.add(parcel);
	String lastCode = parceldao.lastCode();
	
	if(result>0) {
		response.sendRedirect("admin.jsp");
	} else {
		response.sendRedirect("");
}

%>