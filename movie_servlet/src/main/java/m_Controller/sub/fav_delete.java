package m_Controller.sub;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;
import service.fav_service;
import vo.movieVO;

public class fav_delete implements Controller{
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		
		HttpSession session =req.getSession();
		movieVO vo = (movieVO) session.getAttribute("vo");
		String userid = vo.getId();
		String movieid = (String) req.getParameter("movieid");
		fav_service service = fav_service.getInstance();
		service.delete(userid,movieid);
		
	}

}
