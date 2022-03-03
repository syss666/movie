<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<style>
#sidebar{
	all: inherit;	
	width: 300px;
	height: 800px;
	background-color: gray;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	padding:50px 10px;
}
.genchk{
	margin: 0px;
	
}
form label {
	margin : 5px;
	display : inline-block;
	width:100px; line-height:30px;
}
</style>
<%
	if(request.getParameter("genre")!=null)
	{	
		String[] gen = request.getParameterValues("genre");
		int len = gen.length;
	}
%>
<div id ="sidebar">
<form name = "gen_form" method="get" action="/movie/genre.jsp" >
	<label><input class = "genchk" type="checkbox" name="genre" value="28">액션</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="12">모험</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="16">애니메이션</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="35">코미디</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="80">범죄</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="99">다큐멘터리</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="18">드라마</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="10751">가족</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="14">판타지</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="36">역사</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="27">공포</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="10402">음악</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="9648">미스터리</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="10749">로맨스</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="878">SF</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="10770">TV 영화</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="53">스릴러</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="10752">전쟁</label>
    <label><input class = "genchk" type="checkbox" name="genre" value="37">서부</label>
    <br>
    <input type="submit" value="Submit"> 
    <input type="reset" value="Reset">
</form>

</div>


</body>
</html>