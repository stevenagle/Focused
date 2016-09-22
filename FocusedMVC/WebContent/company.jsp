<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Company Dashboard</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap custom build changes -->
<link href="css/styles.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

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
					Company Dashboard <small>${company.name}</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.html">Home</a></li>
					<li><a href="Logout.do">Sign Out</a></li>
					<li class="active">${company.name}</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Intro Content -->
		<div class="row">
			<div class="col-md-6">
				<img class="img-responsive" src="${company.photoUrl}"
					alt="${company.name}">
			</div>
			<div class="col-md-6">
				<h2>${company.name}</h2>
				<p>${company.description}</p>
				<form action="UpdateCompanyMenu.do" method="POST">
					<input type="hidden" name="id" value="${sessionScope.company.id}">
					<button type="submit" class="btn btn-primary" >Edit Company</button>
				</form>
					<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addProduct">Add Product</button>
			</div>
		</div>
		<!-- /.row -->
	<br><hr><br>
		<!-- Team Members -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Your Products Being Reviewed:</h2>
			</div>
			<c:forEach var="product" items="${company.products}">
				<div class="col-md-4 text-center">
					<div class="thumbnail">
						<img class="img-responsive" src="${product.photoUrl}"
							alt="<c:out value="${product.name}"/>">
						<div class="caption">
							<h3>
								<c:out value="${product.name}"/>
								<br>
							</h3><small>Description:</small>
							<p>
								<c:out value="${product.description}"/>
							</p>
								<c:forEach var="review" items="${ReviewData}">
    								<c:if test="${review.itemId == product.id}">
    									Number of Ratings:
    			 						<p><c:out value="${review.ratingCount}"/></p>
    									Average Rating:
    			 						<p><c:out value="${review.averageRating}"/></p>
   									</c:if>
   								</c:forEach>
								<br>
							<ul class="list-inline">
								<li><form action="UpdateProductMenu.do" method="POST">
										<input type="hidden" name="id"
											value="<c:out value="${product.id}"/>"> 
										<input type="hidden" name="companyId" value="${company.id}">
											<button type="submit" class="btn btn-primary">Edit Product</button>
									</form>
								</li>
								<li><form action="ProductFeaturesMenu.do" method="POST">
										<input type="hidden" name="id"
											value="<c:out value="${product.id}"/>"> 
										<button type="submit" class="btn btn-primary">Edit Features</button>
									</form></li><hr>
								<li><form action="RemoveProduct.do" method="POST">
										<input type="hidden" name="id"
											value="<c:out value="${product.id}"/>"> 
										<input type="hidden" name="companyId" value="<c:out value="${company.id}"/>">
										<button type="submit" class="btn btn-primary">Remove Product</button>
									</form></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- /.row -->


		<hr>


		<!-- -- MODALSSSS -- -->
		
		<!-- -- New Product Modal -- -->

		<div class="modal fade" id="addProduct" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">Add Product</h4>
					</div>
					<form action="NewProduct.do" method="POST">
					<div class="modal-body">
						<div class="form-group">
							<label>Product Name:</label><br>
								<input type="hidden" name="companyId" value="${company.id}">
								<input type="text" class="form-control" name="name" placeholder="name" required>
						</div>
						<div class="form-group">
							<label>Product Price:</label><br>
							<input type="text" class="form-control" name="price" placeholder="price" required>
						</div>
						<div class="form-group">
							<label>Photo Url:</label><br>
							<input type="text" class="form-control" name="photoUrl" placeholder="photo url" required>
						</div>
						<div class="form-group">
							<label>Description:</label><br>
							<input type="text" class="form-control" name="description" placeholder="description" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Add Product</button>
					</div>
					</form>
				</div>
			</div>
		</div>
		


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
</html>