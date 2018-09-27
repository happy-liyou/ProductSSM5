<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="a/css/index2.css">
<script type="text/javascript" src="a/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="a/My97DatePicker/skin/datePicker.css">
</head>
<body>
	<form action="updateProduct.do" method="post">
		<table>
			<tr>
				<td>商品名称</td>
				<td><input type="text" name="name" value="${product.name}"></td>
			</tr>
			<tr>
				<td>商品价格</td>
				<td><input type="text" name="price" value="${product.price}"></td>
			</tr>
			<tr>
				<td>入库时间</td>
				<td><input type="text" name="createtime" value="${product.createtime}" onclick="WdatePicker()"></td>
			</tr>
			<tr>
				<td>商品描述</td>
				<td><input type="text" name="detail" value="${product.detail}"></td>
			</tr>
			<tr>
				<td>商品分类</td>
				<td>
					<c:forEach items="${categories}" var="ac">
						<c:set var="checked" value=""></c:set>
						<c:forEach items="${product.categories}" var="c">
							<c:if test="${ac.id==c.id}">
								<c:set var="checked" value="checked"></c:set>
							</c:if>
						</c:forEach>
						<input type="checkbox" name="cids" value="${ac.id}" ${checked}/>${ac.name}
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="id"value="${product.id}" style="display:none"></td>
				<td><input type="submit" value="提交"></td>
			</tr>
		</table>
	</form>
</body>
</html>