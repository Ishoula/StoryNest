package DAOImplementation;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import DAOInterface.BookDAO;
import models.Book;

public class BookHibernateDAOImpl implements BookDAO {

    private final SessionFactory sessionFactory;

    public BookHibernateDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Book> getAllBooks() throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                    "select distinct b from Book b " +
                    "left join fetch b.author",
                    Book.class
            ).getResultList();
        } catch (Exception e) {
            throw new SQLException("Failed to load all books", e);
        }
    }

    @Override
    public Optional<Book> getBookById(long bookId) throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            Book book = session.createQuery(
                    "select b from Book b " +
                    "left join fetch b.author " +
                    "where b.bookId = :id",
                    Book.class
            ).setParameter("id", (int) bookId)
             .uniqueResult();
            return Optional.ofNullable(book);
        } catch (Exception e) {
            throw new SQLException("Failed to load book by id", e);
        }
    }

    @Override
    public List<Book> getBooksByCategory(String category) throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery(
                    "select distinct b from Book b " +
                    "left join fetch b.author " +
                    "where b.category = :cat",
                    Book.class
            ).setParameter("cat", category)
             .getResultList();
        } catch (Exception e) {
            throw new SQLException("Failed to load books by category", e);
        }
    }

    @Override
    public boolean createBook(Book book) throws SQLException {
        Transaction tx = null;
        try (Session session = sessionFactory.openSession()) {
            tx = session.beginTransaction();
            session.persist(book);
            tx.commit();
            return true;
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            throw new SQLException("Failed to create book", e);
        }
    }

    @Override
    public List<Book> searchBooks(String query, String category) throws SQLException {
        try (Session session = sessionFactory.openSession()) {
            StringBuilder hql = new StringBuilder(
                    "select distinct b from Book b " +
                    "left join fetch b.author " +
                    "where 1=1 "
            );

            if (query != null && !query.isEmpty()) {
                hql.append("and (lower(b.title) like :q or lower(b.author.name) like :q) ");
            }
            if (category != null && !category.isEmpty()) {
                hql.append("and b.category = :cat ");
            }

            var q = session.createQuery(hql.toString(), Book.class);

            if (query != null && !query.isEmpty()) {
                String pattern = "%" + query.toLowerCase() + "%";
                q.setParameter("q", pattern);
            }
            if (category != null && !category.isEmpty()) {
                q.setParameter("cat", category);
            }

            return q.getResultList();
        } catch (Exception e) {
            throw new SQLException("Failed to search books", e);
        }
    }
}
