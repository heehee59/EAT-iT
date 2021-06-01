package com.web.client;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;

public class ClientUpdate implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id1 = request.getParameter("id1");
		String pw1 = request.getParameter("pw1");
		String nick1 = request.getParameter("nick1");
		String name1 = request.getParameter("name1");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String tel1 = phone1+"-"+phone2+"-"+phone3;
		
		DAO dao1 = new DAO();
		
		dao1.Client_Update(pw1, nick1, name1, tel1, id1);
		
		response.setContentType("text/html; charset=UTF-8"); 
		PrintWriter writer = response.getWriter(); 
		writer.println("<script>alert('회원수정 되셨습니다..'); location.href='"+"/EAT-iT/main.jsp"+"';</script>"); 
		writer.close();
		
	}

}
