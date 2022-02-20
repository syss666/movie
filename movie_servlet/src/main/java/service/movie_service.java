package service;

import dao.movie_dao;
import jakarta.servlet.http.HttpSession;
import vo.movieVO;

public class movie_service {
	
	//dao 연결을 위한 참조변수
	movie_dao dao =null;
	
	private static movie_service instance = new movie_service();
	private movie_service() {
		dao=movie_dao.getInstance();
	};
	public static movie_service getInstance()
	{
		if(instance==null)
		{
			instance=new movie_service();
		}
		return instance;
	}
	//회원가입
	public boolean insert(movieVO vo) {
		return dao.insert(vo);
	}
	//회원탈퇴
	public void delete(String id) {
		System.out.println("삭제할 id는 " +id);
		dao.delete(id);
	}
	//회원 정보 수정
	public void update(movieVO vo) {
		 dao.update(vo);
	}
	//회원 정보 검색
	public movieVO search(String id) {
		return dao.search(id);
	}
	//아이디 중복체크
	public int idcheck(String id) {
	
		return dao.IDcheck(id);
		
	}

	
	
	
}
