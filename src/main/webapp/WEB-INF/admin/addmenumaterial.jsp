<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addmenumaterial.css">
<script language="javascript">
window.onload=function(){
	 var array = new Array();  
	 <c:forEach items="${allIngredient}" var="t">  
	 array.push("${t.id}"); //js中可以使用此标签，将EL表达式中的值push到数组中  
	 </c:forEach>
	 var a = array.length;
 	if(a==0){
		document.getElementById('div1').style.display='none';
	 	document.getElementById('div2').style.display='none';
 	}
  }
 </script> 
</head>
<body   style="background: url(${rootPath}/images/m-91.jpg);">
	<div style="margin-top:1%;">
		<div style="margin-left: 43%;margin-top:1%;">${addMaterialMsg}</div>
		<div style="margin-left:40%;margin-top:0%;"><button class="btn" onclick="window.location='${rootPath}manage/MenuMaterial_updateMenuMaterial?menuId=${menu.id}'">查看已添加配料</button></div>
	</div>
	 <div class="wall" id="div1">
        <table border="1" cellspacing="0">
			<tr>
				<th>配料名称</th>
				<th>类型</th>
				<th style="width:300px;">添加（kg）</th>
			</tr>
 			<c:forEach items="${allIngredient}" var="ingredient">
 				<tr>	 
 					<td>${ingredient.name}</td>
 					<td>${ingredient.type}</td>
 					<td>
 						<form action="${rootPath}manage/MenuMaterial_addMenuMaterial" method="post">
 							<input type="hidden" name="menuMaterial.menuId" value="${menu.id}">
 							<input type="hidden" name="menuMaterial.menuName" value="${menu.name}">
 							<input type="hidden" name="menuMaterial.ingId" value="${ingredient.id}">
 							<input type="hidden" name="menuMaterial.ingName" value="${ingredient.name}">
 							<input type="text" name="menuMaterial.num">
 							<input class="button" type="submit" value="添加">
 						</form>
 					</td>
 				</tr>
 			</c:forEach>
		</table>
	</div>
</body>
</html>