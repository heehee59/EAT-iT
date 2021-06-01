package com.web.detail;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.main.WebImpl;

import DB_DAO.DAO;
import DB_VO.ImgVO;
import DB_VO.MapVO;
import DB_VO.MutualVO;
import DB_VO.ReviewVO;

public class DetailAllView implements WebImpl {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
														throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String mutual = request.getParameter("mutual");
		
		DAO dao = new DAO();
		MutualVO vo = dao.Mutual_info(mutual);
		ArrayList<ReviewVO> reviewList = dao.Review_List(mutual);
		request.setAttribute("vo", vo);
		request.setAttribute("reviewList", reviewList);
		
		ImgVO imgVo = dao.Img_Call(mutual);
		request.setAttribute("imgVo", imgVo);
		
		MapVO mapVo = dao.Map_Call(mutual);
		request.setAttribute("mapVo", mapVo);
		

		request.setAttribute("countReview", reviewList.size());
	}

}
