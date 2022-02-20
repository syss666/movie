package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			pstmt=conn.prepareStatement("select count(*) from fav_tbl where user_id=? AND  m_id=?;");
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

}
