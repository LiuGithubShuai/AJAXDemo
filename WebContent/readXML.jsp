<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>

	<input type="text" placeholder="RSS URL" id="url"/>
	<button id="btn">Load RSS</button>
	<ul id="newsList"></ul>

	<script src="/static/js/jquery-1.11.3.min.js"></script>
	
	<script>
		
		$(function(){
			
			$("#btn").click(function(){
				
				var rssurl = $("#url").val;
				$("#newsList").html("");
				
				$.ajax({
					url:"/Rss.xml",
					type:get,
					data:{"url":rssurl},
					success:function(xmlDoc){
						$(xmlDoc).find("item").each(function(){
							var title = $(this).find("title").text();
							var link = $(this).find("link").text();
							$("<li><a href='"+link+"'target='_blank'>"+title+"</a></li>").appendTo($("#newsList"));
						});						
					},
					error:function(){
						alert("服务器异常");
					}
					
				});
				
			});
			
			
			
		});
		
		
	</script>
	
</body>
</html>