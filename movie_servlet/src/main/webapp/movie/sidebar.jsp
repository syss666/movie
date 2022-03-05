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
/* sidebar */
#sidebar{
	
	width: 250px;
	height: 500px;
	background-color: gray;
	display: flex;
	flex-wrap: wrap;
	align-content: flex-start;
	padding:50px 10px;
	position:fixed;
	margin:0;
	margin-left: 10px;
	border-radius :0 1em 1em 0 ;
	z-index: 10;
	background-color: rgb(158, 158, 196);
	
}
.genchk{
	margin: 0px;
	
}
form label {
	margin : 5px;
	display : inline-block;
	width:100px; line-height:30px;
}

.side_btn{
	border-radius :1em 1em 1em 1em ;
	background-color: #9f8bb6;
	border: 1px solid gray; 

	color: black; 
	padding: 5px;
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
<form name = "gen_form" method="get" action="javascript:check()" >
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
 
    <div style="margin-top:10px;">
    	<input class="side_btn" type="submit" value="Submit"> 
    	<input class="side_btn" type="reset" value="Reset">
    </div>
  
</form>
</div>

<form name = "g_form" action="/movie/genre.jsp" method="get">
	<input type = "hidden" id= "t11" name = "total_pages" value= "">
	<input type = "hidden" id= "g" name = "gen_list" value= "">
</form>
<script>

function check()
{
   var gen_list = '';
   
    $('input[class="genchk"]:checked').each(function (index) {
       if (index != 0) {
    	   gen_list += ', ';
       }
       gen_list += $(this).val();
    });
    console.log(gen_list);
    total_page2(gen_list);
}


function total_page2(gen_list)
{
	const GENREURL="https://api.themoviedb.org/3/discover/movie?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&sort_by=popularity.desc&with_genres=";
	const url = GENREURL+gen_list;
	console.log(url);
	$.ajax({
	    url: url, 
	    type: "GET",                             
	    dataType: "json" ,
		success:function(m_data) 
		{
			var form = document.g_form;
			let total_pages=m_data.total_pages;
			document.getElementById("t11").value=total_pages;
		    document.getElementById("g").value=gen_list;
			form.submit();

		}
	});
}
</script>

</body>
</html>