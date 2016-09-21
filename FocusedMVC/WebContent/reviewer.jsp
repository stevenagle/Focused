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
Username: ${sessionScope.reviewer.username} <br>
Password: ${sessionScope.reviewer.password} <br>
Age: ${sessionScope.reviewer.age} <br> 
Gender: ${sessionScope.reviewer.gender} <br>
Review Points: ${sessionScope.reviewer.points}<br>
Authenticated?: ${sessionScope.authenticated}<br>


<table>
<th>Product:</th>
<th>Feature:</th>
<th>Your rating:</th>
<th>Details:</th>
<c:forEach var="review" items="${sessionScope.reviewer.featureReviews}">
    <tr>
    	<td>
    <c:out value="${review.feature.product.name}"/> <br/>
    	</td>
    	<td>
    <c:out value="${review.feature.details}"/> 
    	</td>
    	<td>
    <c:out value="${review.rating}"/> 
    	</td>
    	<td>
    <c:out value="${review.comment}"/> 
    	</td>
    </tr>
</c:forEach>
</table>


<form action="RewardsList.do" method="POST">
<input type="hidden" name="id" value="${sessionScope.reviewer.id}">
<input type="submit" value="Redeem Points">
</form>
<br><br>
<form action="UpdateReviewerMenu.do" method="POST">
<input type="hidden" name="id" value="${sessionScope.reviewer.id}">
<input type="submit" value="Edit Reviewer">
</form>
<br><br>
<form action="ReviewProductMenu.do" method="POST">
<input type="hidden" name="reviewerId" value="${sessionScope.reviewer.id}">
<input type="submit" value="Rate More Products">
</form>
<br><br>
<form action="Logout.do" method="GET">
<input type="submit" value="Log Out">
</form>
</body>
</html>