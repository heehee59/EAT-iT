package DB_VO;

public class ImgVO {
	private String firstimg;
	private String secondimg;
	private String thirdimg;
	private String fourthimg;
	private String fifthimg;

	public ImgVO(String Firstimg, String Secondimg, String Thirdimg, String Fourthimg, String Fifthimg) {
		this.firstimg = Firstimg;
		this.secondimg = Secondimg;
		this.thirdimg = Thirdimg;
		this.fourthimg = Fourthimg;
		this.fifthimg = Fifthimg;
	}

	public ImgVO(String Firstimg) {
		this.firstimg = Firstimg;
	}

	public String getFirstimg() {
		return firstimg;
	}

	public void setFirstimg(String firstimg) {
		this.firstimg = firstimg;
	}

	public String getSecondimg() {
		return secondimg;
	}

	public void setSecondimg(String secondimg) {
		this.secondimg = secondimg;
	}

	public String getThirdimg() {
		return thirdimg;
	}

	public void setThirdimg(String thirdimg) {
		this.thirdimg = thirdimg;
	}

	public String getFourthimg() {
		return fourthimg;
	}

	public void setFourthimg(String fourthimg) {
		this.fourthimg = fourthimg;
	}

	public String getFifthimg() {
		return fifthimg;
	}

	public void setFifthimg(String fifthimg) {
		this.fifthimg = fifthimg;
	}

}
