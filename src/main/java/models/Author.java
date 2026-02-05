package models;

public class Author {

	private long authorId;
	private String name;
	private String bio;
	
	public Author() {
		
	}
	
	public Author(long authorId, String name) {
		this.authorId=authorId;
		this.name=name;
	}
	public long getAuthId() {
		return authorId;
	}
	public void setAuthId(long authId) {
		this.authorId = authId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	
	
}
