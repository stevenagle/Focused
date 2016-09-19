<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Feature Page</title>
</head>
<body>

<form action="UpdateFeature.do" method="POST">
	<input type="hidden" name="productId" value="${feature.product.id}">
	<input type="hidden" name="id" value="${feature.id}">
	<textarea rows="4" cols="50" name="details">${feature.details}</textarea>
	<input type="reset" value="reset">
	<input type="submit" value="submit">
</form>

</body>
</html>