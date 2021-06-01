package DB_CONN;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class CONN {
	private Connection con;

	public Connection getConnection() {
		return con;
	}

	public CONN() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
	}
}
