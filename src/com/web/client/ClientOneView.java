package com.web.client;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.MemberVO;

public class ClientOneView implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		 
		ServletContext app = request.getServletContext();
		
		String id1 = (String)app.getAttribute("id1");

		DAO dao1 = new DAO();
		MemberVO vo1 = dao1.Client_OneJoin(id1);
		
		request.setAttribute("vo1", vo1);
		RequestDispatcher rd1 = request.getRequestDispatcher("Client/Client_OneView.jsp");
		rd1.forward(request, response);
		
	}

}
