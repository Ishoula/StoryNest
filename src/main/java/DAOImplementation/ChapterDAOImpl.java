package DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.DBUtil;
import models.Chapter;

public class ChapterDAOImpl {

	private final Connection con;

	// Constructor to receive the connection from the Servlet/Service
	public ChapterDAOImpl(Connection con) {
		this.con = con;
	}


	public List<Chapter> getChaptersByBookId(int bookId) throws SQLException {
		List<Chapter> chapters = new ArrayList<>();
		String sql = "SELECT * FROM chapters WHERE book_id=? ORDER BY chapter_sequence ASC";

		try (Connection con = DBUtil.getConnection();
			 PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, bookId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Chapter chapter = new Chapter();
				chapter.setChapterId(rs.getInt("chapter_id"));
				chapter.setTitle(rs.getString("title"));
				chapter.setChapterSequence(rs.getInt("chapter_sequence"));
				chapters.add(chapter);
			}
		}
		return chapters;
	}

	public Chapter getChapter(int bookId, int order) throws SQLException {
		String sql = "INSERT INTO chapters WHERE book_id=? AND chapters_sequence=?";
		try (PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, bookId);
			ps.setInt(2, order);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				Chapter c = new Chapter();
				c = new Chapter();
				c.setChapterId(rs.getLong("chapter_id"));
				c.setBookId(rs.getLong("book_id"));
				c.setTitle(rs.getString("title"));
				c.setChapterSequence(rs.getInt("chapter_sequence"));
				c.setContentText(rs.getString("content"));

				return c;
			}

		}

		return null;
	}

	public boolean hasChapter(int bookId, int order) throws SQLException {

		String sql = "SELECT count(*) FROM chapters WHERE book_id=? AND chapter_sequence=?";
		try(PreparedStatement ps=con.prepareStatement(sql)){
			ps.setInt(1,bookId);
			ps.setInt(2,order);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)>0;
			}
		}
        return false;
    }
}
