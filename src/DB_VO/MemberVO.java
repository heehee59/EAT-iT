package DB_VO;

import java.sql.Date;

public class MemberVO {
	private String id;
	private String pw;
	private String nick;
	private String name;
	private String tel;
	private String phone2;
	private String phone3;
	private Date d;

	public MemberVO() {

	}

	// 관리자의 회원 정보 1인 or 전체 조회
	public MemberVO(String id, String pw, String nick, String name, String phone2, String phone3, Date d) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.name = name;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.d = d;
	}

	// ID&비밀번호 찾기용 VO
	public MemberVO(String id1, String pw1, String name1) {
		this.id = id1;
		this.pw = pw1;
		this.name = name1;
	}

	public MemberVO(String id2, String name2) {
		this.id = id2;
		this.name = name2;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}
}
