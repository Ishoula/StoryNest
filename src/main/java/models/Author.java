package models;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="authors")
public class Author {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "author_id")
	private long authorId;

	@OneToMany(mappedBy = "author")
	private List<Book> books = new ArrayList<>();
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

	public long getAuthorId() {
		return authorId;
	}

	public void setAuthorId(long authorId) {
		this.authorId = authorId;
	}

	public List<Book> getBooks() {
		return books;
	}

	public void setBooks(List<Book> books) {
		this.books = books;
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
