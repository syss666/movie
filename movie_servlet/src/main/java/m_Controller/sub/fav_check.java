package m_Controller.sub;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.fav_service;
import vo.favVO;
import vo.movieVO;

public class fav_check implements Controller{


	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session =req.getSession();
		movieVO vo = (movieVO) session.getAttribute("vo");
		String m_id=req.getParameter("m_id");
		if(vo==null)//로그인 안됫을때
		{
			req.setAttribute("m_id",m_id);
			System.out.println("미로그인");
			HttpUtil.Forward(req,resp,"/movie/item.jsp");
			
		}
		else
		{
			System.out.println("로그인");
			String userid = vo.getId();
			String movieid = (String) req.getParameter("movieid");
			fav_service service = fav_service.getInstance();
			int num = service.fav_check(userid,movieid);
			String check2 = null;
			if(num==1)
			{
				check2="find";
				try {
					resp.getWriter().print(check2);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
				
		
	}

}
