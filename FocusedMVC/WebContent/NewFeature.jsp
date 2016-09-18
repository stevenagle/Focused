<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Feature</title>
</head>
<body>

<h1>Add new feature for ${product.name}:</h1>
<form action="NewFeature.do" method="POST">
	<textarea rows="4" cols="50" name="details" placeholder="details"></textarea>
	<input type="hidden" name="productId" value="${product.id}">
	<input type="reset" value="reset">
	<input type="submit" value="submit">
</form>


</body>
</html>