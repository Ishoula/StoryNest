package models;

public class User {

	private long userId;
	private String email;
	private String password_hash;
	private String username;
	
	public User() {
		
	}
	
	public User(long userId, String username, String email) {
		this.userId=userId;
		this.email=email;
		this.username=username;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword_hash() {
		return password_hash;
	}

	public void setPassword_hash(String password_hash) {
		this.password_hash = password_hash;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	
}

