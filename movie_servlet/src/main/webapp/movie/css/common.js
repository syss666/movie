/**
 * 
 */
 
///total_page(총페이지 구하는것/searchpage용)
function total_page()
{
	const movie_name = document.getElementById("movie_name").value;
	console.log(movie_name);
	const SEARCHAPI ="https://api.themoviedb.org/3/search/movie?&api_key=04c35731a5ee918f014970082a0088b1&language=ko&query=";
	const url = SEARCHAPI+movie_name;
	console.log(url);
	$.ajax({
	    url: url, 
	    type: "GET",                             
	    dataType: "json" ,
		success:function(m_data) 
		{
			var form = document.t_form;
			let total_pages=m_data.total_pages;
			document.getElementById("t").value=total_pages;
			document.getElementById("m").value=movie_name;
			console.log(total_pages);		
			console.log(m_data);	
			form.submit();
			
		}
	});
}