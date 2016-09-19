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
<form action="" method="">
<c:forEach var="product" items="${products}">
    <tr width="2px">
    	<td>
   			 <c:out value="${product.name}"/>
   			  <c:forEach var="feature" items="${product.features}"> <br>
   			 	<c:out value="${feature.details}"/>
    	 	<select id="mySelect" onchange="myFunction()">
    	 		<option name="rating" value="1">1</option>
  				<option name="rating" value="2">2</option>
  				<option name="rating" value="3">3</option>
  				<option name="rating" value="4">4</option>
  				<option name="rating" value="5">5</option>
    	 	</select>
    	 	
    	 	<input type="Submit" value="Submit Ratings">
   			 </c:forEach>
    	</td>
    </tr>
</c:forEach>
</table>
</form>




</form>
</body>
</html>