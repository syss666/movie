package dao;

import java.net.http.HttpRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.http.HttpSession;
import vo.movieVO;

public class movie_dao {
	//멤버변수 DataSource 코드처리
	Context initCtx;
	Context envCtx ;
	DataSource ds ;
	//멤버변수 SQL 쿼리 관련 참조변수
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	private static movie_dao instance = new movie_dao();
	
	private movie_dao() {
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
	
	public static movie_dao getInstance() {
		if(instance ==null) {
			instance=new movie_dao();
		}
		return instance;
	}
	
	public boolean insert(movieVO vo) {
		
		int result=0;
		boolean flag=false;
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement("insert into user_data values(?,?,?,?,?)");
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, BCrypt.hashpw(vo.getPw(),BCrypt.gensalt()));
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5,vo.getPhone());
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
	//회원 탈퇴
	public void delete(String userid) {

		String id = userid;
		System.out.println("삭제할 id는 " +id);
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement("delete from user_data where id=?");
			pstmt.setString(1, id);
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
	//회원 정보 수정
	public void update(movieVO vo) {
	
		try {
			
			conn=ds.getConnection();
			pstmt = conn.prepareStatement("update user_data set pw=?, name=?, email=?, phone=? where id=?");
			String id= vo.getId();
			id=id.trim();
			pstmt.setString(1, BCrypt.hashpw(vo.getPw(),BCrypt.gensalt()));
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, id);
			pstmt.executeUpdate();
			
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
	//회원 검색 및 로그인 
	public movieVO search(String id)
	{
		movieVO vo =null;
		try 
		{
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select * from user_data where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs!=null)
			{		
				while(rs.next()){
					vo = new movieVO(rs.getString("id"), rs.getString("pw"), rs.getString("name"), rs.getString("email"), rs.getString("phone"));
				}
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
		return vo;
	}
	//로그인(id 중복체크)
	public int IDcheck(String id)
	{
		int check=0;
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select count(*) from user_data where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs!=null) {
				while(rs.next()) {
					check=rs.getInt(1);
					System.out.println("check의 값은 : "+check);
				}	
			}
		} 
		catch (SQLException e) {
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
