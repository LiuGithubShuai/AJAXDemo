<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	
	<form action="" enctype="application/x-www-form-urlencoded"></form>
		<input type="text" id="name"/>
		<button id="btn">发送</button>
		<div id="result"></div>
	
	
	<script>
		(function(){
			
			function createXMLHttp(){
				var xmlHttp = null;
				if(window.ActiveXObject){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}else{
					xmlHttp = new XMLHttpRequest();
				}
				return xmlHttp;
			}
			
			document.querySelector("#btn").onclick = function(){
				document.querySelector("btn").submit();
	            var name = document.querySelector("#name").value;
	            //sendGet(name);
	            sendPost(name);
	        };
	        
	        function sendGet(name) {
	            //1. 获取Ajax引擎
	            var xmlHttp = createXMLHttp();
	            //2. 指定请求方式(GET|POST)和请求地址
	            //xmlHttp.open("get","/ajax?name="+name+"&_="+new Date().getTime());
	            xmlHttp.open("get","/ajax?name="+name);
	            //3. 发出请求
	            xmlHttp.send();
	        }
			
			function sendPost(name){
				//获取引擎
				var xmlHttp = createXMLHttp();
				//指定方法和地址
				xmlHttp.open("post","/ajax");
				xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
				//配置回调函数
				xmlHttp.onreadystatechange = function(){
					var state = xmlHttp.readyState;
					if(state == 4){
						var status1 = xmlHttp.status;
						
						if(status1 == 200){
							var result = xmlHttp.responseText;
							var div = document.querySelector("#result");
							if(result == "能用"){
								div.innerText = "可以使用";
							}else{
								div.innerText = "该账号已被注册";
							}
							
						}else{
							alert("服务器错误"+status);
						}
					}
				}
				
				
				//发送
				xmlHttp.send("name="+name+"&_age=23");
			}
			
			
		})();
	</script>
	
</body>
</html>