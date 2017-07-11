<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manageringredient.css">
     <link href="${rootPath}css/bootstrap.css" rel="stylesheet" />
</head>
<body>
<center>
${updateIngredientMsg}${deleteIngredientMsg}
<div class="manageringredient">
     <table cellspacing="0">
         <thead>
          <tr class="tr1">
             <td>名称</td>
             <td>单价</td> 
             <td>库存</td>
             <td>注册时间</td>
             <td>类型</td>
             <td>简介</td>
             <td>修改</td>
             <td>删除</td>
          </tr>   
         </thead>
         <tbody>
         <c:forEach items="${allIngredient.data}" var="ingredient">
			<tr>
				<td>${ingredient.name}</td>
				<td>${ingredient.price}</td>
				<td>${ingredient.num}</td>
				<td>${ingredient.createDate}</td>
				<td>${ingredient.type}</td>
				<td>${ingredient.introduce}</td>
				<td><a href="${rootPath}manage/Ingredient_toUpdateIngredient?ingredient.id=${ingredient.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
				<td><a href="${rootPath}manage/Ingredient_deleteIngredient?ingredient.id=${ingredient.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
			</tr> 
		</c:forEach>
         </tbody>
     </table>        
    </div>
    <div class="page">
    <ul class="pagination">
      <li><a href="${rootPath}manage/Ingredient?page=${allIngredient.prePage}">上一页</a></li>
		 		<c:forEach var="i" begin="${allIngredient.currentPage-3>0?allIngredient.currentPage-3:1 }" 
 					end="${allIngredient.currentPage+3>allIngredient.pageNum?allIngredient.pageNum:allIngredient.currentPage+3  }">
 					<c:choose>
 						<c:when test="${i>0 && i == allIngredient.currentPage &&i<=3}"> 
 							<li class="active"><a href="${rootPath }manage/Ingredient?page=${i }">${i}</a></li> 
						</c:when> 
 						<c:when test="${i>0 && i != allIngredient.currentPage &&i<=3}"> 
 							<li><a href="${rootPath }manage/Ingredient?page=${i }">${i}</a></li> 
						</c:when> 
 					</c:choose> 
 				</c:forEach>		
      <li><a href="${rootPath }manage/Ingredient?page=${allIngredient.nextPage}">下一页</a></li>
    </ul>
</div>
</center>
<%-- 	<center> --%>
<%-- 	共有数据${allIngredient.count}条 --%>
<%-- 	${updateIngredientMsg}${deleteIngredientMsg} --%>
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<td>名称</td> -->
<!-- 			<td>单价</td> -->
<!-- 			<td>库存</td> -->
<!-- 			<td>注册时间</td> -->
<!-- 			<td>简介</td> -->
<!-- 			<td>操作</td> -->
<!-- 		</tr> -->
<%-- 		<c:forEach items="${allIngredient.data}" var="ingredient"> --%>
<!-- 			<tr> -->
<%-- 				<td><input type="text" name="ingredient.name" value="${ingredient.name}" readonly="readonly"></td> --%>
<%-- 				<td><input type="text" name="ingredient.price" value="${ingredient.price}" readonly="readonly"></td> --%>
<%-- 				<td><input type="text" name="ingredient.num" value="${ingredient.num}" readonly="readonly"></td> --%>
<%-- 				<td><input type="text" name="ingredient.createDate" value="${ingredient.createDate}" readonly="readonly"></td>  --%>
<%-- 				<td><input type="text" name="ingredient.introduce" value="${ingredient.introduce}" readonly="readonly"></td> --%>
<%-- 				<td><a href="${rootPath}manage/Ingredient_toUpdateIngredient?ingredient.id=${ingredient.id}">修改</a></td> --%>
<%-- 				<td><a href="${rootPath}manage/Ingredient_deleteIngredient?ingredient.id=${ingredient.id}">删除</a></td> --%>
<!-- 			</tr>  -->
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
	
<%-- 		<a href="${rootPath }manage/Ingredient?page=${allIngredient.prePage}">上一页</a> --%>
		
<%-- 		<c:forEach var="i" begin="${allIngredient.currentPage-3>0?allIngredient.currentPage-3:1 }" --%>
<%-- 					end="${allIngredient.currentPage+3>allIngredient.pageNum?allIngredient.pageNum:allIngredient.currentPage+3  }"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${i>0 && i == allIngredient.currentPage }"> --%>
<%-- 							<li class="active"><a href="${rootPath }manage/Ingredient?page=${i }">${i}</a></li> --%>
<%-- 						</c:when> --%>
<%-- 						<c:when test="${i>0 && i != allIngredient.currentPage }"> --%>
<%-- 							<li><a href="${rootPath }manage/Ingredient?page=${i }">${i}</a></li> --%>
<%-- 						</c:when> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach> --%>
<%-- 			<a href="${rootPath }manage/Ingredient?page=${allIngredient.nextPage}">下一页</a> --%>
<%-- 	</center> --%>
</body>
</html>