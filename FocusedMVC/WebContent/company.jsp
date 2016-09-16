<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Company landing page</title>
</head>
<body>
${company}
<%-- ${company.description} --%>
${company.username}
${company.password}

<table>
<th>Products</th>
	<tr>
		<td>${product.name}</td>
		<td>Product 2</td>
		<td>Product 3</td>
	</tr>
</table>


<!-- Update Company Button -->
<form action="UpdateCompanyMenu.do" method="POST">
<input type="hidden" name="id" value="${company.id}">
<input type="submit" value="Edit Company">
</form>

<!-- Add Product Button -->
<form action="NewProductMenu.do" method="POST">
<input type="hidden" name="id" value="${company.id}">
<input type="submit" value="Add Product">
</form>
</body>
</html>