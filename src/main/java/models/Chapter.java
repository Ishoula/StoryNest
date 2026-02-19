package models;

public class Chapter {

	private long chapterId;
	private long bookId;
	private int chapterSequence;
	private String title;
	private String content;
	private String contentText;
	
	public Chapter() {}
	public long getChapterId() {
		return chapterId;
	}
	public void setChapterId(long chapterId) {
		this.chapterId = chapterId;
	}
	public long getBookId() {
		return bookId;
	}
	public void setBookId(long bookId) {
		this.bookId = bookId;
	}
	public int getChapterSequence() {
		return chapterSequence;
	}
	public void setChapterSequence(int chapterSequence) {
		this.chapterSequence = chapterSequence;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContentText() {
		return contentText;
	}
	public void setContentText(String contentText) {
		this.contentText = contentText;
	}
	
	
}
