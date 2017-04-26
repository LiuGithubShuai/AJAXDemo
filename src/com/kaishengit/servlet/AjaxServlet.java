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
		//����URL�к������ĵ�����
		name = new String(name.getBytes("ISO8859-1"),"UTF-8");
		
		//������ֹ����������MIMEͷ
		resp.setHeader("pragma", "no-cache");
		resp.setHeader("cache-control", "no-cache");
		resp.setHeader("expries", "0");
		
		System.out.println("ajax����>doget: "+name);
		
		PrintWriter out = resp.getWriter();
		out.println("Hello,world!");
		out.flush();
		out.close();
		
		//req.getRequestDispatcher("/WEB-INF/views/show.jsp").forward(req, resp);

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//������ύ����������
		req.setCharacterEncoding("UTF-8");
		
		//������Ӧ��������������
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/plain;charset=UTF-8");
		
		
		String name = req.getParameter("name");
		
		PrintWriter out = resp.getWriter();
		if("tom".equals(name)){
			System.out.println("���˺��ѱ�ע��");
			out.print("������");
		}else{
			System.out.println("����ʹ��");
			out.print("����");
		}
		System.out.println("Hello,Ajax doPost����>"+name);
		out.flush();
		out.close();
	}

}
