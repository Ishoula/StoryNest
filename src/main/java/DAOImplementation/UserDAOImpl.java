package DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

import DAOInterface.UserDAO;
import models.User;

public class UserDAOImpl implements UserDAO {
    
    private final Connection con;

    // Constructor to receive the connection from the Servlet/Service
    public UserDAOImpl(Connection con) {
        this.con = con;
    }

    @Override
    public boolean createUser(User user) throws SQLException {
        // Fixed: Added VALUES clause and corrected parameter order
        String stmt = "INSERT INTO users (username, email, password_hash) VALUES (?, ?, ?)";
        
        try (PreparedStatement ps = con.prepareStatement(stmt)) {
            ps.setString(1, user.getUsername());    // Matches first ? (username)
            ps.setString(2, user.getEmail());       // Matches second ? (email)
            ps.setString(3, user.getPasswordHash()); // Matches third ? (password_hash)
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Optional<User> findByEmail(String email) throws SQLException {
        String stmt = "SELECT * FROM users WHERE email = ?";
        
        try (PreparedStatement ps = con.prepareStatement(stmt)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToUser(rs));
                }
            }
        }
        return Optional.empty();
    }

    @Override
    public Optional<User> findByUsername(String username) throws SQLException {
        String stmt = "SELECT * FROM users WHERE username = ?";
        
        try (PreparedStatement ps = con.prepareStatement(stmt)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapResultSetToUser(rs));
                }
            }
        }
        return Optional.empty();
    }

    @Override
    public User findById(long userId) throws SQLException {
        String stmt = "SELECT * FROM users WHERE user_id = ?";
        
        try (PreparedStatement ps = con.prepareStatement(stmt)) {
            ps.setLong(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUser(rs);
                }
            }
        }
        return null;
    }

    /**
     * Helper method to map a ResultSet row to a User object.
     * Keeps the code DRY (Don't Repeat Yourself).
     */
    private User mapResultSetToUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUserId(rs.getLong("user_id"));
        user.setUsername(rs.getString("username"));
        user.setEmail(rs.getString("email"));
        user.setPasswordHash(rs.getString("password_hash")); 
        // Note: Check your User model has getCreatedAt/setCreatedAt if you want that too
        return user;
    }
}