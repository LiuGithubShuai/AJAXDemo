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
	<button id="btn">加载XML数据</button>
	<table class="table">
		<thead>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>address</th>
		</tr>			
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<script>
	
		/* out.print("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>");
		out.print("<users>");
		for(User us : userList){
			out.print("<user id=\""+us.getId()+"\">");
			out.print("<name>"+us.getUsername()+"</name>");
			out.print("<address>"+us.getAddress()+"</address>");
			out.print("</user>");
		}
		out.print("</users>");
		
		<tbody>
		
		</tbody>
		*/
		(function(){
			xmlHttp = new XMLHttpRequest();
			xmlHttp.open("get","/user.xml");
			
			xmlHttp.onreadystatechange = function(){
				if(xmlHttp.readyState == 4){
					if(xmlHttp.status == 200){
						var xmlDoc = xmlHttp.responseXML;
						var userElements = xmlDoc.getElementsByTagName("user");
						var tbody = document.querySelector("tbody");
						
						for(var i=0;i<userElements.length;i++){
							var userElement = userElements[i];
							
							var id = userElement.getAttribute("id");
							var name = userElement.getElementsByTagName("name")[0].childNodes[0].nodeValue;
							var address = userElement.getElementsByTagName("address")[0].childNodes[0].nodeValue;
							
							var tr = document.createElement("tr");
							var idTd = document.createElement("td");
							var nameTd = document.createElement("td");
							var addressTd = document.createElement("td");
							
							var idNode = document.createTextNode(id);
							var nameNode = document.createTextNode(name);
							var addressNode = document.createTextNode(address);
							
							idTd.appendChild(idNode);
							nameTd.appendChild(nameNode);
							addressTd.appendChild(addressNode);
							
							tr.appendChild(idTd);
							tr.appendChild(nameTd);
							tr.appendChild(addressTd);
							
							tbody.appendChild(tr);
						}
					}else{
						alert("服务器参数错误"+xmlHttp.status);
					}
				}
			}
			
			xmlHttp.send();
			
			
		})();				
	
	</script>
</body>
</html>