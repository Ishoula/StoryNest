package models;

import jakarta.persistence.*;

import java.sql.Timestamp;

@Entity
@Table(name="user_library")
public class UserLibrary {

	@EmbeddedId
	private UserLibraryId id;

	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("userId")
	@JoinColumn(name = "user_id")
	private User user;

	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("bookId")
	@JoinColumn(name = "book_id")
	private Book book;

	@Column(name = "current_chapter_id")
	private long currentChapterId;

	@Column(name = "scroll_position")
	private double scrollPosition;

	@Column(name = "status")
	private String status;

	@Column(name = "last_read_at")
	private Timestamp lastReadAt;

	@Transient
	private String BookCover;

	@Transient
	private String BookTitle;
	
	public UserLibrary() {}
	
	
	public UserLibraryId getId() {
		return id;
	}

	public void setId(UserLibraryId id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public long getUserId() {
		return id != null ? id.getUserId() : 0;
	}

	public long getBookId() {
		return id != null ? id.getBookId() : 0;
	}
	public long getCurrentChapterId() {
		return currentChapterId;
	}
	public void setCurrentChapterId(long currentChapterId) {
		this.currentChapterId = currentChapterId;
	}
	public double getScrollPosition() {
		return scrollPosition;
	}
	public void setScrollPosition(double scrollPosition) {
		this.scrollPosition = scrollPosition;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getLastReadAt() {
		return lastReadAt;
	}
	public void setLastReadAt(Timestamp lastReadAt) {
		this.lastReadAt = lastReadAt;
	}


	public String getBookCover() {
		return BookCover;
	}


	public void setBookCover(String bookCover) {
		BookCover = bookCover;
	}


	public String getBookTitle() {
		return BookTitle;
	}


	public void setBookTitle(String bookTitle) {
		BookTitle = bookTitle;
	}
	
	

}
