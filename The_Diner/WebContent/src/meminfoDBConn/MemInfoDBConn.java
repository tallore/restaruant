package meminfoDBConn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//DB?�� ?��?�� ?���? ?���? 만들?�� ?���? ?��?��?�� ?��마다 불러?��?��

public class MemInfoDBConn {
	
	private Connection con;	//?��?��객체 con ?��?��
	
	//getConnection() 메소?��	: 반환???��?? Connection
	public Connection getConnection() {
		return con;	//?��?��객체 return
	}
	
	//?��?��?��
	public MemInfoDBConn() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver"); // ?��?��?���? 메모리로?�� ?��?��
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
	}
}
