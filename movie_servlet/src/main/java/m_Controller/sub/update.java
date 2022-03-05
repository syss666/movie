package m_Controller.sub;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.movie_service;
import vo.movieVO;

public class update implements Controller {

	@Override
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		
	
		String id =req.getParameter("id");
		String name= req.getParameter("name");
		String pw= req.getParameter("pw");
		String email= req.getParameter("email");
		String phone= req.getParameter("phone");
		
		movie_service service = movie_service.getInstance();
		movieVO vo = new movieVO(id,pw,name,email,phone);
		
		service.update(vo);
		
		HttpSession session = req.getSession();
		session.setAttribute("vo",vo);
		HttpUtil.Forward(req,resp,"/movie/mypage/mydata.jsp");
		
	}

}
