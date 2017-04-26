package com.kaishengit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/login2")
public class LoginServlet2 extends HttpServlet {

	private static final long serialVersionUID = 1L;
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		Map<String,Object> result = new HashMap<>();
		
		if("tom".equals(username) && "123123".equals(password)){
			result.put("status", "success");
		}else{
			result.put("status", "error");
			result.put("message", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
		}
		
		String json = new Gson().toJson(result);
		
		PrintWriter out = resp.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}
}
