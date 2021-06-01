package DB_VO;

public class MapVO {
	private String geoX;
	private String geoY;

	public MapVO() {
	}

	public MapVO(String geoX, String geoY) {
		this.geoX = geoX;
		this.geoY = geoY;
	}

	public String getGeoX() {
		return geoX;
	}

	public void setGeoX(String geoX) {
		this.geoX = geoX;
	}

	public String getGeoY() {
		return geoY;
	}

	public void setGeoY(String geoY) {
		this.geoY = geoY;
	}
}
