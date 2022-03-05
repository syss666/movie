package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import vo.favVO;

public class fav_dao {
	Context initCtx;
	Context envCtx ;
	DataSource ds ;
	//멤버변수 SQL 쿼리 관련 참조변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static fav_dao instance = new fav_dao();
	
	private fav_dao() {
		try {
			initCtx = new InitialContext();
			envCtx = (Context)initCtx.lookup("java:comp/env");
			ds = (DataSource)envCtx.lookup("jdbc/MysqlDB");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}
	public static fav_dao getInstance() {
		if(instance ==null) {
			instance=new fav_dao();
		}
		return instance;
	}

	public boolean insert(favVO fvo) {
		boolean flag = false;
		int result=0;
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement("insert into fav_tbl values(?,?,?,?)");
			pstmt.setString(1, fvo.getUserid());
			pstmt.setString(2,fvo.getMovieid() );
			pstmt.setString(3, fvo.getM_title());
			pstmt.setString(4, fvo.getM_poster());

			result = pstmt.executeUpdate();
			if(result!=0) {
				flag=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {rs.close();}catch(Exception e) {}
			try {pstmt.close();}catch(Exception e) {}
			try {conn.close();}catch(Exception e) {}
		}
		
		return flag;
	}
	
	public int check(String userid, String movieid) {
		int check=0;
		try {
			System.out.println("check함수 진입");
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select count(*) from fav_tbl where user_id=? AND  m_id=?");
			pstmt.setString(1, userid);
			pstmt.setString(2, movieid);
			rs = pstmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					check=rs.getInt(1);
					System.out.println("check의 값은 : "+check);
				}	
			}
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
			try {rs.close();}catch(Exception e) {}
			try {pstmt.close();}catch(Exception e) {}
			try {conn.close();}catch(Exception e) {}
		}

		return check;
	}
	public void delete(String userid, String movieid) {
		try {
			System.out.println("삭제진입");
			conn=ds.getConnection();
			pstmt = conn.prepareStatement("delete from fav_tbl where user_id=? AND m_id=?");
			pstmt.setString(1, userid);
			pstmt.setString(2,movieid);
			pstmt.executeUpdate();
			System.out.println("삭제완료");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try {pstmt.close();}catch(Exception e) {}
			try {conn.close();}catch(Exception e) {}
		}

	}
	
	public int getTotalCount(String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		System.out.println("dao_getTotalCount 진입");
		int cnt=0;
		try {
			
			conn=ds.getConnection();
			pstmt=conn.prepareStatement("select count(*) from fav_tbl where user_id = ?");
			pstmt.setString(1,user_id);
			rs = pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					System.out.println("rs값은 "+rs.getInt(1));
					cnt=rs.getInt(1);
				}	
			}
			System.out.println("cnt값은 "+cnt);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try{rs.close();}catch(Exception e) {}
			try{pstmt.close();}catch(Exception e) {}
			try{conn.close();}catch(Exception e) {}	
		}
		return cnt;
	}
	
	public Vector<favVO> getlist(int start, int end, String user_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		System.out.println("dao_getlist 진입");
		Vector<favVO> list = new Vector();
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement("select * from fav_tbl  where user_id = ? order by m_id desc limit ?,?;");
			pstmt.setString(1, user_id);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					//읽어온 테이블 각행의 값을 BoardVO로 저장
					favVO fvo = new favVO(
						rs.getString("user_id"),
						rs.getString("m_id"),
						rs.getString("m_title"),
						rs.getString("m_poster")
					);
					//리스트에 넣기
					list.add(fvo);
				}	
			}	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{rs.close();}catch(Exception e) {}
			try{pstmt.close();}catch(Exception e) {}
			try{conn.close();}catch(Exception e) {}	
		}
		
		return list;
	
	}
	
	
	
	
	
	
	
	
	
	
}
