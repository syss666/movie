<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <%@include file="/movie/link.jsp" %>
<style>

</style>
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
        
        <!-- 영화 컨텐츠 창 시작 -->
        
        <!-- 페이지 전달위한 폼 -->
        <form name = "p_form" method="get" action="/movie/content.jsp">
        	<input type="hidden" id="n_c" name="null_check" value="">
        	<input type="hidden" id="l" name = "list2" value="">
         	<input type="hidden" id="p" name="num" value="">
        	<input type="hidden" id= "b" name = "block_page" value= "">
    	</form>
		<%
			String list3 = (String)request.getParameter("list2");
			String number= (String)request.getParameter("num");
			int now_block=0;
		
			
			if(request.getParameter("null_check")!=null)
			{
				now_block =Integer.parseInt(request.getParameter("block_page"));
				number= (String)request.getParameter("num");	
			}
			
			int block_number=now_block*10;
			
		%>
		<style>
			.movie{
				overflow: hidden;
			}
			.m_c2_title{
				width: 100%;
			}
			.overview {
			   	padding:0px;
			    position: absolute;
			    max-height: 60%;
			    overflow: auto;
			    background-color: black;
			     background-color: rgba( 255, 255, 255, 0.7 );
			    flex-direction: column;
 			    width : 250px;
			    left: 0;
			    bottom: 0;
			    right: 0; 
			    display:flex;
			    transform: translateY(110%);
			    transition: transform 0.3s ease-in; 
				color:black;
			}
			.overview div{
				width: 100%;
				display: block;
			}
			.m_c2:hover .overview 
			{
			    transform: translateY(0);
			    top:100px;
			}
		</style>
        <div id="t_movie" class="title">
       
            <div class="movie">
                <div style="width: 100%;"> <h2 style="width: 100%; margin-left:10%; margin-bottom: 30px;" ><%=list3 %></h2></div>
                
            	<!-- m_c2 -->
            	<!-- 영화 사진 크기 -->
            </div>
         
            <!-- 페이징 시작-->
			<div style="width :900px;; height: auto; margin:0 auto; ">
				<ul id = "paging">
					<li class ="p_btn"><a href ="javascript:move_block('<%=now_block-1 %>')">이전</a></li>
					<%
					for(int i=1+block_number ; i<11+block_number; i++)
					{%>
						<li class ="p_btn"><a href ="javascript:paging('<%=i%>')"><%=i %></a></li>	
					<%
					}
					%>
					<li class ="p_btn"><a href ="javascript:move_block('<%=now_block+1 %>')">다음</a></li>		
				</ul>
			</div>
		<!-- 페이징 끝-->
        </div>

	<!-- item.jsp로 값넘기기 위한 폼 -->
	
		<form name = "m_fo" action="/movie/item.jsp" method="get">
			<input type = "hidden" id= "m" name = "m_id" value= " ">
		</form>
		
<script>
	let pagnumber="<%=number%>";
	
	const PUPURL ="https://api.themoviedb.org/3/movie/popular?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page="+pagnumber;
	/* 상영예정영화 */
	const UPCOMURL ="https://api.themoviedb.org/3/movie/upcoming?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page="+pagnumber;
	/* 상영중 영화 */
	const NOWURL ="https://api.themoviedb.org/3/movie/now_playing?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page="+pagnumber;
	/* 높은 평점영화 */
	const TOPURL ="https://api.themoviedb.org/3/movie/top_rated?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page="+pagnumber;

	const APIURL ="https://api.themoviedb.org/3/movie/popular?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&page="+pagnumber;
	const IMGPATH = 'https://image.tmdb.org/t/p/w185';
	const SEARCHAPI ="https://api.themoviedb.org/3/search/movie?&api_key=04c35731a5ee918f014970082a0088b1&query=";
	const list= "<%=list3%>";
	if(list==="영화")
	{
		getmovie(PUPURL);
	}
	else if(list==="개봉 예정작")
	{
		getmovie(UPCOMURL);
	}
	else if(list==="현재 개봉작")
	{
		getmovie(NOWURL);
	}
	else if(list==="높은 평점 영화")
	{
		getmovie(TOPURL);
	}
	else
	{
		getmovie(PUPURL);
	}
	function getmovie(url){
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
		        overview = movie.overview;
		        id=movie.id
		        movieEl.innerHTML =  "<img src="+tmp+"  alt="+id+"> <div class = 'm_c2_title'> <h3>"+title+"</h3></div> <div class='overview'><h4>"+title+"</h4>"+overview+"</div>";		      
		         $('.movie').append(movieEl);
		    });	
	}	
	$(document).on('click', '.m_c2', function(){
		const m_id = $(this).children().attr('alt');
		var form = document.m_fo;
		document.getElementById("m").value = m_id;
		form.submit();
	})
	function paging(num)
	{
		var form = document.p_form;
		document.getElementById("n_c").value = "a";
		document.getElementById("l").value = "<%=list3%>";
		document.getElementById("p").value = num;
		document.getElementById("b").value = "<%=now_block%>";
		form.submit();	
	}
	function move_block(b_num)
	{
		var form = document.p_form;
		if(b_num>-1 && b_num<50)
		{
			document.getElementById("n_c").value = "a";
			document.getElementById("l").value = "<%=list3%>";
			document.getElementById("p").value = b_num*10+1;
			document.getElementById("b").value = b_num;
			form.submit();
		}
	}

</script>
        <!-- 영화 컨텐츠 창 끝 -->
        <!-- footer -->
        <footer >

        </footer>
        <!-- footer end -->
    </div>
</body>
</html>