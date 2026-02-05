package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {
	private static final String DB_URL = "jdbc:postgresql://localhost:5432/storynest";
    private static final String USERNAME = "postgres"; 
    private static final String PASSWORD = "admin";
    
    public static Connection getConnection() throws SQLException{
        try{
            return DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
        }catch (SQLException e) {
            throw new SQLException("Database connection failed.", e);
        }
    }
}
