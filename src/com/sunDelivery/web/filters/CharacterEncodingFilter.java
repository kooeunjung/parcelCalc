package com.sunDelivery.web.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.apache.tomcat.util.file.ConfigFileLoader;

@WebFilter("/*")
public class CharacterEncodingFilter implements Filter {
	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("½ÇÇà");
		request.setCharacterEncoding("UTF-8");
		chain.doFilter(request, response);
		
		
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
	}
}

