<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script language="javascript" type="text/javascript" src="/movie/css/common.js"></script> 
 
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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
	String genre="";
	if(request.getParameter("genre")!=null)
	{	
		String[] gen = request.getParameterValues("genre");
		int len = gen.length;
		genre = String.join(",", gen);
		System.out.println(genre);
		
	}
	%>
	
    <%
	String number= (String)request.getParameter("num");
	int now_block=0;
	int total_pages=0;
	int block_number=0;
	int page_start=1;
	int page_end=11;
	if(request.getParameter("null_check")!=null)
	{	
		total_pages=Integer.parseInt(request.getParameter("total_pages"));
		now_block =Integer.parseInt(request.getParameter("block_page"));
		number= (String)request.getParameter("num");	
		genre=(String)request.getParameter("list2");

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
    
    <script>
   
    </script>
	<!-- 페이지 전달위한 폼 -->
        <form name = "p_form" method="get" action="/movie/genre.jsp">
        	<input type="hidden" id="n_c" name="null_check" value="">
        	<input type="hidden" id="l" name = "list2" value="">
         	<input type="hidden" id="p" name="num" value="">
        	<input type="hidden" id= "b" name = "block_page" value= "">
        	<input type="hidden" id= "t" name = "total_pages" value= "">
    	</form>
    	
    <div class="movie">
    	<div style="width: 100%; margin-bottom: 30px;"> <h3 style="width: 100%; margin-left:10%" >장르 검색</h3></div>
    	<!-- 검색 초기 화면(null일때) -->
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
	<form name = "m_fo" action="/movie/item.jsp" method="get">
			<input type = "hidden" id= "m" name = "m_id" value= " ">
	</form>
	<!-- ----------------------------------------------------------------------------------- -->
	
<script>
	let pagnumber="<%=number%>";
	const IMGPATH = 'https://image.tmdb.org/t/p/w185';
	const GENREURL="https://api.themoviedb.org/3/discover/movie?api_key=d33ccc9950f589a6d0b4d5c2f8f63e31&language=ko&sort_by=popularity.desc&with_genres=";
	const pageURL = "&page="+pagnumber;
	const URL = GENREURL+"<%=genre%>"+pageURL;
	console.log(URL);
	getmovie(URL);
	 function getmovie(url)
		{
			$.ajax({
			    url: url, 
			    type: "GET",                             
			    dataType: "json" ,
				success:function(m_data) 
				{
					let total_page=m_data.total_pages;
					document.getElementById("t").value = total_page;
		
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
		$(document).on('click', '.m_c2', function()
		{
			const m_id = $(this).children().attr('alt');
			var form = document.m_fo;
			document.getElementById("m").value = m_id;
			form.submit();
		})
		function paging(num)
		{
			var form = document.p_form;
			document.getElementById("n_c").value = "a";
			document.getElementById("l").value = "<%=genre%>";
			document.getElementById("p").value = num;
			document.getElementById("b").value = "<%=now_block%>";
			form.submit();	
		}
	function move_block(b_num)
	{
		var form = document.p_form;
		let maxpage=document.getElementById("t").value 
		console.log(maxpage);
		if(b_num>-1 && b_num<maxpage)
		{
			document.getElementById("n_c").value = "a";
			document.getElementById("l").value = "<%=genre%>"; 
			document.getElementById("p").value = b_num*10+1;
			document.getElementById("b").value = b_num;
			form.submit();
		}
	}
</script>
	
	<!-- 검색창 끝 -->
	
	<footer>

    </footer>
	</div>	
</body>
</html>