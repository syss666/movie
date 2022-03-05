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
	</div>
	<style>
		
	</style>
	<div>
		<jsp:include page="/movie/mypage/my_sidebar.jsp" />
	</div>
	<div class="mymenu_3" style="padding-top: 50px; padding-left: 30px;">
	<div style = "width: 100%; height:50px;margin-bottom:30px;">
		<h2 style = "height:50px; ">오류 신고</h2>
	</div>
	<div style = "width: 100%; height:50px;margin-bottom:30px;">
	<q> 불편을 드려 죄송합니다 사이트 이용중 오류 사항이나 불편 사항이 있으시다면 이메일로 겪으신 불편사항이나 오류를 보내주시면 감사하겠습니다.</q>
	</div>
	<div style = "width: 100%; height:50px;margin-bottom:30px;">
	<h3>아래 이메일로 보내주십시오</h3>
	</div>
	<div style = "width: 100%; height:50px;margin-bottom:600px;">
	<a href ="mailto:thdrhkdtjq54@gmail.com"><h3>EMAIL</h3></a>
	</div>
	
	<!-- footer -->     
    <jsp:include page="/movie/footer.jsp" />
    <!-- footer -->
    </div>
</body>


</html>