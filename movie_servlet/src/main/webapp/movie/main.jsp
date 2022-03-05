<%@page import="vo.movieVO"%>
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
        
        <!-- 사이드바 -->
		<jsp:include page="/movie/sidebar.jsp" />
		<!-- 사이드바 -->
        
		<form name = "m_fo" action="/movie/item.jsp" method="get">
			<input type = "hidden" id= "m3" name = "m_id" value= " ">
		</form>
		
		<form name = "more" action="/movie/content.jsp" method="get">
			<input type = "hidden" id= "list1" name = "list2" value= "">
		</form>
		
		
        <!-- 영화 추천 창 시작 -->
        <div id="popular_movie" class="con1" >           
            <div id="popular_movie2" class="con2">
                <div class="tool">
                    <p style="margin-left: 30px;">영화</p>
                    <label><input type ="button" id = "1" class="m_btn" onclick="golist(this.id)"><b><더보기></b></label>
                </div>
             
            </div>
        </div>
        <!-- 영화 추천 창  끝 -->
        <style>
        	.m_btn{
        		opacity:0;
        	}
        	.tool label{
        		padding-right: 10px;
        	}
        </style>
        <!-- 상영예정영화 컨텐츠 창 시작-->
        <div id="upcoming_list" class="con1">  
            <div id="upcoming_list2" class="con2">
                <div class="tool">
                    <p style="margin-left: 30px;">개봉 예정작</p>
                    <label><input type ="button" id = "2" class="m_btn" onclick="golist(this.id)"><b><더보기></b></label>
                </div> 
            </div>
        </div>
        <!-- 상영예정영화 컨텐츠 창 끝 -->

        <!-- 상영중 영화 컨텐츠 창 시작 -->
        <div id="nowplay_list" class="con1">
            <div id="nowplay_list2" class="con2">
                <div class="tool">
                    <p style="margin-left: 30px;">현재 상영작 </p>
                    <label><input type ="button" id = "3" class="m_btn" onclick="golist(this.id)"><b><더보기></b></label>
                </div>
            </div>
        </div>
        <!-- 상영중 영화 컨텐츠 창 끝 -->
        
        <!-- 높은 평점 영화 컨텐츠 창 시작 -->
        <div id="top_list" class="con1">
            <div id="top_list2" class="con2">
                <div class="tool">
                    <p style="margin-left: 30px;">높은 평점영화</p>
                    <label><input type ="button" id = "4" class="m_btn" onclick="golist(this.id)"><b><더보기></b></label>
                </div> 
            </div>
        </div>
        <!-- 높은 평점 영화 컨텐츠 창 끝 -->

        
       
    </div>
    <!-- footer -->     
        <jsp:include page="/movie/footer.jsp" />
        <!-- footer -->  
    <!-- 메인페이지 끝 -->
<script>
	const IMGPATH = 'https://image.tmdb.org/t/p/w185';
	/* 인기영화 */
	const PUPURL ="https://api.themoviedb.org/3/movie/popular?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page=1";
	/* 상영예정영화 */
	const UPCOMURL ="https://api.themoviedb.org/3/movie/upcoming?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page=1";
	/* 상영중 영화 */
	const NOWURL ="https://api.themoviedb.org/3/movie/now_playing?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page=1";
	/* 높은 평점영화 */
	const TOPURL ="https://api.themoviedb.org/3/movie/top_rated?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page=1";
	const p = 1;//인기영화일떄 조건
	const m = 2;//상영예정영화일때
	const n = 3;//상영중영화일떄
	const t = 4;//높은평점일때
	
	getmovie(PUPURL,p);
	getmovie(UPCOMURL,m);
	getmovie(NOWURL,n);
	getmovie(TOPURL,t);

	
	function getmovie(url,word){
		$.ajax({
		    url: url, 
		    type: "GET",                             
		    dataType: "json" ,
			success:function(m_data) 
			{
				eachmovie(m_data.results,word);
			}
		});
	}
	function eachmovie(movies,word)
	{	
		let i=0;
		 movies.forEach((movie) => {
			 const movieEl = document.createElement("div");
		        movieEl.classList.add("m_c2");
		       	if(word == 1)
		       	{
		       		i++;
			       	if(i>4)
			       	{
			       		return false;
			       	}
			        tmp =  IMGPATH +movie.poster_path;
			        title = movie.title;
			        id=movie.id
			        overview = movie.overview;
			        movieEl.innerHTML =  "<img src="+tmp+"  alt="+id+"> <div class = 'm_c2_title'> <h3>"+title+"</h3></div> <div class='overview'><h4>"+title+"</h4>"+overview+"</div>";
			         $('#popular_movie2').append(movieEl);
		       	}
		       	else if(word ==2)
		       	{
		       		i++;
			       	if(i>8)
			       	{
			       		return false;
			       	}
			        tmp =  IMGPATH +movie.poster_path;
			        title = movie.title;
			        id=movie.id
			        movieEl.innerHTML =  "<img src="+tmp+"  alt="+id+"> <div class = 'm_c2_title'> <h3>"+title+"</h3></div> <div class='overview'><h4>"+title+"</h4>"+overview+"</div>";
			        $('#upcoming_list2').append(movieEl);
		       	}
		       	else if(word==3)
		       	{
		       		i++;
			       	if(i>8)
			       	{
			       		return false;
			       	}
			        tmp =  IMGPATH +movie.poster_path;
			        title = movie.title;
			        id=movie.id
			        movieEl.innerHTML =  "<img src="+tmp+"  alt="+id+"> <div class = 'm_c2_title'> <h3>"+title+"</h3></div> <div class='overview'><h4>"+title+"</h4>"+overview+"</div>";
			        $('#nowplay_list2').append(movieEl);
		       	}
		       	else if(word==4)
		       	{
		       		i++;
			       	if(i>8)
			       	{
			       		return false;
			       	}
			        tmp =  IMGPATH +movie.poster_path;
			        title = movie.title;
			        id=movie.id
			        movieEl.innerHTML =  "<img src="+tmp+"  alt="+id+"> <div class = 'm_c2_title'> <h3>"+title+"</h3></div> <div class='overview'><h4>"+title+"</h4>"+overview+"</div>";
			        $('#top_list2').append(movieEl);
		       	} 	
		    });	
	}
	$(document).on('click', '.m_c2', function(){
		const m_id = $(this).children().attr('alt');
		
		var form = document.m_fo;
		document.getElementById("m3").value = m_id;
		form.submit();
	})
	function golist(list_id)
	{
		var form1 = document.more;
		if(list_id==1)
		{
			document.getElementById("list1").value = "영화";
			form1.submit();
		}
		else if(list_id==2)
		{
			document.getElementById("list1").value = "개봉 예정작";
			form1.submit();
		}
		else if(list_id==3)
		{
			document.getElementById("list1").value = "현재 개봉작";
			form1.submit();
		}
		else if(list_id==4)
		{
			document.getElementById("list1").value = "높은 평점 영화";
			form1.submit();
		}
	}
</script> 

</body>
</html>
