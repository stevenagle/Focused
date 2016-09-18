<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Features Menu</title>
</head>
<body>

<h1>Product Name: ${product.name}</h1>
<br>
<h2>Product Description: ${product.description}</h2>


<table>
<th>Features:</th>
<c:forEach var="feature" items="${product.features}">
    <tr>
    	<td>
    <c:out value="${feature.details}"/> 
    	</td>
    </tr>
</c:forEach>
</table>


<!-- Update Product Button -->
<form action="UpdateProductMenu.do" method="POST">
<input type="hidden" name="id" value="${product.id}">
<input type="submit" value="Edit Product">
</form>

<!-- Add Feature Button -->
<form action="NewFeatureMenu.do" method="POST">
<input type="hidden" name="productId" value="${product.id}">
<input type="submit" value="Add Feature">
</form>

<!-- Remove Product Button -->
<form action="RemoveProduct.do" method="POST">
<input type="hidden" name="id" value="${product.id}">
<input type="hidden" name="companyId" value="${product.company.id}">
<input style="color:red" type="submit" value="Remove Product">
</form>
</body>
</html>