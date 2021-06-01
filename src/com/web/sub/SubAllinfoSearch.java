package com.web.sub;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.MutualVO;

public class SubAllinfoSearch implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		DAO mudao3 = null;
		mudao3 = new DAO();
		
		ArrayList<MutualVO> alist3 = null;
		String str = request.getParameter("search");
		alist3 = mudao3.Mutual_allinfo_search(str);
		
		request.setAttribute("alist3", alist3);
	}

}
