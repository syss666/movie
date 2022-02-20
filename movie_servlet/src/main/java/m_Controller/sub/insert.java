package m_Controller.sub;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.movie_service;
import vo.movieVO;

public class insert implements Controller{

	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		String id= req.getParameter("id");
		String pw= req.getParameter("pw");
		String name= req.getParameter("name");
		String email= req.getParameter("email");
		String phone= req.getParameter("phone");
		System.out.println("insert접근");
		System.out.printf("%s %s %s %s %s \n",id,pw,name,email,phone);
		
		movie_service service = movie_service.getInstance();
		movieVO vo = new movieVO(id,pw,name,email,phone);
		service.insert(vo);
		
		HttpUtil.Forward(req,resp,"/movie/login.jsp");
		
	}

}
