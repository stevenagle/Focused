<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Shopping Cart</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- Nav bar style -->	
<link href="css/shoppingnav.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
					
					<li><a href="reviewer.jsp">${reviewer.username }</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="about.html">About Us</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Your Cart</h1>
				

				
				<ol class="breadcrumb">
					<li><a href="reviewer.jsp"">Home</a></li>
					<li class="active">Review Your Order</li>
				</ol>
				<div class="well">
						<div class="input-group">
							<h4>Check Out</h4> Your Total: ${total} points
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button"><i class="fa fa-tags"></i></button>
							</span>
						</div>
					</div>
			</div>
		</div>
		<!-- /.row -->

		<div class="row">



			<!-- Items Start -->
			<c:forEach var="item" items="${cart}">
				<div class="col-md-6">
					<p class="lead"> <h2>${item.name}</h2>  ${item.cost} points</p>
					<hr>
					<p>${item.description}</p>
					
					<form action="removeFromCart.do" method="POST">
						<input type="hidden" name="rewardId" value="${item.id}"/>
						<button class="btn btn-primary" type="submit">Delete Item<i class="fa fa-eraser"></i></button>
					</form>
					<hr>
				</div>
			</c:forEach>
			
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Elijah Ginter, Steve Nagle, Pat Gaston 2016</p>
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
