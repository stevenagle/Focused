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
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

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
				<!-- <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Sign In<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="CompanyLogin.html">Company</a>
                            </li>
                            <li>
                                <a href="ReviewerLogin.html">Reviewer</a>
                            </li>
                        </ul>
                    </li> -->
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
				<img class="img-responsive" src="img/blank-profile.png"
					alt="${company.name}">
			</div>
			<div class="col-md-6">
				<h2>${company.name}</h2>
				<p>${company.description}</p>

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
						<img class="img-responsive" src="img/blank-profile.png"
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
											<input type="submit" value="Edit Product">
									</form></li>
								<li><form action="ProductFeaturesMenu.do" method="POST">
										<input type="hidden" name="id"
											value="<c:out value="${product.id}"/>"> 
										<input type="submit" value="Edit Features">
									</form></li><hr>
								<li><form action="RemoveProduct.do" method="POST">
										<input type="hidden" name="id"
											value="<c:out value="${product.id}"/>"> 
										<input type="submit" value="Remove Product">
									</form></li>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
		<!-- /.row -->


		<hr>

<table>
<th>Products:</th>
<c:forEach var="product" items="${company.products}">
    <tr>
    	<td>
    	<form action="ProductFeaturesMenu.do" method="POST">
   				 <c:out value="${product.name}"/> <input type="submit" name="id" value="${product.id}">
    		<c:forEach var="review" items="${ReviewData}">
    			<c:if test="${review.itemId == product.id}">
    			Number of Ratings:
    			 <c:out value="${review.ratingCount}"/>
    			Average Rating:
    			 <c:out value="${review.averageRating}"/>
   				</c:if>
   			 </c:forEach>
    	</form>
    	</td>
    </tr>
</c:forEach>
</table>


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


	<%-- <!-- Update Company Button -->
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
</form> --%>
</body>
</html>
</html>