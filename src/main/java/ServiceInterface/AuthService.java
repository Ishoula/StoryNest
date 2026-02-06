package ServiceInterface;

import java.sql.SQLException;

import models.User;

public interface AuthService {

	boolean registerUser(String username, String email, String password) throws SQLException;
	User login(String emailOrUsername,String password) throws SQLException;
	
}
