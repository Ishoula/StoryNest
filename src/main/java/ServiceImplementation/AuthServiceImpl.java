package ServiceImplementation;
import java.sql.SQLException;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import DAOInterface.UserDAO;
import ServiceInterface.AuthService;
import models.User;

public class AuthServiceImpl implements AuthService {

	private UserDAO userDAO;
	
	public AuthServiceImpl(UserDAO userDAO) {
		this.userDAO=userDAO;
	}

	@Override
	public boolean registerUser(String username, String email, String password) throws SQLException {
		
		String passwordHash=BCrypt.hashpw(password, BCrypt.gensalt());
		
		User user=new User();
		user.setEmail(email);
		user.setPasswordHash(passwordHash);
		user.setUsername(username);
		
		
		return userDAO.createUser(user);
	}

	@Override
	public User login(String identity, String password) throws SQLException {
		
		Optional<User> userOpt=userDAO.findByEmail(identity);
		if(userOpt.isEmpty()) {
			userOpt=userDAO.findByUsername(identity);
		}
		if(userOpt.isPresent()) {
			User user=userOpt.get();
			
			if(BCrypt.checkpw(password, user.getPasswordHash())) {
				return user;
			}
		}
		
		return null;
	}
}