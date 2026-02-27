package models;

import jakarta.persistence.*;

@Entity
@Table(name="chapters")
public class Chapter {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "chapter_id")
	private long chapterId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "book_id")
	private Book book;

	@Column(name = "book_id", insertable = false, updatable = false)
	private long bookId;

	@Column(name = "chapter_sequence")
	private int chapterSequence;

	@Column(name = "title")
	private String title;

	@Column(name = "content")
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

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
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
