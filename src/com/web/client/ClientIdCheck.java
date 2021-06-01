package com.web.client;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;

public class ClientIdCheck implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userID");
		System.out.println(userID);
		int check = new DAO().Client_IdCheck(userID);
		System.out.println(check);
		response.getWriter().write(new DAO().Client_IdCheck(userID)+"");
		
	}

}
