<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
	<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<form action="" id="forma" method="post">
				
					<legend>登录系统</legend>
					<div class="form-group">
						<label>账号</label>
						<input type="text" name="username" id="username" class="form-control"/>
					</div>
					<div class="form-group">
						<label>密码</label>
						<input type="password" name="password" id="password" class="form-control"/>
					</div>
					<div class="form-group">
						<button id="btn" class="btn btn-primary">登录</button>
					</div>
				
				</form>
			</div>
		</div>
	</div>
	
	<script src="/static/js/jquery-1.11.3.min.js"></script>
	<script src="/static/js/jquery.validate.min.js"></script>
	
	
	<script>
	
		$(function(){
			
			$("#btn").click(function(){
				$("#forma").submit();	
			});
			
			
			$("#forma").validate({
				errorElement:"span",
				errorClass:"text-danger",
				rules:{
					username:{
						required:true
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
						url:"/login",
						type:"post",
						data:$("#forma").serialize(),
						beforeSend:function(){
							$("#btn").append($("<i class='fa fa-spnner fa-spin'></i>")).attr("disabled","disabled");
						},
						complete:function(){
							$("#btn").html("登录").removeAttr("disabled");
						},
						success:function(data){
							if(data.status == "error"){
								alert(data.message);
							}else{
								window.location.href="/jq/demo.jsp";
							}
						},
						error:function(){
							alert("服务器错误");
						},
						
					});
				}
			});
			
			
			
			/* $("#btn").click(function(){
				var username = $("#username").val();
				var password = $("#password").val();
				
				$.post("/login",$("#btn").serialize().done(funtion(){
					if(status == "error"){
						alert(data.message);
					}else{
						window.location.href="/jp/demo.jsp";
					}
				}).error(function(){
					alert("服务异常");
				}));
			}); */
			
		});
	
	</script>
</body>
</html>