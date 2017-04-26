<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>

	<input type="text" id="keyword" />
	<button id="btn">查询</button>
	<p id="result"></p>
	
	<script>
	
		(function(){
			
			document.querySelector("#btn").onclick = function(){
				
				var keyword = document.querySelector("#keyword").value;
				var xmlHttp = new XMLHttpRequest();
				xmlHttp.open("get","/dict2?query="+keyword);
				
				xmlHttp.onreadystatechange = function(){
					
					if(xmlHttp.readyState == 4){
						if(xmlHttp.status == 200){
							
							var xmlDoc = xmlHttp.responseXML;
														
							var errorCode = xmlDoc.getElementsByTagName("errorCode")[0].childNodes[0].nodeValue;
							
							if(errorCode == 0){
								var ex = xmlDoc.getElementsByTagName("ex")[0].childNodes[0].nodeValue;
								document.querySelector("#result").innerText = ex;
							}else{
								alert("errorCode"+errorCode);
							}
						}else{
							alert("请求"+url+"错误"+xmlHttp.status);
						}
						
					}
				}
				
				xmlHttp.send();
			}
			
		})();
	
	
	</script>



</body>
</html>