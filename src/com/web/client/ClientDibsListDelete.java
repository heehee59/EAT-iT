package com.web.client;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.DibsVO;

public class ClientDibsListDelete implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		ServletContext app = request.getServletContext();
		String id1 = (String)app.getAttribute("id1");
		String mutual1 = request.getParameter("mutual1");
		
		DAO dao1 = new DAO();
		dao1.Client_DibsListDelete(id1, mutual1);
		
		
		ArrayList<DibsVO> alist1 = dao1.Client_DibsListJoin(id1);
		request.setAttribute("alist1", alist1);
		
		
		RequestDispatcher rd1 = request.getRequestDispatcher("Client/ClientDibsListView.jsp");
		rd1.forward(request, response);
		
	}

}
