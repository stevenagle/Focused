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

<h1>Company Name: ${company.name}</h1>
<br>
<h2>Company Description: ${company.description}</h2>


<table>
<th>Products:</th>
<c:forEach var="product" items="${company.products}">
    <tr>
    	<td>
    	<form action="ProductFeaturesMenu.do" method="POST">
   			 <c:out value="${product.name}"/> <input type="submit" name="id" value="${product.id}">
    	</form>
    	</td>
    </tr>
</c:forEach>
</table>


<!-- Update Company Button -->
<form action="UpdateCompanyMenu.do" method="POST">
<input type="hidden" name="id" value="${company.id}">
<input type="submit" value="Edit Company">
</form>
<br><br>
<!-- Add Product Button -->
<form action="NewProductMenu.do" method="POST">
<input type="hidden" name="id" value="${company.id}">
<input type="submit" value="Add Product">
</form>
<br><br>
<form action="Logout.do" method="GET">
<input type="submit" value="Log Out">
</form>
</body>
</html>