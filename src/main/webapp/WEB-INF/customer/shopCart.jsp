<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>我的购物车</title>
<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/bootstrap.min.css">
<link rel="stylesheet" href="${rootPath}css/customer/public.css">
<link rel="stylesheet" type="text/css" href="${rootPath}css/customer/shopping.css">
<script type="text/javascript">
	function add(id) {		
		var Id="menu"+id;
		var num=parseInt(document.getElementById(Id).innerHTML);		
		var xmlhttp;
		if (window.XMLHttpRequest) {
			// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {		
				var result = xmlhttp.responseText;
				document.getElementById(Id).innerHTML=num+1;
				document.getElementById("total").innerHTML=result;				
			}
		}
		xmlhttp.open("POST", "cart_add", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		xmlhttp.send("id="+id);
		
	}
	
	function reduce(id) {
		var Id="menu"+id;
		var num=parseInt(document.getElementById(Id).innerHTML);	
		if(num>1){
			var xmlhttp;
			if (window.XMLHttpRequest) {
				// IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
				xmlhttp = new XMLHttpRequest();
			} else {
				// IE6, IE5 浏览器执行代码
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {				
					var result = xmlhttp.responseText;
					document.getElementById(Id).innerHTML=num-1;
					document.getElementById("total").innerHTML=result;					
				}
			}
			xmlhttp.open("POST", "cart_reduce", true);
			xmlhttp.setRequestHeader("Content-type",
					"application/x-www-form-urlencoded");
			xmlhttp.send("id="+id);
		}
	}
</script>
</head>
<body><!-- 头部 -->
  <header id="header" class="">
  <img src="${rootPath}images/left.png" alt="">
      我的购物车
  <img src="${rootPath}images/right.png" alt="">
  </header><!--  留白处 -->
   <div class="liubai">
   </div>
 <!-- 装用户添加的每一道菜    -->
 <c:if test="${!empty shopCarts }">
     <c:forEach items="${shopCarts}" var="s">
       <div class="food">
          <div class="left photo">
             <img src="${rootPath}images/xiang.jpg" alt="" width="100px" height="100px">
          </div>
          <div class="left infors">
              <p><b>${s.menuName}</b></p>
              <p class="left col"><b>价格：</b></p><p class="red size"><b>￥${s.price}</b></p>
              <div class="zu">
                 <div class="left kong">
                      <div class="left">
                       	<input type="button" value="-" onclick="reduce(${s.id})">
                      </div>  
                        <span id="menu${s.id}" >${s.menuNum}</span>                                   
                      <div class="right">    
                      	<input type="button" value="+" onclick="add(${s.id})">               
                      </div>
                  </div>
                 <div class="left delete">
                	<a href="${rootPath}customer/cart_deleteCart?id=${s.id}">删除</a>
                 </div>
              </div>
          </div>
      </div>
    </c:forEach>
	<div class="end">
		<div class="left">
			<p class="left" class="zongjia">
				<b>总价：</b>
			</p>
			<p class="left" calss="jiaqian">
				<b id="total">${total}</b>
			</p>
		</div>
		<div class="right">
			<a href="${rootPath}customer/cart_getHand"> <input type="button"
				name="" value="提交订单" class="right">
			</a>
		</div>
	</div>
	</c:if>
   <c:if test="${empty shopCarts }">
	<h1>你还没有点餐</h1>
	</c:if>
  <!--  留白处 -->
   <div class="liubai">
   </div>
   <!-- 公共底部 -->
    <footer>
       <a href="${rootPath}customer/customer_toIndex?id=${userId}">
      <div class="left">
        <div><img src="${rootPath}images/sy1.png" style="width:100%; height:100%; "></div>
        <p>首页</p>
      </div>
      </a>
      <a href="${rootPath}customer/getCart">
      <div class="left">
        <div><img src="${rootPath}images/gwc.png" style="width:100%; height:100%; "></div>
        <p>购物车</p>
      </div>
      </a>
      <a href="${rootPath}customer/cart_getOrderDetails">
      <div class="left dingdan">
        <div><img src="${rootPath}images/dd.png" style="width:70%; height:70%;"></div>
        <p>订单</p>
      </div>
      </a>
   </footer>
</body>
<script type="text/javascript">
</script>
</html>