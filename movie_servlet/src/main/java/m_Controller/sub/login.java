package m_Controller.sub;

import org.mindrot.jbcrypt.BCrypt;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.movie_service;
import vo.movieVO;

public class login implements Controller{

	@Override
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		movie_service service = movie_service.getInstance();
		movieVO vo = service.search(id);
		//계정조회 없을때
		if(vo==null)
		{
			
			req.setAttribute("MSG", "등록되지 않은 계정입니다.");
			HttpUtil.Forward(req, resp, "/movie/login.jsp");
		
		}
		//계정있을떄
		else
		{
			//PWD 일치여부 확인
			if(BCrypt.checkpw(pw, vo.getPw())) {
				//id pwd 일치한경우
				//4.세션객체에 ID/PW저장
				HttpSession session = req.getSession();
				session.setAttribute("vo",vo);

				//5.일치한다면 usermain.jsp로 이동
				HttpUtil.Forward(req, resp,"/movie/main.jsp");
				
			}
			else {
				req.setAttribute("MSG","PW가 일치하지 않습니다.");
				HttpUtil.Forward(req, resp, "/movie/login.jsp");	
				
			}
		}
		
	}

}
