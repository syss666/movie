package m_Controller.sub;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.movie_service;
import vo.movieVO;

public class delete implements Controller{

	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		movieVO vo = (movieVO) session.getAttribute("vo");
		String id = vo.getId();
		id=id.trim();
		movie_service service = movie_service.getInstance();
		session.invalidate();
		service.delete(id);
		System.out.println("삭제할id는"+id);
		HttpUtil.Forward(req,resp,"/movie/main.jsp");
		
		
	}

}
