package m_Controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import m_Controller.sub.delete;
import m_Controller.sub.fav_check;
import m_Controller.sub.fav_delete;
import m_Controller.sub.fav_insert;
import m_Controller.sub.fav_list;
import m_Controller.sub.idcheck;
import m_Controller.sub.insert;
import m_Controller.sub.login;
import m_Controller.sub.logout;
import m_Controller.sub.paging;
import m_Controller.sub.search;
import m_Controller.sub.update;

public class Front_Controller extends HttpServlet{

	Map <String,Controller> list = null;
	
	public void init() throws ServletException {
		list = new HashMap();
		//Member 관련 URL
		//회원가입
		list.put("/movieJoin.do", new insert());
		//정보조회
		list.put("/movieSearch.do", new search());
		//회원 정보 수정
		list.put("/movieUpdate.do", new update());
		//회원정보 삭제
		list.put("/movieDelete.do", new delete());
		//---------------------------------------
		//로그인
		list.put("/movieLogin.do", new login());
		list.put("/idcheck.do", new idcheck());
		//로그아웃
		list.put("/movieLogout.do", new logout());
		//----------------------------------------
		//관심목록함수
		list.put("/moviefav_in.do", new fav_insert());
		list.put("/moviefav_check.do", new fav_check());
		list.put("/moviefav_delete.do", new fav_delete());
		list.put("/moviefav_list.do", new fav_list());
		//----------------------------------------
		//페이징 관련 함수
		list.put("/movietotal.do", new paging());
	}
	
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url=req.getRequestURI();
		System.out.println("URI : "+url);
		//컨트롤러 꺼내기
		Controller subcontroller = list.get(url);
		//서브 컨트롤러 Execute 함수 실행
		subcontroller.Execute(req, resp);
		
		
	}

	
	

}
