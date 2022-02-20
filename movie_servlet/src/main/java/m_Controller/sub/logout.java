package m_Controller.sub;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;

public class logout implements Controller{

	@Override
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session =req.getSession();
		
		//세션 해제
		session.invalidate();
		//View로 이동(Login.jsp로 이동)
		try {
			resp.sendRedirect("/movie/main.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
