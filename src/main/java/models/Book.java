package models;

import jakarta.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="books")
public class Book implements Serializable {

    // Database Fields
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    private int bookId;

    @Column(name = "title")
    private String title;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "author_id")
    private Author author;

    @Column(name = "author_id", insertable = false, updatable = false)
    private int authorId;

    @Column(name = "description")
    private String description;

    @Column(name = "cover_image_url")
    private String coverImageUrl;

    @Column(name = "category")
    private String category;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @OneToMany(mappedBy = "book")
    private List<Chapter> chapters = new ArrayList<>();

    // UI-Only Field (Populated by the SQL JOIN in your DAO)
    @Transient
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

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public List<Chapter> getChapters() {
        return chapters;
    }

    public void setChapters(List<Chapter> chapters) {
        this.chapters = chapters;
    }

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