<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	 function p() {
		 window.print();
		 window.location.href="${rootPath}manage/OrderAction?sort=cashier";
	} 
</script>
</head>
<body onload="p()"   style="background: url(${rootPath}/images/m-91.jpg);">
<center>
<h3>${restlist.name}</h3><br>
**********************************<br>
收银票据<br>
**********************************<br>
</center>
	<table align="center">
	      <tr>
             <td>菜品名称</td>
             <td>数量</td>
             <td>单价(元)</td>        
           </tr>
           <c:forEach items="${orderlist}" var="item">  
	            <tr>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.price}</td>
	            </tr>  
        	</c:forEach>
	</table>	
	<center>
	**********************************<br>
	<table>
		<tr>
			<td>合计：</td>
			<td>${order.total }元</td>
		</tr>
		<tr>
			<td>打折：</td>
			<td>${discount}</td>
		</tr>
		<tr>
			<td>直减：</td>
			<td>${straightCut}元</td>
		</tr>
		<tr>
			<td>应收：</td>
			<td>${order.price}元</td>
		</tr>
		<tr>
			<td>实收：</td>
			<td>${pay}元</td>
		</tr>
		<tr>
			<td>找零：</td>
			<td>${returnPay}元</td>
		</tr>
	</table>
	收银员：${cashier.name}<br>
	**********************************<br>
	${restlist.name}  欢迎您下次光临<br>
	地址：${restlist.address}<br>
	电话：${restlist.phone}
	</center>
	</body>
</html>