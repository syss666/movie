<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<%@include file="/movie/link.jsp" %> 
<body>
<!-- 메인페이지 시작 -->
    <div class="mainview">
        <!-- 로고랑 topmenu 시작 --> 
		<div>
		<jsp:include page="/movie/topmenu_login.jsp" />
        </div>
        <!-- 로고랑 topmenu 끝 -->
	</div>

	<%@page import="java.util.*,vo.*" %>
	<%
		int start=0;
		int end = 20;
		int nowpage=0;
		Vector<favVO> list =(Vector<favVO>)request.getAttribute("list");
		int tcnt =(int)request.getAttribute("tcnt");
		System.out.println("tcnt : "+ tcnt);
		System.out.println("list : "+ list);
		
			
		

	%>

		<form name = "m_fo" action="/movie/item.jsp" method="get">
			<input type = "hidden" id= "f_m" name = "m_id" value= "">
		</form>
		<jsp:include page="/movie/mypage/my_sidebar.jsp" />
		<div class="mymenu_3" style="padding-top: 50px; padding-left: 30px;">
			<div style = "width: 100%; height:50px;margin-bottom:30px;">
				<h2 style = "height:50px; ">관심 목록</h2>
			</div>
			<div style="padding-top: 50px; padding-left: 30px; margin-bottom:400px;">
			<%
			try{
				for(int i=0; i<list.size();i++){
					%>
						<div class="m_c2">
							<img src ="<%=list.get(i).getM_poster() %>" alt = "<%=list.get(i).getMovieid() %>" >
							<h3><%=list.get(i).getM_title() %></h3>
						</div>
					<%}
			}
			catch(Exception e){}
			%>
			</div>
			<!-- footer -->     
	    	<jsp:include page="/movie/footer.jsp" />
	    	<!-- footer -->  
		</div>

<script>
$(document).on('click', '.m_c2', function(){
	const m_id = $(this).children().attr('alt');
	var form = document.m_fo;
	document.getElementById("f_m").value = m_id;
	form.submit();
})
</script>
	
</body>
</html>