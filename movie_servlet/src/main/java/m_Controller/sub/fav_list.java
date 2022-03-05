package m_Controller.sub;

import java.util.Vector;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpUtils;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.fav_service;
import vo.favVO;
import vo.movieVO;

public class fav_list implements Controller{

	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		fav_service service = fav_service.getInstance();
		HttpSession session =req.getSession();
		movieVO vo = (movieVO) session.getAttribute("vo");
		System.out.println("list java 진입");
		String user_id= vo.getId();
		user_id=user_id.trim();
		System.out.println("세션에서 가져온 id값은 : " +user_id);
		
		int start = 0;		//시작게시물 위치
		int end = 20;	
		int nowPage=1;
		
		Vector<favVO> list = service.getList(start, end, user_id);
		int tcnt = service.getTotalCount(user_id);
		req.setAttribute("list", list);
		req.setAttribute("tcnt", tcnt);
		HttpUtil.Forward(req, resp, "/movie/mypage/fav.jsp");
	}

}
