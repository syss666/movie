<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
            <form id="form">
                <input
                    type="text"
                    id="search"
                    placeholder="Search"
                    class="search"
                />
            </form>
        </header>
        <main id="main"></main>
<script>
async function getmovie(url) {
    const resp = await fetch(url);
    const respData = await resp.json();

    console.log(respData);

    //moviedata(respData.results);
}


function movieread(url){
	$.ajax({
	    url: APIURL, 
	    type: "GET",                             
	    dataType: "json"                         
	})
	.sussece(function(data) {
		console.log(data);
		eachmovie(data.results);
	})
	.fail(function(xhr, status, errorThrown) {
	    $("#text").html("오류가 발생했습니다.<br>")
	    .append("오류명: " + errorThrown + "<br>")
	    .append("상태: " + status);
	})	
}
function eachmovie(movie)
{
	 movies.forEach((movie) => {
	        const { poster_path, title, vote_average, overview } = movie;

	        const movieEl = document.createElement("div");
	        movieEl.classList.add("movie");
			
	        movieEl.innerHTML = `
	            <img
	                src="${IMGPATH + poster_path}"
	                alt="${title}"
	            />
	        `;
	        div.appendChild(movieEl);
	    });
	
}

</script>

</body>
</html>