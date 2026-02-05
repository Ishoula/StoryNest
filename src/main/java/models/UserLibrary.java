package models;

import java.sql.Timestamp;

public class UserLibrary {
	
	private long bookId;
	private long userId;
	private long libraryId;
	private long currentChapterId;
	private double scrollPosition;
	private String status;
	private Timestamp lastReadAt;
	
	public UserLibrary() {}
	
	
	public long getBookId() {
		return bookId;
	}
	public void setBookId(long bookId) {
		this.bookId = bookId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getLibraryId() {
		return libraryId;
	}
	public void setLibraryId(long libraryId) {
		this.libraryId = libraryId;
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
	
	

}
