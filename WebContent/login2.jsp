<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
			
				<form action="" id="loginForm" method="post">
				
					<legend>用户登录</legend>
					<div class="form-group">
						<label>账号</label>
						<input type="text" name="username" id="username" class="form-control" />
					</div>
				
					<div class="form-group">
						<label>密码</label>
						<input type="password" name="password" id="password" class="form-control" />
					</div>
				
					<div class="form-group">
						<button type="button" id="loginBtn" class="btn btn-primary">登录</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="/static/js/jquery-1.11.3.min.js"></script>
	<script src="/static/js/jquery.validate.min.js"></script>
	
	<script>
	
	$(function(){
		
		$("#loginBtn").click(function(){
			$("#loginForm").submit();
		});
		
		
		$("#loginForm").validate({
			errorElement:"span",
			errorClass:"text-danger",			
			rules:{
				username:{
					required : true
				},
				password:{
					required:true
				}
			},
			messages:{
				username:{
					required:"请输入账号"
				},
				password:{
					required:"请输入密码"
				}
			},
			submitHandler:function(){
				$.ajax({
					
					url:"/login2",
					type:"post",
					data:$("#loginForm").serialize(),
					beforeSend:function(){
						$("#loginBtn").append($("<i class='fa fa-refresh fa-spin'></i>")).attr("disabled","disabled");
					},
					complete:function(){
						$("#loginBtn").html("登录").removeAttr("disabled");
					},
					success:function(data){
						if(data.status == "error"){
							alert(data.message);
						}else{
							window.location.href="demo1.jsp";
						}
					},
					error:function(){
						alert("服务器错误");
					}
				});
			}	
		});
		
		
	});
	
	</script>
	
	
</body>
</html>