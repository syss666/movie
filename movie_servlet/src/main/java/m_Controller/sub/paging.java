package m_Controller.sub;

import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import m_Controller.Controller;
import m_Controller.HttpUtil;

public class paging implements Controller{

	@Override
	public void Execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String total_pages = (String)req.getParameter("total");
		System.out.println("total값은 : " +total_pages );
		System.out.println("pagingjava접근");
		req.setAttribute("total_pages", total_pages);
		
		/*
		 * try { resp.getWriter().print(total);
		 * HttpUtil.Forward(req,resp,"/movie/searchpage.jsp"); } catch (IOException e) {
		 * // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		
		
	}

}
