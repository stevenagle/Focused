<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Update Product</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap custom build changes -->
<link href="css/styles.css" rel="stylesheet" type="text/css">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">



</head>
<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.html">Focused</a>

		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"></li>
				<li><a href="services.html">Services</a></li>
				<li><a href="about.html">About</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>



<!-- Page Content -->
	<div class="container">


<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Edit Features <small>${company.name}</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="Logout.do">Sign Out</a></li>
					<li class="active">${company.name}</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

<div class="container">
<h1>${product.name}</h1>
<br>
<img class="img-responsive" src="${product.photoUrl}"/>
<h2>${product.description}</h2>
<br><br><br>

</div>



<div class="container">
<table class="table">
<th>Features List:</th>
<c:forEach var="feature" items="${product.features}">
    <tr>
    	<td>
    	    <form action="UpdateFeatureMenu.do" method="POST">
   			 <input type="hidden" name="productId" value="${product.id}">
   			 <input type="hidden" name="id" value="${feature.id}">
   			<h4> <c:out value="${feature.details}"/> </h4>
   		</td>
   		<td>
   			 <button class="btn btn-primary"  type="submit">Edit</button>
    		</form>
    	</td>
    	<td>
    	    <form action="RemoveFeature.do" method="POST">
    	     <input type="hidden" name="productId" value="${product.id}">
   			 <input type="hidden" name="id" value="${feature.id}">
   			 <button class="btn btn-danger" type="submit">Remove Feature</button>
    		</form>
    	</td>
    </tr>
</c:forEach>
<tr>
<td>
	<!-- Add Feature Button -->
	<form action="NewFeatureMenu.do" method="POST">
	<input type="hidden" name="productId" value="${product.id}">
	<button type="submit" class="btn btn-primary" >Add Feature</button>
	</form>
</td>
</tr>
</table>




		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Steve Nagle, Elijah Ginter, Pat Gaston 2016</p>
			</div>
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>




</body>
</html>