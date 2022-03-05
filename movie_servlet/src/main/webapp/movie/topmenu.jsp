<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <%@include file="/movie/link.jsp" %> 
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="#">

</head>
<body>

<style>
#logo{
	color:white;
	margin:0px;
	}
#tb1{
	float: left; 
	width: 140px; 
	height: 50px; 
	background-color: black;
	text-align:center;
	margin-right: 50px;
}
</style>
<div id="topbar">   
	<div id="tb1">
		<a style="margin:0 auto;" href="/movie/main.jsp"><h1 id ="logo">SGS</h1></a>
	</div>
	<div id="tb2" style="align-items:center; justify-content:center; width: 75%; height: 50px;">
		<form  id = "s_form" method="get" action="javascript:total_page()" >
 			<input type="text" name="m_name" id = "movie_name" style="margin:5px 5px; width:80%; height: 70%; border-radius : 0.5em 0.5em 0.5em 0.5em ;">
     		<input type="submit" value ="Search" id="searchbtn" class= "btn_group">
		</form>
	</div>
	<div id="tb3" style=" float: right; width:15%; height: 50px; align-items:center; justify-content:center;">
		<a href="/movie/signup.jsp" style="margin: 0px auto;">회원가입</a>
		<a href="/movie/login.jsp" style="margin: 0px auto;">로그인</a>
    </div>
</div>
     <form name = "t_form" action="/movie/searchpage.jsp" method="get">
		<input type = "hidden" id= "t" name = "total_pages" value= "">
		<input type = "hidden" id= "m" name = "movie_name" value= "">
	</form>

      
      
      
</body>
</html>