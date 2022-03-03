<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<div id="topbar">   
	<div id="tb1" style="float: left; width: 10%; height: 50px;">
		<a href="/movie/main.jsp"><img src="/movie/img/log.jpg" style="width: 100%; height: 100%;"></a>
	</div>
	<div id="tb2" style="align-items:center; justify-content:center; width: 75%; height: 50px;">
		<form  id = "s_form" method="get" action="/movie/searchpage.jsp" >
 			<input type="text" name="m_name" style="margin:5px 5px; width:80%; height: 70%; border-radius : 0.5em 0.5em 0.5em 0.5em ;">
     		<input type="submit" value ="Search" id="searchbtn" class= "btn_group">
		</form>
	</div>
	<div id="tb3" style=" float: right; width:15%; height: 50px; align-items:center; justify-content:center;">
		<a href="/movie/signup.jsp" style="margin: 0px auto;">회원가입</a>
		<a href="/movie/login.jsp" style="margin: 0px auto;">로그인</a>
    </div>
</div>
        
      
</body>
</html>