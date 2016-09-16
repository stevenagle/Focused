<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reviewer landing page</title>
</head>
<body>

<form action="UpdateReviewer.do" method="POST">
	<input type="hidden" name="id" value="${reviewer.id}">
	<input type="text" name="username" value="${reviewer.username}" required>
	<input type="password" name="password" value="${reviewer.password}" required>
	<input type="text" name="age" value="${reviewer.age}" required>
	<select name="gender">
 	 <option value="female">Female</option>
 	 <option value="male">Male</option>
 	 <option value="sjw">SJW</option>
	</select>
	<input type="reset" value="reset">
	<input type="submit" value="submit">
</form>

</body>
</html>