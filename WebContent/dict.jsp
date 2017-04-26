<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="/static/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
			
				<input type="text" id="keyword"/>
				<button id="btn">查询</button>
				<p id="result"></p>
			
			</div>
		</div>
	</div>
	
	
	<script>
	
		(function(){
			
			document.querySelector("#btn").onclick = function(){
				//创建http引擎
				var xmlHttp = new XMLHttpRequest();
				var keyword = document.querySelector("#keyword").value;
				//调用get方法
				xmlHttp.open("get","/dict?query="+keyword);
				//回调
				xmlHttp.onreadystatechange = function(){					
					if(xmlHttp.readyState == 4){
						if(xmlHttp.status == 200){
					
							var xmlDoc = xmlHttp.responseXML;
							var errorCode = xmlDoc.getElementsByTagName("errorCode")[0].childNodes[0].nodeValue;
							
							if(errorCode == 0){
								var ex = xmlDoc.getElementsByTagName("ex")[0].childNodes[0].nodeValue;
								document.querySelector("#result").innerText = ex;
							}else{
								alert("errorCode:"+errorCode);
							}
							
						}else{
							alert("服务器错误"+xmlHttp.Status);
						}
					
					}
				}
				//发送
				xmlHttp.send();
			}
			
		})();
	
	</script>
</body>
</html>