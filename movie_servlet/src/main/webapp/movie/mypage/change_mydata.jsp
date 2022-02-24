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
   
	<div>
		<jsp:include page="/movie/mypage/my_sidebar.jsp" />
		<%@page import="vo.*" %>
		<%
			movieVO vo= (movieVO)session.getAttribute("vo");
			String id = vo.getId();
		%>
		<div class="mymenu_2">
			<h1 style="text-align: center;">개인 정보 수정 </h1>
			<form  method="post" action= "/movieUpdate.do?id= <%=id %>" class="change_from" >
				<table class = "change_table">
					<tr>
						<td colspan="2" style="text-align: center;">변경 하실 정보를 입력하여 주십시오.</td>
					</tr>
					<tr>	
						<td>이   름</td>
						<td><input type ="text" name="name" class="change" required></td>
					</tr>
					<tr>
						<td>패  스  워  드</td>
						<td><input type="password" name="pw" class="change" required></td>
					</tr>
					<tr>
						<td>이  메  일</td>
						<td><input type="text" name="email" class="change" required></td>
					</tr>
					<tr>
						<td>핸  드  폰  번  호</td>
						<td><input type="text" name="phone" class="change" required></td>
					</tr>
					<tr>
						<td style="text-align: right;"><input class = "c_btn" type="submit" value="변경" ></td>
						<td><input class = "c_btn" type="button" value="취소" onClick="history.back()"></td>
					</tr>
				</table>
			</form>
			
		</div>
	</div>
        
        
        
        
	</div>

</body>
</html>