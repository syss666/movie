<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
        
	
		<jsp:include page="/movie/mypage/my_sidebar.jsp" />
		<%@page import="vo.*" %>
		<%
			movieVO vo= (movieVO)session.getAttribute("vo");
		%>
		<div class="mymenu_2">
			<h1 style="text-align: center;">나의 개인 정보 </h1>
			<table class = "change_table">
				<tr>	
					<td>I	D</td>
					<td><%=vo.getId() %></td>
				</tr>
				<tr>	
					<td>이   름</td>
					<td><%=vo.getName() %></td>
				</tr>
				<tr>
					<td>핸  드  폰  번  호</td>
					<td><%=vo.getPhone() %></td>
				</tr>
				<tr>
					<td>이  메  일</td>
					<td><%=vo.getEmail() %></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="2"><input class = "c_btn" type="button" value="개인 정보 변경하기"  onClick="location.href='/movie/mypage/change_mydata.jsp'"></td>
				</tr>
			</table>
		
			<!-- footer -->     
		    <jsp:include page="/movie/footer.jsp" />
		    <!-- footer -->
		</div>
		
	</div>

</body>
</html>