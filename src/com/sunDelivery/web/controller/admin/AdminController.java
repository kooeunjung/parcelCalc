package com.sunDelivery.web.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sunDelivery.web.dao.ParcelDao;
import com.sunDelivery.web.dao.mysql.MySQLParcelDao;
import com.sunDelivery.web.entity.Parcel;

@WebServlet("/admin")
public class AdminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String _page = request.getParameter("p");
		String _query = request.getParameter("q");
		
		int pg = 1;
		String query = "";
		
		if (_page != null && !_page.equals("")) 
			pg = Integer.parseInt(_page);
		
		if (_query != null && !_query.equals("")) 
			query=_query;
		
		
		ParcelDao parceldao = new MySQLParcelDao();
		List<Parcel> list = parceldao.getList(pg,query);
		int size = parceldao.getSize(query);
		
		request.setAttribute("pg", pg);
		request.setAttribute("query", query);
		request.setAttribute("list", list);
		request.setAttribute("size", size);
		
		request.getRequestDispatcher("searchlists/admin.jsp").forward(request, response);

	}
}
