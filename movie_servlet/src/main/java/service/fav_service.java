package service;

import java.util.Vector;
import dao.fav_dao;
import vo.favVO;


public class fav_service {
	
	fav_dao dao =null;
	private static fav_service instance = new fav_service();
	private fav_service() {
		dao = fav_dao.getInstance();
	};
	
	public static fav_service getInstance()
	{
		if(instance==null)
		{
			instance=new fav_service();
		}
		return instance;
	}

	public boolean insert(favVO fvo) {
		
		return dao.insert(fvo);
		
	}

	public int fav_check(String userid, String movieid) {
		return dao.check(userid,movieid);
		
	}

	public void delete(String userid, String movieid) {
		dao.delete(userid,movieid);
		
	}

	public int getTotalCount(String user_id) {
		System.out.println("getTotalCount service 진입");
		return dao.getTotalCount(user_id);
	}

	public Vector<favVO> getList(int start, int end, String user_id) {
		System.out.println("getList service 진입");
		return dao.getlist(start,end,user_id);
	}

	
	

	
	
	
	
	
	
}
