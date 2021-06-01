package com.web.detail;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.MutualVO;

public class DetailServeView implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {


		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ArrayList<MutualVO> alist1 = null;
		
		MutualVO mv = null;
		DAO dao = new DAO();
		String mutual = request.getParameter("mutual");
		String address = request.getParameter("address");
		String kinds = request.getParameter("kinds");
	

		if(address!=null) {
			//가게 주소로 검색 시 그에해당하는 가게정보들 리스트에 s저장
			alist1 =dao.Mutual_allinfo_add(address);
			
		}else if(mutual!=null) {
			//가게를 검색하여 서브페이지를갈때 가게 하나의 사진과 간단설명 뜨게
			mv=dao.Mutual_info(mutual);
		}else{// 종류별 //
			alist1= dao.Mutual_allinfo_kind(kinds);
		}
		
		request.setAttribute("alist1", alist1);
		request.setAttribute("mv", mv);
		
		
		
	}

}
