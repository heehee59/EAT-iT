package com.web.client;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;

public class ClientDelete implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id1 = request.getParameter("id1");
		
		DAO dao1 = new DAO();
		dao1.Client_Delete(id1);
		
		ServletContext app = request.getServletContext();
		app.removeAttribute("id1");
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter(); 
		writer.println("<script>alert('회원탈퇴 되셨습니다..'); location.href='"+"/EAT-iT/main.jsp"+"';</script>"); 
		writer.close();
		
		
	}

		
	
}
