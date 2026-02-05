package models;

public class Genre {

	private long genreId;
	private String name;
	
	public Genre() {
		
	}
	
	public Genre(long genreId, String name) {
		this.genreId=genreId;
		this.name=name;
	}
	
	public long getGenreId() {
		return genreId;
	}
	public void setGenreId(long genreId) {
		this.genreId = genreId;
	}
	public String getGenreName() {
		return name;
	}
	public void setGenreName(String name) {
		this.name = name;
	}
	
}
