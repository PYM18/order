<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/manager/addingredient.css">
</head>
<body>
		${addIngerdientMsg}
		<div class="addingredient">
			<form action="Ingredient_addIngredient" method="post">
				<lable id="text">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：</lable>
				<input type="text" class="a1" name="ingredient.name"><br>
				<lable id="text">单价(元/kg)：</lable>
				<input type="text" class="a2" name="ingredient.price"><br>
				<lable id="text">库存量&nbsp;&thinsp;(kg)：</lable>
				<input type="text" class="a3" name="ingredient.num"><br>
				<lable id="text">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;&thinsp;型：</lable>
				<select name="ingredient.type">
					<option value="原料">原料</option>
					<option value="配料">配料</option>
				</select><br>
				<lable id="text">简介：</lable>
				<textarea rows="5" cols="35" name="ingredient.introduce"></textarea>
				<div class="button">
					<input type="submit" value="添加">
				</div>
			</form>
		</div>
</body>
</html>