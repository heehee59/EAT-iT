package DB_DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DB_CONN.CONN;
import DB_VO.DibsVO;
import DB_VO.ImgVO;
import DB_VO.MapVO;
import DB_VO.MemberVO;
import DB_VO.MutualVO;
import DB_VO.ReviewVO;

public class DAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public DAO() throws ClassNotFoundException, SQLException {
		con = new CONN().getConnection();
	}

	public void pstmtClose() throws SQLException {
		if (pstmt != null) {
			pstmt.close();
		}
	}

	public void getAllInfoClose() throws SQLException {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (con != null) {
			con.close();
		}
	}

	// 로그인확인
	public boolean Client_Login(String id1, String pw1) throws SQLException {
		String sql = "SELECT * FROM EAT_IT_MEMBER WHERE ID=? AND PW=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id1);
		pstmt.setString(2, pw1);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return true;
		} else {
			return false;
		}
	}

	// 회원가입
	public boolean Client_insert(String id1, String pw1, String nick1, String name1, String tel1) {
		String sql = "INSERT INTO EAT_IT_MEMBER (ID,PW,NICK,NAME,PHONENUMBER) VALUES(?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id1);
			pstmt.setString(2, pw1);
			pstmt.setString(3, nick1);
			pstmt.setString(4, name1);
			pstmt.setString(5, tel1);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}

	// ID중복확인
	public int Client_IdCheck(String id1) throws SQLException {
		String sql = "SELECT ID FROM EAT_IT_MEMBER WHERE ID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id1);
			rs = pstmt.executeQuery();
			if (rs.next() || id1.equals("")) {
				return 0;// 사용불가
			} else {
				return 1;// 사용가능
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	// 전체검색할때 사용
	public ArrayList<MemberVO> Client_AllView() throws SQLException {
		ArrayList<MemberVO> MemberArray = new ArrayList<MemberVO>();
		String sql = "SELECT * FROM EAT_IT_MEMBER WHERE ADMIN!='1' ORDER BY id";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String nick = rs.getString(3);
			String name = rs.getString(4);
			String tel = rs.getString(5);
			String[] telarr = tel.split("-");
			String phone2 = telarr[1];
			String phone3 = telarr[2];
			Date d = rs.getDate(6);
			MemberVO vo1 = new MemberVO(id, pw, nick, name, phone2, phone3, d);
			MemberArray.add(vo1);
		}
		return MemberArray;
	}

	// 한명조회
	public MemberVO Client_OneJoin(String id1) throws SQLException {
		MemberVO vo1 = null;
		String sql = "SELECT * FROM EAT_IT_MEMBER WHERE ID=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id1);
		rs = pstmt.executeQuery();//
		if (rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String nick = rs.getString(3);
			String name = rs.getString(4);
			String tel = rs.getString(5);
			String[] telarr = tel.split("-");
			String phone2 = telarr[1];
			String phone3 = telarr[2];
			Date d = rs.getDate(6);
			vo1 = new MemberVO(id, pw, nick, name, phone2, phone3, d);
		} else {
			vo1 = null;
		}
		return vo1;
	}

	// 아이디찾기
	public MemberVO Client_OneJoinId(String name, String tel1) throws SQLException {
		MemberVO vo1 = null;
		String sql = "SELECT ID,NAME FROM EAT_IT_MEMBER WHERE NAME=? AND PHONENUMBER=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel1);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String id = rs.getString(1);
			String name1 = rs.getString(2);
			vo1 = new MemberVO(id, name1);
		} else {
			vo1 = null;
		}
		return vo1;
	}

	// 비밀번호찾기
	public MemberVO Client_OneJoinPw(String id1, String irum1, String tel1) throws SQLException {
		MemberVO vo1 = null;
		String sql = "SELECT * FROM EAT_IT_MEMBER WHERE ID=? AND NAME=? AND PHONENUMBER=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id1);
		pstmt.setString(2, irum1);
		pstmt.setString(3, tel1);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String nick = rs.getString(3);
			String name = rs.getString(4);
			String phone = rs.getString(5);
			String pw2 = "imsipw12!@";
			Client_Update(pw2, nick, name, phone, id);
			vo1 = new MemberVO(id, pw2, name);
		} else {
			vo1 = null;
		}
		return vo1;
	}

	// 회원업데이트
	public boolean Client_Update(String pw, String nick, String name, String tel, String id) {
		String sql = "UPDATE EAT_IT_MEMBER SET PW=?, NICK=?, NAME=?, PHONENUMBER=? WHERE ID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, nick);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update Exception");
			return false;
		}
		return true;
	}

	// 회원삭제
	public boolean Client_Delete(String id1) {
		ReviewAll_Delete(id1);
		String sql = "DELETE FROM EAT_IT_MEMBER WHERE ID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id1);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}

	// 찜목록에 넣기
	public boolean Client_DibsListInsert(String id1, String mutual1) {
		String sql = "INSERT INTO EAT_IT_LIKE VALUES(?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id1);
			pstmt.setString(2, mutual1);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}

	// 찜목록에 이미 있는지 확인
	public boolean Client_OverlapCheck(String id1, String mutual1) {	
		String sql = "SELECT * FROM EAT_IT_LIKE WHERE ID=? AND MUTUAL=?";
		boolean check = false;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id1);
			pstmt.setString(2, mutual1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = true;
			} else {
				check = false;
			}
		} catch (Exception e) {
			System.out.println("Join Error");
		}
		return check;
	}

	// 찜목록에 있는걸 보기
	public ArrayList<DibsVO> Client_DibsListJoin(String id1) throws SQLException {
		ArrayList<DibsVO> array = new ArrayList<DibsVO>();
		String sql = "SELECT DISTINCT L.MUTUAL, M.FIRSTIMG FROM EAT_IT_LIKE L, EAT_IT_MUTUALIMG M WHERE ID=? AND L.MUTUAL = M.MUTUAL ORDER BY L.MUTUAL";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id1);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String mutual = rs.getString(1);
			String img = rs.getString(2);
			DibsVO vo1 = new DibsVO(mutual, img);
			array.add(vo1);
		}
		return array;
	}

	//찜목록에 있는거 삭제
		public void Client_DibsListDelete(String id1, String mutual1) {
			String sql = "DELETE FROM EAT_IT_LIKE WHERE ID=? AND MUTUAL=?";
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id1);
				pstmt.setString(2, mutual1);
				pstmt.executeUpdate();
				System.out.println("삭제됨");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 1개의 가게정보 불러오기
	public MutualVO Mutual_info(String Mutual1) throws SQLException {
		MutualVO Mutualinfo = null;
		String sql = "SELECT * FROM EAT_IT_MUTUALLIST WHERE MUTUAL=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Mutual1);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String Mutual = rs.getString(1);
			String Dial = rs.getString(2);
			String Address = rs.getString(3);
			String Kinds = rs.getString(4);
			String Introduce = rs.getString(5);

			Mutualinfo = new MutualVO(Mutual, Dial, Address, Kinds, Introduce);
		} else {
			Mutualinfo = null;
		}
		return Mutualinfo;
	}

	// 주소별로 다수의 서브페이지 호출
	public ArrayList<MutualVO> Mutual_allinfo_add(String address) throws SQLException {
		ArrayList<MutualVO> addArray = new ArrayList<MutualVO>();
		String sql = "SELECT * FROM EAT_IT_MUTUALLIST L, EAT_IT_MUTUALIMG I WHERE ADDRESS LIKE '%" + address
				+ "%' AND L.MUTUAL = I.MUTUAL";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String Mutual = rs.getString(1);
			String Dial = rs.getString(2);
			String Address = rs.getString(3);
			String Kinds = rs.getString(4);
			String Introduce = rs.getString(5);
			String Firstimg = rs.getString(7);

			MutualVO vo1 = new MutualVO(Mutual, Dial, Address, Kinds, Introduce, Firstimg);
			addArray.add(vo1);
		}
		return addArray;
	}

	// 검색에 따라 서브페이지 호출
	public ArrayList<MutualVO> Mutual_allinfo_search(String str) throws SQLException {
		ArrayList<MutualVO> addArray = new ArrayList<MutualVO>();
		String sql = "SELECT * FROM EAT_IT_MUTUALLIST L, EAT_IT_MUTUALIMG I " + "WHERE (L.ADDRESS LIKE '%" + str + "%' "
				+ "OR L.MUTUAL LIKE '%" + str + "%' " + "OR L.KINDS LIKE '%" + str + "%') AND L.MUTUAL = I.MUTUAL";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String Mutual = rs.getString(1);
			String Dial = rs.getString(2);
			String Address = rs.getString(3);
			String Kinds = rs.getString(4);
			String Introduce = rs.getString(5);
			String Firstimg = rs.getString(7);

			MutualVO vo1 = new MutualVO(Mutual, Dial, Address, Kinds, Introduce, Firstimg);
			addArray.add(vo1);
		}
		return addArray;
	}

	// 종류별 서브페이지 호출
	public ArrayList<MutualVO> Mutual_allinfo_kind(String kind) throws SQLException {
		ArrayList<MutualVO> kindArray = new ArrayList<MutualVO>();
		String sql = "SELECT * FROM EAT_IT_MUTUALLIST L, EAT_IT_MUTUALIMG I WHERE KINDS = ? AND L.MUTUAL=I.MUTUAL";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, kind);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String Mutual = rs.getString(1);
			String Dial = rs.getString(2);
			String Address = rs.getString(3);
			String Kinds = rs.getString(4);
			String Introduce = rs.getString(5);
			String Firstimg = rs.getString(7);

			MutualVO vo1 = new MutualVO(Mutual, Dial, Address, Kinds, Introduce, Firstimg);
			kindArray.add(vo1);
		}
		return kindArray;
	}

	// 리뷰 수별 서브페이지 호출
	public ArrayList<MutualVO> Mutual_allinfo_review() throws SQLException {
		ArrayList<MutualVO> reviewArray = new ArrayList<MutualVO>();
		String sql = "SELECT MUTUAL,DIAL,ADDRESS,KINDS,INTRODUCE,"
				+ "(SELECT COUNT(*) FROM EAT_IT_REVIEW R WHERE L.MUTUAL= R.MUTUAL) C,"
				+ "(SELECT FIRSTIMG FROM EAT_IT_MUTUALIMG I WHERE I.MUTUAL = L.MUTUAL) I "
				+ "FROM EAT_IT_MUTUALLIST L "
				+ "WHERE (SELECT COUNT(*) FROM EAT_IT_REVIEW R WHERE L.MUTUAL= R.MUTUAL) != 0 "
				+ "ORDER BY C DESC";

		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String Mutual = rs.getString(1);
			String Dial = rs.getString(2);
			String Address = rs.getString(3);
			String Kinds = rs.getString(4);
			String Introduce = rs.getString(5);
			int Count = rs.getInt(6);
			String Firstimg = rs.getString(7);

			MutualVO vo1 = new MutualVO(Mutual, Dial, Address, Kinds, Introduce, Count, Firstimg);
			reviewArray.add(vo1);
		}
		return reviewArray;
	}

	// 리뷰 등록
	public boolean Review_Insert(String Mutual, String Id, String Review) {
		String sql = "INSERT INTO EAT_IT_REVIEW R(MUTUAL,ID,REVIEW,REVIEW_ID) VALUES(?,?,?,(SELECT NVL(MAX(review_id), 0)+1 FROM EAT_IT_REVIEW))";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Mutual);
			pstmt.setString(2, Id);
			pstmt.setString(3, Review);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}
	// 리뷰 강제 삭제
	public boolean ReviewAll_Delete(String id) {
		String sql = "DELETE FROM EAT_IT_REVIEW WHERE ID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	// 리뷰 삭제
	public boolean Review_Delete(String Mutual, int review_id) {
		String sql = "DELETE FROM EAT_IT_REVIEW WHERE MUTUAL=? AND REVIEW_ID=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, Mutual);
			pstmt.setInt(2, review_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}

	// 리뷰 불러오기
	public ArrayList<ReviewVO> Review_List(String Mutual) throws SQLException {
		ArrayList<ReviewVO> reviewList = new ArrayList<ReviewVO>();
		String sql = "SELECT * FROM EAT_IT_REVIEW R WHERE MUTUAL = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Mutual);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String id = rs.getString(2);
			String review = rs.getString(3);
			int review_id = rs.getInt(4);
			Date d = rs.getDate(5);
			ReviewVO vo = new ReviewVO(id, review, d, review_id);
			reviewList.add(vo);
		}
		return reviewList;
	}

	// 이미지 소스 불러오기(결과페이지에서 전부사용)
	public ImgVO Img_Call(String Mutual) throws SQLException {
		ImgVO imgvo = null;
		String sql = "SELECT * FROM EAT_IT_MUTUALIMG WHERE MUTUAL = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Mutual);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String Firstimg = rs.getString(2);
			String Secondimg = rs.getString(3);
			String Thirdimg = rs.getString(4);
			String Fourthimg = rs.getString(5);
			String Fifthimg = rs.getString(6);
			imgvo = new ImgVO(Firstimg, Secondimg, Thirdimg, Fourthimg, Fifthimg);
		} else {
			imgvo = null;
		}
		return imgvo;
	}

	// 상호별 좌표 불러오기(결과페이지에서만 사용)
	public MapVO Map_Call(String Mutual) throws SQLException {
		MapVO mapvo = null;
		String sql = "SELECT * FROM EAT_IT_MAP WHERE MUTUAL = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, Mutual);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String GeoX = rs.getString(2);
			String GeoY = rs.getString(3);
			mapvo = new MapVO(GeoX, GeoY);
		} else {
			mapvo = null;
		}
		return mapvo;
	}
}
