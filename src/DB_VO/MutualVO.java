package DB_VO;

//찜목록을 위한 VO (회원아이디별 찜목록 DB위한 setter/getter)
public class MutualVO {
	private String mutual;
	private String dial;
	private String address;
	private String kinds;
	private String introduce;
	private int count;
	private String firstimg;

	public MutualVO() {
	}

	//  리뷰수별 정보 호출 VO
	public MutualVO(String mutual2, String dial2, String address2, String kinds2, String introduce2, int count2,
			String firstimg2) {
		this.mutual = mutual2;
		this.dial = dial2;
		this.address = address2;
		this.kinds = kinds2;
		this.introduce = introduce2;
		this.count = count2;
		this.firstimg = firstimg2;
	}
	
	// 종류별, 주소별 정보 호출  VO
	public MutualVO(String mutual2, String dial2, String address2, String kinds2, String introduce2, String firstimg2) {
		this.mutual = mutual2;
		this.dial = dial2;
		this.address = address2;
		this.kinds = kinds2;
		this.introduce = introduce2;
		this.firstimg = firstimg2;
	}

	// 1개의 업체정보 호출 VO(결과)
	public MutualVO(String mutual2, String dial2, String address2, String kinds2, String introduce2) {
		this.mutual = mutual2;
		this.dial = dial2;
		this.address = address2;
		this.kinds = kinds2;
		this.introduce = introduce2;
	}

	public String getMutual() {
		return mutual;
	}

	public void setMutual(String mutual) {
		this.mutual = mutual;
	}

	public String getDial() {
		return dial;
	}

	public void setDial(String dial) {
		this.dial = dial;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getKinds() {
		return kinds;
	}

	public void setKinds(String kinds) {
		this.kinds = kinds;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getFirstimg() {
		return firstimg;
	}

	public void setFirstimg(String firstimg) {
		this.firstimg = firstimg;
	}
}
