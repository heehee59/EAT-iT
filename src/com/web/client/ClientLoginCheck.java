package com.web.client;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;

public class ClientLoginCheck implements WebImpl {

	
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id1 = request.getParameter("id1");
		String pw1 = request.getParameter("pw1");
		DAO dao1 = new DAO();
		boolean vo1 = dao1.Client_Login(id1,pw1);
		if(vo1) {
			//id값 application화 하기 
			ServletContext app = request.getServletContext();
			app.setAttribute("id1", id1);
			String check="true";
			String go = "out.print(\"<script>$(document).ready(function() {opener.parent.location.reload(); window.close();})</script>\");";
			request.setAttribute("check", check);
			request.setAttribute("go",go);
			RequestDispatcher rd1 = request.getRequestDispatcher("/Client/Client_Login.jsp");
			rd1.forward(request, response);
		}else {
			String check="false";
			request.setAttribute("check", check);
			RequestDispatcher rd1 = request.getRequestDispatcher("/Client/Client_Login.jsp");
			rd1.forward(request, response);
		}		
		
	}

}
