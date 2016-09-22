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

<title>Rewards</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap custom build changes -->
<!-- <link href="css/styles.css" rel="stylesheet"> -->

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
				<h1 class="page-header">
					Rewards
					<h1>
						<small>Your points:</small> ${sessionScope.reviewer.points}
						<form action="showCart.do" method="POST">
							<button type="submit" class="btn btn-primary fa fa-shopping-cart"><span class="badge">${cartsize}</span></button>
						</form>
					</h1>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
				</ol>
			</div>
		</div>
		<!-- /.row -->


		<!-- Project One -->
		<c:forEach var="reward" items="${rewards}">
			<div class="row">
				<div class="col-md-7">
					<img class="img-responsive" src="${reward.photoUrl}"
						alt="${reward.name}">
				</div>
				<div class="col-md-5">
					<h3>${reward.name}</h3>
					<h4>Cost: ${reward.cost} points</h4>
					<p>${reward.description}</p>
					<form action="addToCart.do" method="POST">
						<input type="hidden" name="rewardId" value="${reward.id}" /> 
						<a href="#stayItem" name="stayItem" ><button type="submit" class="btn btn-primary">Add to Cart</button></a>
					</form>
				</div>
			</div>
			<!-- /.row -->

			<hr>
		</c:forEach>
		
		<div class="modal-footer">
		<form action="showCart.do" method="POST">
			<button class="btn btn-primary" type="submit">View Cart</button>
		</form>
		<hr>
		</div>
		
		
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
