package DB_VO;

import java.sql.Date;

public class ReviewVO {

	private String id;
	private String review;
	private Date d;
	private int review_id;

	public ReviewVO(String id, String review, Date d, int review_id) {
		this.id = id;
		this.review = review;
		this.setD(d);
		this.review_id = review_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

}
