package com.sunDelivery.web.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/index")
public class IndexController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext ctx = request.getServletContext();
		String path = ctx.getRealPath("/upload");
		
		MultipartRequest req = new MultipartRequest(request
				, path
				, 1024*1024*10
				, "UTF-8"
				, new DefaultFileRenamePolicy());
		
		String weight = req.getParameter("weight");
		String size = req.getParameter("size");
		String location = req.getParameter("location");
		
		System.out.println("weight: "+weight);
		System.out.println("size: "+size);
		System.out.println("location: "+location);
	}

}
