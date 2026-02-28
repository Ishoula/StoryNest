package DAOImplementation;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import DAOInterface.LibraryDAO;
import models.Book;
import models.Chapter;
import models.User;
import models.UserLibrary;
import models.UserLibraryId;

public class LibraryHibernateDAOImpl implements LibraryDAO {

    private final SessionFactory sessionFactory;

    public LibraryHibernateDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<UserLibrary> getUserLibrary(long userId) throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            List<UserLibrary> list = session.createQuery(
                    "select ul from UserLibrary ul " +
                    "join fetch ul.book b " +
                    "where ul.user.userId = :userId " +
                    "order by ul.lastReadAt desc",
                    UserLibrary.class
            ).setParameter("userId", userId)
             .getResultList();

            // Populate transient UI fields from associated Book
            for (UserLibrary ul : list) {
                Book book = ul.getBook();
                if (book != null) {
                    ul.setBookTitle(book.getTitle());
                    ul.setBookCover(book.getCoverImageUrl());
                }
            }

            return list;
        } catch (Exception e) {
            throw new SQLException("Failed to load user library", e);
        }
    }

    @Override
    public void updateProgress(long userId, long bookId, int order, double position) throws SQLException {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();

            UserLibraryId id = new UserLibraryId(userId, bookId);
            UserLibrary ul = session.get(UserLibrary.class, id);

            if (ul != null) {
                // We store the 'order' (sequence) so the Resume link works
                ul.setCurrentChapterId((long) order);
                ul.setScrollPosition(position);
                ul.setLastReadAt(new Timestamp(System.currentTimeMillis()));
                session.merge(ul);
            }
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw new SQLException(e);
        }
    }

    @Override
    public void addToLibrary(long userId, long bookId) throws SQLException {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();

            UserLibraryId id = new UserLibraryId(userId, (long)bookId);
            if (session.get(UserLibrary.class, id) != null) return;

            // Fetch the first chapter sequence
            Chapter first = session.createQuery(
                            "from Chapter c where c.book.bookId = :bookId order by c.chapterSequence asc",
                            Chapter.class)
                    .setParameter("bookId", (long) bookId)
                    .setMaxResults(1)
                    .uniqueResult();

            UserLibrary ul = new UserLibrary();
            ul.setId(id);
            ul.setUser(session.get(models.User.class, userId));
            ul.setBook(session.get(models.Book.class, bookId));
            // Store sequence '1' or the first available sequence
            ul.setCurrentChapterId(first != null ? (long) first.getChapterSequence() : 1L);
            ul.setScrollPosition(0.0);
            ul.setLastReadAt(new Timestamp(System.currentTimeMillis()));

            session.persist(ul);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw new SQLException(e);
        }
    }
}
