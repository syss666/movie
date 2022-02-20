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
		.mymenu{
        		width:15%;
        		height:800px;
        		margin:0px;
        		padding-top:50px;
        		padding-left : 20px;
        		background-color: rgb(185, 185, 224);
        		position: fixed;
        		display: inline-block;
        		top:50px;
        	}
	</style>
	<div>
		<jsp:include page="/movie/mypage/my_sidebar.jsp" />
	</div>
	버그신고


</body>


</html>