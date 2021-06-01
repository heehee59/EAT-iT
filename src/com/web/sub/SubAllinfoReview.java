package com.web.sub;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.MutualVO;

public class SubAllinfoReview implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		DAO mudao3 = null;
		mudao3 = new DAO();
		
		ArrayList<MutualVO> alist3 = null;
		
		alist3 = mudao3.Mutual_allinfo_review();
		
		request.setAttribute("alist3", alist3);
	}

}
