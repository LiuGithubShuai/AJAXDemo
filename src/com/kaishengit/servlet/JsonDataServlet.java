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

import com.google.gson.Gson;
import com.kaishengit.entity.User;

@WebServlet("/data.json")
public class JsonDataServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json;charset=UTF-8");
		
		User user1 = new User(11,"xiaoliu","USA");
		User user2 = new User(12,"xiaozhao","UK");
		User user3 = new User(13,"xiaowu","JP");
		
		List<User> userList = Arrays.asList(user1,user2,user3);
		String json = new Gson().toJson(userList);
		
		PrintWriter out = resp.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}

}
