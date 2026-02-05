package models;
import java.util.List;
import java.sql.Date;
public class Book {
	
	private long bookIid;
	private String title;
	private String description;
	private String coverImageUrl;
	private int pageCount;
	private Date publishedDate;
	
	
	public long getBookIid() {
		return bookIid;
	}
	public void setBookIid(long bookIid) {
		this.bookIid = bookIid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCoverImageUrl() {
		return coverImageUrl;
	}
	public void setCoverImageUrl(String coverImageUrl) {
		this.coverImageUrl = coverImageUrl;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public Date getPublishedDate() {
		return publishedDate;
	}
	public void setPublishedDate(Date publishedDate) {
		this.publishedDate = publishedDate;
	}
	
	
	
}
