package DAOImplementation;

import java.sql.SQLException;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import DAOInterface.UserDAO;
import models.User;

public class UserHibernateDAOImpl implements UserDAO {

	private final SessionFactory sessionFactory;

	public UserHibernateDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public boolean createUser(User user) throws SQLException {
		Transaction tx = null;
		try (Session session = sessionFactory.openSession()) {
			tx = session.beginTransaction();
			session.persist(user);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			throw new SQLException("Failed to create user", e);
		}
	}

	@Override
	public Optional<User> findByEmail(String email) throws SQLException {
		try (Session session = sessionFactory.openSession()) {
			User user = session.createQuery("from User u where u.email = :email", User.class)
					.setParameter("email", email)
					.uniqueResult();
			return Optional.ofNullable(user);
		} catch (Exception e) {
			throw new SQLException("Failed to find user by email", e);
		}
	}

	@Override
	public Optional<User> findByUsername(String username) throws SQLException {
		try (Session session = sessionFactory.openSession()) {
			User user = session.createQuery("from User u where u.username = :username", User.class)
					.setParameter("username", username)
					.uniqueResult();
			return Optional.ofNullable(user);
		} catch (Exception e) {
			throw new SQLException("Failed to find user by username", e);
		}
	}

	@Override
	public User findById(long userId) throws SQLException {
		try (Session session = sessionFactory.openSession()) {
			return session.get(User.class, userId);
		} catch (Exception e) {
			throw new SQLException("Failed to find user by id", e);
		}
	}
}
