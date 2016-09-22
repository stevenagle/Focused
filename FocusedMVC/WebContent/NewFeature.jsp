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

<title>New Feature</title>

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
	</div>
	<!-- /.row -->


	<div class="container">
		<div class="control-group form-group">
		<h1>Add new feature for ${product.name}:</h1>
		<form action="NewFeature.do" method="POST">
			<div class="controls">
					<textarea class="form-control" rows="4" cols="50" name="details" placeholder="details"></textarea>
					<input type="hidden" name="productId" value="${product.id}">
					<button class="btn btn-primary" type="reset">Reset</button>
					<button class="btn btn-primary" type="submit">Submit</button>
					<hr>
					<form action="LoadCoProfile.do" method="POST">
					<button type="submit" class="btn btn-primary">Return to Profile</button>
					</form>
			</div>
		</form>
		</div>
	
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Pat Gaston, Elijah Ginter, Steve Nagle 2016</p>
			</div>
		</div>
		</footer>

	</div>

</body>
</html>