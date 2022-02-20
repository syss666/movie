package m_Controller.sub;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.fav_service;
import service.movie_service;
import vo.favVO;
import vo.movieVO;

public class fav_insert implements Controller{

	@Override
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session =req.getSession();
		movieVO vo = (movieVO) session.getAttribute("vo");
		System.out.println(vo);
		if(vo==null)
		{
			req.setAttribute("msg","로그인 상태에서 사용가능합니다.");
			System.out.println("미로그인");
			HttpUtil.Forward(req,resp,"/movie/item.jsp");
			
		}
		else{
			System.out.println("로그인");
			String userid = vo.getId();
			String movieid = (String) req.getParameter("movieid");
			String m_title = (String)req.getParameter("title");
			String m_poster = (String)req.getParameter("poster");
			System.out.println(movieid);
			System.out.println(m_title);
			
			fav_service service = fav_service.getInstance();
			favVO fvo = new favVO(userid,movieid,m_title,m_poster);
			
			service.insert(fvo);
			
			
			HttpUtil.Forward(req,resp,"/movie/item.jsp");
		}
		
		
		
		
	}

}
