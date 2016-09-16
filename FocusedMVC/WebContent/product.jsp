<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${company.id}
<form action="NewProduct.do" method="POST">
	
	<input type="hidden" name="companyId" value="${company.id}">
	<input type="text" name="name" placeholder="name" required>
	<input type="text" name="price" placeholder="price" required>
	<input type="text" name="photoUrl" placeholder="photo url" required>
	<input type="text" name="description" placeholder="description" required>
	<input type="reset" value="reset">
	<input type="submit" value="submit">
</form>

</body>
</html>