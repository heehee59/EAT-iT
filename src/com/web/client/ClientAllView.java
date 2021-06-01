package com.web.client;

import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.MemberVO;

public class ClientAllView implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		DAO dao1 = new DAO();
		ArrayList<MemberVO> alist1 = dao1.Client_AllView();
		request.setAttribute("alist1", alist1);
		
		RequestDispatcher rd1 = request.getRequestDispatcher("Manager/Client_AllView.jsp");
		rd1.forward(request, response);
	
		
		
	}

}
