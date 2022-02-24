<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%@include file="/movie/link.jsp" %>
 
</head>
<body>

<div class="mainview">
	<!-- 로고랑 topmenu 시작 -->
    <%
        if(session.getAttribute("vo")==null)
		{
		%>
        <jsp:include page="/movie/topmenu.jsp" />
        <%}
        else
		{%> 
		<jsp:include page="/movie/topmenu_login.jsp" />
	 	<%} %> 
    <!-- 로고랑 topmenu 끝 -->
	<!-- 검색창 시작 -->
	
    <%
    	String movie_name = request.getParameter("m_name");
    	System.out.println(movie_name);
    %>
    <script>var movie_name = "<%=movie_name%>";</script>

    <div class="movie">
    	<div style="width: 100%; margin-bottom: 30px;"> <h3 style="width: 100%; margin-left:10%" >영화 검색</h3></div>
    	<!-- 검색 초기 화면(null일때) -->
    	<div class="null_movie">
    		
    	</div>
	</div>	
	<form name = "m_fo" action="/movie/item.jsp" method="get">
			<input type = "hidden" id= "m" name = "m_id" value= " ">
	</form>
	<!-- ----------------------------------------------------------------------------------- -->
	<style>
		.null_con
		{
			height: 800px;		
		}
	</style>
<script>

	const IMGPATH = 'https://image.tmdb.org/t/p/w185';
	const SEARCHAPI ="https://api.themoviedb.org/3/search/movie?&api_key=04c35731a5ee918f014970082a0088b1&language=ko&query=";
	const searchTerm = movie_name;
	if(searchTerm!="null")
	{
		getmovie(SEARCHAPI+searchTerm);	
	}
	else
	{
		const null_search = document.createElement("div");
		null_search.classList.add("null_con");
		null_search.innerHTML =  "<h2>검색할 영화명을 입력하여 주십시오.</h2>";		      
         $('.movie').append(null_search);
	}
	function getmovie(url)
	{
		$.ajax({
		    url: url, 
		    type: "GET",                             
		    dataType: "json" ,
			success:function(m_data) 
			{
				eachmovie(m_data.results);
			}
		});
	}
	function eachmovie(movies)
	{
		 movies.forEach((movie) => {
			 const movieEl = document.createElement("div");
		        movieEl.classList.add("m_c2");
		        tmp =  IMGPATH +movie.poster_path;
		        title = movie.title;
		        id=movie.id
		        
		        movieEl.innerHTML =  "<img src="+tmp+"  alt="+id+"> <h3>"+title+"</h3>";
		      
		         $('.movie').append(movieEl);
		    });
		
	}
	$(document).on('click', '.m_c2', function()
	{
		const m_id = $(this).children().attr('alt');
		var form = document.m_fo;
		document.getElementById("m").value = m_id;
		form.submit();
	})
</script>
	
	<!-- 검색창 끝 -->
	
	<footer>

    </footer>
	</div>	
</body>
</html>