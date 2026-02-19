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
		List<Chapter> chapters=new ArrayList<>();
		String sql="SELECT * FROM chapters WHERE book_id=? ORDER BY chapter_sequence ASC";
		
		try(Connection con=DBUtil.getConnection();
			PreparedStatement ps=con.prepareStatement(sql)){
			ps.setInt(1,bookId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				Chapter chapter= new Chapter();
				chapter.setChapterId(rs.getInt("chapter_id"));
				chapter.setTitle(rs.getString("title"));
				chapter.setChapterSequence(rs.getInt("chapter_sequence"));
				chapters.add(chapter);
			}
		}
		return chapters;
	}
}
