<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Product Page</title>
</head>
<body>

<form action="UpdateProduct.do" method="POST">
	<input type="hidden" name="id" value="${product.id}">
	<input type="text" name="name" value="${product.name}" required>
	<input type="text" name="price" value="${product.price}" required>
	<input type="text" name="photoUrl" value="${product.photoUrl}" required>
	<textarea rows="4" cols="50" name="description">${product.description}</textarea>
	<input type="reset" value="reset">
	<input type="submit" value="submit">
</form>

</body>
</html>