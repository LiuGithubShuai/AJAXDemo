package com.kaishengit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax1")
public class AjaxServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String name = req.getParameter("name");
		//处理URL中含有中文的问题
		name = new String(name.getBytes("ISO8859-1"),"UTF-8");
		
		//声明禁止浏览器缓存的MIME头
		resp.setHeader("pragma", "no-cache");
		resp.setHeader("cache-control", "no-cache");
		resp.setHeader("expries", "0");
		
		System.out.println("ajax——>doget: "+name);
		
		PrintWriter out = resp.getWriter();
		out.println("Hello,world!");
		out.flush();
		out.close();
		
		//req.getRequestDispatcher("/WEB-INF/views/show.jsp").forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//处理表单提交的中文问题
		req.setCharacterEncoding("UTF-8");
		
		//处理响应的中文乱码问题
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain;charset=UTF-8");
		
		
		String name = req.getParameter("name");
		
		PrintWriter out = resp.getWriter();
		if("tom".equals(name)){
			System.out.println("该账号已被注册");
			out.print("不能用");
		}else{
			System.out.println("可以使用");
			out.print("能用");
		}
		System.out.println("Hello,Ajax doPost——>"+name);
		out.flush();
		out.close();
	}

}
