package models;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Book implements Serializable {
    private static final long serialVersionUID = 1L;

    // Database Fields
    private int bookId;
    private String title;
    private int authorId;
    private String description;
    private String coverImageUrl;
    private String category;
    private LocalDateTime createdAt;

    // UI-Only Field (Populated by the SQL JOIN in your DAO)
    private String authorName;

    // Default Constructor (Required for many Java frameworks)
    public Book() {}

    // Getters and Setters
    public int getBookId() { return bookId; }
    public void setBookId(int bookId) { this.bookId = bookId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public int getAuthorId() { return authorId; }
    public void setAuthorId(int authorId) { this.authorId = authorId; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getCoverImageUrl() { return coverImageUrl; }
    public void setCoverImageUrl(String coverImageUrl) { this.coverImageUrl = coverImageUrl; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }

    public String getAuthorName() { return authorName; }
    public void setAuthorName(String authorName) { this.authorName = authorName; }
}