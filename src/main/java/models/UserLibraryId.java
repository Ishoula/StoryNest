package models;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

import java.io.Serializable;
import java.util.Objects;

@Embeddable
public class UserLibraryId implements Serializable {

    @Column(name = "user_id")
    private long userId;

    @Column(name = "book_id")
    private long bookId;

    public UserLibraryId() {}

    public UserLibraryId(long userId, long bookId) {
        this.userId = userId;
        this.bookId = bookId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getBookId() {
        return bookId;
    }

    public void setBookId(long bookId) {
        this.bookId = bookId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserLibraryId that = (UserLibraryId) o;
        return userId == that.userId && bookId == that.bookId;
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, bookId);
    }
}
