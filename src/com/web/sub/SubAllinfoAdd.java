package com.web.sub;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.MutualVO;

public class SubAllinfoAdd implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		DAO mudao1 = null;
		mudao1 = new DAO();

		ArrayList<MutualVO> alist1 = null;

		String address = request.getParameter("address");
		alist1 = mudao1.Mutual_allinfo_add(address);


		request.setAttribute("alist1",alist1);
	}

}