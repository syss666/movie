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
    		<input type="hidden" id= "t2" name = "total_pages" value= "">
    	</form>
		<%
			String list3 = (String)request.getParameter("list2");
			String number="";
			
			int block_number=0;
			int page_start=1;
			int page_end=11;
			int now_block=0;
			int total_pages=0;
			
			if(request.getParameter("null_check")!=null)
			{	
				total_pages=Integer.parseInt(request.getParameter("total_pages"));
				now_block =Integer.parseInt(request.getParameter("block_page"));
				number= (String)request.getParameter("num");	
				
				if((now_block+1)*10<total_pages)
				{
					block_number=now_block*10;
					page_start=block_number+1;
					page_end = block_number+11;
				}
				else
				{
					block_number=now_block*10;
					page_start=block_number+1;
					page_end = total_pages+1;
				}
			}
			
		%>
		<!-- 사이드바 -->
		<jsp:include page="/movie/sidebar.jsp" />
		<!-- 사이드바 -->
		
        <div id="t_movie" class="title">
       
            <div class="movie">
                <div style="width: 100%;"> <h1 style="width: 100%; margin-left:10%; margin-bottom: 30px;" ><%=list3 %></h1></div>
                
            	<!-- m_c2 -->
            	<!-- 영화 사진 크기 -->
            </div>
         
            <!-- 페이징 시작-->
			<div style="width :900px;; height: auto; margin:0 auto; ">
				<ul id = "paging">
					<li class ="p_btn"><a href ="javascript:move_block('<%=now_block-1 %>')">이전</a></li>
					<%
					for(int i=page_start ; i<page_end; i++)
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
			<input type = "hidden" id= "m1" name = "m_id" value= " ">
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
				let total_pages=m_data.total_pages;
				document.getElementById("t2").value = total_pages;
				console.log(m_data);
				console.log(total_pages);
				eachmovie(m_data.results);		
			}
		});
	}
	function eachmovie(movies)
	{	
		 movies.forEach((movie) => {
			 const movieEl = document.createElement("div");
		        movieEl.classList.add("m_c2");
		       	console.log(movie.indexof);
		        tmp =  IMGPATH +movie.poster_path;
		        title = movie.title;
		        overview = movie.overview;
		        id=movie.id
		        movieEl.innerHTML =  "<img src="+tmp+"  alt="+id+"> <h3>"+title+"</h3><div class='overview'><h4>"+title+"</h4>"+overview+"</div>";		      
		         $('.movie').append(movieEl);
		    });	
	}	
	$(document).on('click', '.m_c2', function(){
		const m_id = $(this).children().attr('alt');
		var form = document.m_fo;
		document.getElementById("m1").value = m_id;
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
		let maxpage=document.getElementById("t2").value 
		console.log(maxpage);
		if(b_num>-1 && b_num<maxpage)
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
        <jsp:include page="/movie/footer.jsp" />
        <!-- footer -->  
</div>
</body>
</html>