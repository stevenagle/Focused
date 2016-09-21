<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${lastItem != null}">
<h2> ${lastItem} added to cart; </h2>
</c:if>
You have ${sessionScope.reviewer.points} points.

<c:forEach var="reward" items="${rewards}">
	<c:out value="${reward.name}"/> 
	<c:out value="${reward.cost}"/> 
	<c:out value="${reward.description}"/>
	<img src="${reward.photoUrl}"></img>
	<form action="addToCart.do" method="POST">
		<input type="hidden" name="rewardId" value="${reward.id}"/>
		<input type="submit" value="submit"/>
	</form>
</c:forEach>

<form action="showCart.do" method="POST">
<input type="submit" value="submit"/>

</form>
</body>
</html>