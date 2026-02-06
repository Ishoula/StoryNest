package DAOInterface;

import java.sql.SQLException;
import java.util.Optional;

import models.User;

public interface UserDAO {

	boolean createUser(User user) throws SQLException;
	Optional<User> findByEmail(String email) throws SQLException;
	Optional<User> findByUsername(String username) throws SQLException;
	User findById(long userId) throws SQLException;
}
