<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>二维码打印</title>
</head>
<body>
<div style="text-align:center;">
<img alt="" src="${rootPath}/OrderDetail_reWeiMa?menuId=${menuId}">
</div>
<script type="text/javascript">
	window.onload = function(){
		window.print();
		var t=setTimeout("window.close()",10)
	}
</script>
</body>
</html>