<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Focused: Simplifying Focus Groups</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">
    
    <!-- Bootstrap custom build changes -->
    <link href="css/styles.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Company Dashboard</title>
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