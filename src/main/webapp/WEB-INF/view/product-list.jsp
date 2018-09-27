<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="a/css/index2.css">
</head>
<body>
	<table border="1">
		<tr>
			<td>商品名称</td>
			<td>商品价格</td>
			<td>出厂时间</td>
			<td>商品描述</td>
			<td>商品分类</td>
			<td>操作&nbsp;<a href="getInsertForm.do" >添加</a></td>
		</tr>
		
		<c:forEach items="${products}" var="product">
			<tr>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td>${product.createtime}</td>
				<td>${product.detail}</td>
				<td>
					<c:forEach items="${product.categories}" var="c">
				     ${c.name}
				  </c:forEach>
				</td>
				
				<td><a href="deleteProduct.do?id=${product.id}">删除</a><a href="getUpdateForm.do?id=${product.id}">修改</a></td>
			<tr>
			
		</c:forEach>
	</table>
</body>
</html>