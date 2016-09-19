<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Product Menu</title>
</head>
<body>

<table>
<th>Products:</th>
<c:forEach var="product" items="${products}">
    <tr>
    	<td>
   			 <c:out value="${product.name}"/>
   			  <c:forEach var="feature" items="${product.features}"> <br>
   			 	<c:out value="${feature.details}"/>
   			 </c:forEach>
    	</td>
    </tr>
</c:forEach>
</table>

</form>
</body>
</html>