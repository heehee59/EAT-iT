package com.web.detail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;

public class ReviewDelete implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String mutual = request.getParameter("mutual");
		int review_id = Integer.parseInt(request.getParameter("review_id"));
		
		System.out.println("=======================================");
		System.out.println(mutual);
		System.out.println(review_id);
		
		DAO dao = new DAO();
		boolean reviewDel = dao.Review_Delete(mutual, review_id);
		request.setAttribute("mutual", mutual);
	}

}
