<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	
	<form action="/ajax1" enctype="application/x-www-form-urlencoded"></form>
	<input type="text" id="name" name="name"/>
	<button id="btn">sendRequest</button>
	<div id="result"></div>
	
	<script src="/static/js/jquery-1.11.3.min.js"></script>
	
	<script>
	$(function(){
		
		$("#btn").click(function(){
			var name = $("#name").val();
			$.ajax({
				url:"/ajax1",
				type:"post",
				data:"name="+name+"&_age=23",
				success:function(data){
					alert(data);
				},
				error:function(){
					alert("服务器错误");
				}
			});
			
			
		});
		
	});	
	
	</script>
	
</body>
</html>