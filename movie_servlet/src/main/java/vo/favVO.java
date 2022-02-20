package vo;

public class favVO {
	
	private String userid ;
	private String movieid;
	private String m_title;
	private String m_poster;
	
	public String getUserid() {
		return userid;
	}
	public String getMovieid() {
		return movieid;
	}
	public String getM_title() {
		return m_title;
	}
	public String getM_poster() {
		return m_poster;
	}
	public favVO(String userid, String movieid, String m_title, String m_poster) {
		 
		this.userid = userid;
		this.movieid = movieid;
		this.m_title = m_title;
		this.m_poster = m_poster;
	}
	
	
}
