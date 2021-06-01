package com.web.main;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.client.ClientAllView;
import com.web.client.ClientDelete;
import com.web.client.ClientDeleteManager;
import com.web.client.ClientDibsListDelete;
import com.web.client.ClientDibsListView;
import com.web.client.ClientFindId;
import com.web.client.ClientFindPw;
import com.web.client.ClientIdCheck;
import com.web.client.ClientLoginCheck;
import com.web.client.ClientLoginInsert;
import com.web.client.ClientOneView;
import com.web.client.ClientUpdate;
import com.web.detail.DetailAllView;
import com.web.detail.DetailServeView2;
import com.web.detail.ReviewDelete;
import com.web.detail.ReviewRegister;
import com.web.sub.SubAllinfoAdd;
import com.web.sub.SubAllinfoKind;
import com.web.sub.SubAllinfoReview;
import com.web.sub.SubAllinfoSearch;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FrontController() {
		super();
	}

	// get이건 post건 여기로 와서 처리
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 경로가 어떻게 되는지 확인 개 햇갈림
		String url = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(url);
		WebImpl w = null; // request, response사용을 위해
		ServletContext app = null; // application화 하기위해서 선언
		RequestDispatcher rd1 = null;
		switch (url) {

		// 로그인체크
		case "/Client/LoginCheck.do":
			w = new ClientLoginCheck();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 로그아웃
		case "/Client/LogOut.do":
		case "/LogOut.do":
			app = request.getServletContext();
			app.removeAttribute("id1");
			response.sendRedirect("/EAT-iT/main.jsp");
			break;

		// 회원가입
		case "/Client/ClientInsert.do":
			w = new ClientLoginInsert();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
			
		// ID 중복체크
		case "/Client/IdCheck.do":
			w = new ClientIdCheck();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 회원id찾기
		case "/Client/ClientFindId.do":
			w = new ClientFindId();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 회원pw찾기
		case "/Client/ClientFindPw.do":
			w = new ClientFindPw();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 회원정보보기
		case "/Client/ClientOneView.do":
		case "/ClientOneView.do":
			w = new ClientOneView();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 회원정보삭제
		case "/ClientDelete.do":
			w = new ClientDelete();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 회원정보 업데이트
		case "/ClientUpdate.do":
			w = new ClientUpdate();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 회원 전체보기(관리자용)
		case "/ClientAllView.do":
			w = new ClientAllView();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 회원 삭제하기(관리자용)
		case "/ClientDeleteManager.do":
			w = new ClientDeleteManager();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 찜목록 보기
		case "/Client/ClientDibsListView.do":
		case "/ClientDibsListView.do":
			w = new ClientDibsListView();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 찜목록 삭제
		case "/ClientDibsListDelete.do":
			w = new ClientDibsListDelete();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		// 지역별 페이지
		case "/Mutual_allinfo_add.do":
			w = new SubAllinfoAdd();

			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			rd1 = request.getRequestDispatcher("subpage/locationsub.jsp");
			rd1.forward(request, response);

			break;
		
		// 종류별 페이지
		case "/Mutual_allinfo_kind.do":
			w = new SubAllinfoKind();

			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd1 = request.getRequestDispatcher("subpage/kindssub.jsp");
			rd1.forward(request, response);

			break;
		
		// 리뷰별 페이지
		case "/Mutual_allinfo_review.do":
			w = new SubAllinfoReview();

			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd1 = request.getRequestDispatcher("subpage/reviewsub.jsp");
			rd1.forward(request, response);
			break;
			
		// 검색결과 페이지
		case "/Mutual_allinfo_search.do":
			w = new SubAllinfoSearch();

			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd1 = request.getRequestDispatcher("subpage/Overallsub.jsp");
			rd1.forward(request, response);
			break;
		
		// 상세 페이지
		case "/detail.do":
			w = new DetailAllView();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd1 = request.getRequestDispatcher("detail.jsp");
			rd1.forward(request, response);
			break;
		
		// 리뷰 등록
		case "/reviewRegister.do":
			w = new ReviewRegister();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			String mutual = URLEncoder.encode((String) request.getAttribute("mutual"), "UTF-8");
			response.sendRedirect("detail.do?mutual=" + mutual);
			break;
		
		// 리뷰 삭제
		case "/reviewDelete.do":
			w = new ReviewDelete();
			try {
				w.execute(request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			String mutual2 = URLEncoder.encode((String) request.getAttribute("mutual"), "UTF-8");
			response.sendRedirect("./detail.do?mutual=" + mutual2);
			break;

		case "/Overallserve.do":
			w = new DetailServeView2();
			try {
				w.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			rd1 = request.getRequestDispatcher("subpage/Overallsub.jsp");
			rd1.forward(request, response);
			break;

		default:
			response.sendRedirect("ErrorPage.jsp");
			break;

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
