package DB_VO;

public class DibsVO {
	
	private String mutual;
	private String img;


	public DibsVO(String mutual, String img) {
		this.mutual = mutual;
		this.img = img;
	}
	
	
	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getMutual() {
		return mutual;
	}
	public void setMutual(String mutual) {
		this.mutual = mutual;
	}
	
	
	
}