package com.kaishengit.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.collect.Lists;
import com.kaishengit.entity.User;

@WebServlet("/user.xml")
public class UserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//req.getRequestDispatcher("/WEB-INF/views/user.jsp").forward(req,resp);
		
		User user1 = new User(1001,"jack","北京市");
		User user2 = new User(1002,"tom","深圳市");
		User user3 = new User(1003,"rose","上海市");		
		List<User> userList = Arrays.asList(user1,user2,user3);
		
		//设置响应的字符编码
		resp.setCharacterEncoding("UTF-8");
		//设置响应的MIME头
		resp.setContentType("text/xml;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.print("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
		out.print("<users>");
		for(User us : userList){
			out.print("<user id=\""+us.getId()+"\">");
			out.print("<name>"+us.getUsername()+"</name>");
			out.print("<address>"+us.getAddress()+"</address>");
			out.print("</user>");
		}
		out.print("</users>");
		
		out.flush();
		out.close();
	}

}
