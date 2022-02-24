<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <%@include file="/movie/link.jsp" %>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
<style>

.m_show
{
	width: 100%;
    height: auto;
    margin: 110px auto;
	display: flex;
	flex-direction: column;
	background-size: 100%;
	background-color: rgb(158, 158, 196);
}
.m_data1{
	width: 100%;
	height: 800px;
	margin-bottom: 10px;
	padding: 40px;


}
.m_data2{
	width: 100%;
	height: 800px;
	margin-bottom: 10px;
	background-color: green;
}
.m_con1
{
	width: 35%;
	height: 100%;
	float: left;
	margin-right: 40px;
}
.m_con1 img
{
	margin-left:100px;
}
.m_con2
{
	width: 55%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	
}
.m_title{
	width: 80%;
	height: 100px;;

	display: flex;
	flex-direction: row;
	align-items: center;
}
/* 개봉일 */
.m_date{
	width: 80%;
	height: 60px;;
	align-items: center;

}
/* 개봉일과 평점 클래스(글자 크기조절) */
.m_sub
{
	font-size: 15px;
	margin-left:15px;
}
.m_overview
{
	width: 80%;
	height: 400px;
}
.fav_btn
{
	margin-left: 150px;

	
}
.fav_btn img
{
	width:30px;
	height: 30px;
}
</style>
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
	 	<%}%> 
        <!-- 로고랑 topmenu 끝 -->
	<%
		String m_id = request.getParameter("m_id");
		System.out.println("m_id의값은" +m_id);
	%>
	
	
	<div class="m_show" id="m_show2">
		<!-- 영화 정보(포스터 타이틀 내용등) -->
		<div class= "m_data1">
			<div class ="m_con1"></div>
			<div class="m_con2">
				<div class = "m_title"></div>
				<div class = "m_date" id="mdate">
					<h2>개봉일 : </h2>
				</div>
				<div class = "m_date" >
					<div id = "mrated">
						<h2>평가점수 :</h2>
					</div>
					<div id ="fav_2" style =" text-align: center; ">
					<%
					if(session.getAttribute("vo")!=null) 
					{
					%>
						<a href= "javascript:fav_insert()" id="fav_a" class ="fav_btn"><h3>관심</h3><img id="fav_img" src = "/movie/img/checkmark-outline.svg"></a>
					<%
					}
					%>
					</div>
				</div>
				<h1>스토리</h1>
				<div class = "m_overview">
				
				</div>
				
			</div>
		</div>
		<!-- 영화 트레일러 공간 -->
		<h1 style="margin-left:100px; margin-bottom : 50px;">예고편</h1>		
			<p align="middle"><iframe id="t_iframe" style="width: 1300px; height: 700px;"></iframe></p>
		
		<!-- 관심영화 등록하기 위한 폼 -->
		<form method="get" action="/moviefav_in.do" name ="fav_form">
			<input type="hidden" id="m_i" name="movieid" value="">
        	<input type="hidden" id="m_t" name = "m_title" value="">
         	<input type="hidden" id="m_p" name="m_poster" value="">
		</form>
		
	</div>
      
      <!-- footer -->
<footer >

</footer>
<!-- footer end -->

</div>
    
<script>
	const id_url = "https://api.themoviedb.org/3/movie/";
	const id_key = "/external_ids?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31";
	const IMGPATH = 'https://image.tmdb.org/t/p/w185';
	const trailer_url = "/videos?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko"
	/* 영화의 id값인 m_id*/
	var m_id = "<%=m_id%>"; 
	
	
	s_id(m_id);
	showtrailer(m_id);
	
	
	
	function s_id(id)//영화 검색을 위해 id값을 받아 imdb값을 구하는 함수
	{
		const i_url = id_url+id+id_key;
		$.ajax({
		    url: i_url, 
		    type: "GET",                             
		    dataType: "json" ,
			success:function(s_data) 
			{
				const imdbid = s_data.imdb_id;
				showmovie(imdbid);
				fav_check(m_id);
			}
		});
	}
	
	function fav_check(m_id)//관심영화 저장 중복 확인
	{
		$.ajax({
		    url: "/moviefav_check.do",
		    type: "GET",     
		    data: { "movieid":m_id},
			success:function(s_data) 
			{
				if(s_data=='find'){
					
					$('#fav_img').attr("src", "/movie/img/checkmark-circle-outline.svg");
					<a href= "#" id="fav_a2" class ="fav_btn"><h3>관심</h3><img id="fav_img" src = "/movie/img/checkmark-circle-outline.svg"></a>
					$('#fav_a2').attr("href", "#");
				}
					
			}
		});	

	}

	
	function showmovie(imdbid)//imdb값을 받아 원하는 영화 검색하게 하는 함수
	{
		const s_url = "https://api.themoviedb.org/3/find/";
		const key = "?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&external_source=imdb_id";
		const i_url = s_url+imdbid+key;
		
		$.ajax({
		    url: i_url, 
		    type: "GET",                             
		    dataType: "json" ,
			success:function(s_data) 
			{
				console.log(s_data);
				const result = s_data.movie_results[0];
				const title = result.title;
				sessionStorage.setItem('title', title);
				
				const overview =result.overview;
				const release_date = result.release_date;
				const rated= result.vote_average;
				const m_poster = document.createElement("div");

				tmp =  IMGPATH +result.poster_path;
				sessionStorage.setItem('poster', tmp)
				m_poster.innerHTML = "<img src="+tmp+" alt='test'>";
				
				const m_title = document.createElement("div");
				m_title.innerHTML = "<h1>"+title+"</h1>"
				
				const m_date = document.createElement("div");
				m_date.classList.add("m_sub");
				m_date.innerHTML = "<h1>"+release_date+"</h1>"
				
				const m_rated = document.createElement("div");
				m_rated.classList.add("m_sub");
				m_rated.innerHTML = "<h1>"+rated+"</h1>"
				
				const m_overview = document.createElement("div");
				m_overview.classList.add("m_overview2");
				m_overview.innerHTML = "<h2>"+overview+"</h2>"
				
				$('.m_con1').append(m_poster);
				$('.m_title').append(m_title);
				$('#mdate').append(m_date);
				$('#mrated').append(m_rated);
				$('.m_overview').append(m_overview);
				
			}
		});
	}
	function showtrailer(id)
	{	
		url = id_url+id+trailer_url;
		$.ajax({
		    url: url, 
		    type: "GET",                             
		    dataType: "json" ,
			success:function(t_data) 
			{
				const trailer_data = t_data.results;
				console.log(trailer_data);
				const len=trailer_data.length-1;
				const key = trailer_data[len].key;
				const trailerurl ="https://www.youtube.com/embed/"+key+"?autoplay=1"
				
				$('#t_iframe').attr('src', trailerurl);
			}
		});
	}
	function fav_insert()//관심영화 정보 데이터 베이스 저장
	{
		const title = sessionStorage.getItem("title");
		const poster = sessionStorage.getItem("poster");
		$.ajax({
		    url: "/moviefav_in.do",
		    type: "GET",     
		    data: { "movieid":m_id, "title": title , "poster" : poster},
			success:function(s_data) 
			{	
				if(s_data=='find'){
					alert("TEST");
					$('#fav_img').attr("src", "/movie/img/checkmark-circle-outline.svg");
				
				}

				
			}
		});	
		
	}
	
</script>

</body>
</html>