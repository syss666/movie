package m_Controller.sub;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Execute;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.Controller;
import m_Controller.HttpUtil;
import service.movie_service;
import vo.movieVO;

public class idcheck implements Controller{
	
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		String id= req.getParameter("id");
		movie_service service = movie_service.getInstance();
		int check = service.idcheck(id);
		HttpSession session = req.getSession();
		session.setAttribute("check",check);
		
		
	}
	
}
