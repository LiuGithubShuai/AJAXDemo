package com.kaishengit.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kaishengit.util.HttpClientUtil;

@WebServlet("/dict")
public class DictServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String query = req.getParameter("query");
		
		//URL中的keyfrom和key是在有道中申请的
		String url = "http://fanyi.youdao.com/openapi.do?keyfrom=kaishengit&key=1587754017&type=data&doctype=xml&version=1.1&q="+query;
				
		String result = HttpClientUtil.sendGetRequestWithString(url);
		
		//设置响应头
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/xml;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
}
