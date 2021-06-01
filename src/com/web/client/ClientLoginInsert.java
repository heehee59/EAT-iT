package com.web.client;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;

public class ClientLoginInsert implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id1 = request.getParameter("id1");
		String pw1 = request.getParameter("pw1");
		String nick1 = request.getParameter("nick1");
		String irum1 = request.getParameter("irum1");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String tel1 = phone1+"-"+phone2+"-"+phone3;
		
		try {
			DAO d1 = new DAO();
			boolean sucess = d1.Client_insert(id1, pw1, nick1, irum1, tel1);
			if(sucess) {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter writer = response.getWriter(); 
				writer.println("<script>window.close();</script>"); 
				writer.close();
			}else {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter writer = response.getWriter(); 
				writer.println("<script>alert('회원가입에 실패하셨습니다.'); location.href='"+"/EAT-iT/Client/Client_Insert.jsp"+"';</script>"); 
				writer.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
