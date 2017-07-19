<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="${rootPath}css/manager/orderdetail.css">
    <link rel="stylesheet" type="text/css" href="${rootPath}css/bootstrap.css">
<script language="javascript">
	window.onload=function(){
		 var array = new Array();  
		 <c:forEach items="${detailspc.data}" var="t">  
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
<center>${markinfo}</center>
<div class="orderdetailes" id="div1">
       <table  cellspacing="0">
         <thead>
          <tr>
             <td colspan="12">订单详细信息</td>
          </tr>   
         </thead>
         <tbody>
          <tr>
             <td>餐桌编号</td>
             <td>餐桌名称</td>
             <td>订单id</td>
             <td>菜品id</td>
             <td>菜品名称</td>
             <td>数量</td>
             <td>单价(元)</td>
             <td>菜品状态</td>
             <td>订单时间</td>
             <td>厨师id</td>
             <td>厨师姓名</td>         
<!--              <td>操作</td> -->
           </tr>
                  	 <c:forEach items="${detailspc.data}" var="item">  
	            <tr>
	                <td>${item.tableId}</td>
	                <td>${item.tableName}</td>
	                <td>${item.orderId}</td>
	                <td>${item.menuId}</td>
	                <td>${item.menuName}</td>
	                <td>${item.menuNum}</td>
	                <td>${item.price}</td>
	                <td>${item.status}</td>
	                <td>${item.creatDate}</td>	     
	                <td>${item.cookId}</td>
	                <td>${item.cookName}</td>
<%-- 	                <td  class="four"><a href="${rootPath}manage/OrderDetailsAction_toUpdate()?detailid=${item.id}"><span class="glyphicon glyphicon-pencil"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${rootPath}manage/OrderDetailsAction_Delet()?detailid=${item.id}"><span class="glyphicon glyphicon-trash"></span></a></td>       --%>
	            </tr>  
        	</c:forEach>          
         </tbody>
     </table>      
    </div>
  <center>  <div class="page" id="div2">
<ul class="pagination">
  <li><a href="${rootPath}manage/OrderDetailsAction?page=${detailspc.prePage}">上一页</a></li>
  		<c:forEach var="i" begin="${detailspc.currentPage-3>0?detailspc.currentPage-3:1 }"
 					end="${detailspc.currentPage+3>detailspc.pageNum?detailspc.pageNum:allIngredient.currentPage+3  }">

 							<c:choose> 
 								<c:when test="${i>0 && i == detailspc.currentPage &&i<=3}">
 									<li class="active"><a 
 										href="${rootPath}manage/OrderDetailsAction?page=${i}">${i}</a></li> 
 								</c:when> 

 								<c:when test="${i>0 && i != postPS.currentPage &&i<=3}"> 
 									<li><a href="${rootPath}manage/OrderDetailsAction?page=${i }">${i}</a></li> 
 								</c:when> 
 							</c:choose>
 						</c:forEach> 
 						<li><a 
 							href="${rootPath}manage/OrderDetailsAction?page=${detailspc.nextPage}">下一页</a></li> 
</ul>
 </div>
 </center>    
</body>
</html>