<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Reviewer Dashboard</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap custom build changes -->
<link href="css/styles.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<li><a href="services.html">Services</a></li>
				<li><a href="about.html">About Us</a></li>
				<li><a href="Logout.do">Sign Out</a></li>
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
					Your Profile: <small>${sessionScope.reviewer.username}</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="reviewer.jsp">Home</a></li>
					<li><a href="Logout.do">Sign Out</a></li>
					<li class="active">${sessionScope.reviewer.username}</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Intro Content -->
		<div class="row">
			<div class="col-md-6">
				<img class="img-responsive" src="${sessionScope.reviewer.photoUrl}"
					alt="${sessionScope.reviewer.username}">
			</div>
			<div class="col-md-6">
				<h2>${sessionScope.reviewer.username}</h2>
				<p>Gender: ${sessionScope.reviewer.gender}</p>
				<p>Age: ${sessionScope.reviewer.age}</p>
				<br><p>Reviewer Points: ${sessionScope.reviewer.points}</p>
				<form action="RewardsList.do" method="POST">
					<input type="hidden" name="id" value="${sessionScope.reviewer.id}">
					<button type="submit" class="btn btn-primary">Redeem Reviewer Points</button>
				</form><br>
				<form action="UpdateReviewerMenu.do" method="POST">
					<input type="hidden" name="id" value="${sessionScope.reviewer.id}">
					<button type="submit" class="btn btn-primary">Edit Reviewer</button>
				</form><br>

                   <a href="#rateMore"><button type="submit" class="btn btn-primary">Rate More Products</button></a>

			</div>
		</div>
		<!-- /.row -->
	<br><hr><br>
		
		<!-- Related Projects Row -->
   <div id="rateMore"  class="row">
            <div class="col-lg-12">
                <h3 class="page-header">Products Awaiting Your Review</h3>
            </div>

			<c:forEach var="product" items="${unratedProducts}">
            <div class="col-sm-3 col-xs-6">
                <div class="revprodlist">
                	<form action="SingleProductReview.do" method="POST">
                	<input type="hidden" name="productId" value="${product.id}">
                    <input type="image" class="img-responsive" src="${product.photoUrl}" alt="Submit Form" />
                    </form>
                    <%-- <img class="img-responsive img-hover img-related" src="${product.photoUrl}" alt="${product.name}"> --%>
                </div>
            </div>
	</c:forEach>
        </div>
        <!-- /.row -->


		<hr>
		
		<!-- Team Members -->
		
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Your Past Reviews:</h2>
			</div>
			<c:forEach var="product" items="${ratedProducts}">
				<div class="col-md-4 text-center">
					<div class="thumbnail">
						<img class="img-responsive" src="${product.photoUrl}"
							alt="<c:out value="${product.name}"/>">
						<div class="caption">
							<h3>
								<c:out value="${product.company.name}"/>
								<br>
							</h3><small>Product:</small>
							<p>
								<c:out value="${product.name}"/>
							</p><br>
								<br>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- /.row -->
		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Steve Nagle, Elijah Ginter, Pat Gaston</p>
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