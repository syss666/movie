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
	<div>
		<jsp:include page="/movie/mypage/my_sidebar.jsp" />
		<style>
			.d_form{
				width: 700px;
				height: 300px;
				margin: 30px auto;
				padding: 20px;
				
			}
		</style>
		<div class="mymemu_2" style =" text-align: center;">
			<h1>회원 탈퇴</h1>
			<form class = "d_form" method="post" action="/movieDelete.do">
				<h2 style="margin-bottom:20px;">회원 탈퇴 하시겠습니까</h2>
				<p> 
					탈퇴를 하신다면 제공하신 정보는 삭제 됩니다. <br> 탈퇴를 원하신다면 아래 탈퇴 동의 후 탈퇴하기를 눌러주십시오.
				 </p><br>
				<label><input id="ch" type="checkbox" name="chk" value="yes" >회원 탈퇴 동의</label><br><br>
				<button id= "d_btn" style="width:300px; height: 50px;" disabled>탈퇴하기</button>
			</form>
		</div>
		<script>
		$(document).ready(function(){
			$("#ch").on('click', function() { 
				if ( $(this).prop('checked') ) 
				{ 
					$("#d_btn").prop("disabled", false);
				} 
				else 
				{ 
					$("#d_btn").prop("disabled", true);
				} 
			});		
		});
		
		</script>
		
	</div>
	계정삭제



</body>
</html>