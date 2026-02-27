package DAOImplementation;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import DAOInterface.ChapterDAO;
import models.Chapter;

public class ChapterHibernateDAOImpl implements ChapterDAO {

    private final SessionFactory sessionFactory;

    public ChapterHibernateDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Chapter> getChaptersByBookId(int bookId) throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                    "from Chapter c where c.book.bookId = :bookId order by c.chapterSequence asc",
                    Chapter.class
            ).setParameter("bookId", (long) bookId)
             .getResultList();
        } catch (Exception e) {
            throw new SQLException("Failed to load chapters by book id", e);
        }
    }

    @Override
    public Chapter getChapter(int bookId, int order) throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                    "from Chapter c where c.book.bookId = :bookId and c.chapterSequence = :seq",
                    Chapter.class
            ).setParameter("bookId", (long) bookId)
             .setParameter("seq", order)
             .uniqueResult();
        } catch (Exception e) {
            throw new SQLException("Failed to load chapter", e);
        }
    }

    public boolean hasChapter(int bookId, int order) throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            Long count = session.createQuery(
                    "select count(c) from Chapter c where c.book.bookId = :bookId and c.chapterSequence = :seq",
                    Long.class
            ).setParameter("bookId", (long) bookId)
             .setParameter("seq", order)
             .uniqueResult();
            return count != null && count > 0;
        } catch (Exception e) {
            throw new SQLException("Failed to check chapter existence", e);
        }
    }
}
