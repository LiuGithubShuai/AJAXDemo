<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	
	<input type="text" id="username" />
	<span id="loading" style="display-none"><img src="/static/img/loading.gif" style="width:40px;height:40px" alt="" /></span>
	<span id="text"></span>
	
	<script src="/static/js/jquery-1.11.3.min.js" ></script>
	<script>
	
		$(function(){
			
			$(document).ajaxSend(function(){
				$("#loading").show();
			});
			$(document).ajaxComplete(function(){
				$("#loading").hide();
			});
			
			$("#username").blur(function(){
				
				var name = $(this).val();
				
				/* $.get("/ajax1",{"name":"ajax"},function(data){
					alert(data);
				}); */
				
				
				/* $.post("/ajax1",{"name":"ajax"}).done(function(data){
					$("#text").txet(data);
				}).error(function(){
					alert("服务器错误");
				}); */
				
				
				
				$.ajax(function(){
					url:"/ajax1",
					type:"post",
					data:{"name":name,"age":23},
					timeout:20*1000,
					beforeSend:function(){
						$("#loading").show();
						$("#text").text(""); //
					},
					success:function(data){
						$("#text").text(data);
					},
					error:function(){
						alert("服务器错误");
					},
					complete:function(){
						$("#loading").hide();
					}					
				});
				
				
				
				
				
				
				
				
			});
			
		});
	
	
	</script>
	
</body>
</html>