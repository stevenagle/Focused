<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review Products</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Bootstrap custom build changes -->
<link href="css/styles.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
	
<!-- <link href="css/starstyles.css" rel="stylesheet" type="text/css"> -->


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
                <h1 class="page-header">Rate Product: ${product.name}
                    <small>${reviewer.username}</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">Product Features</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <h3 class="panel-title">${product.name}</h3>
                    </div>
                    <div class="panel-body">
                    	<p>${product.description}</p>
                    </div>
                    <div class="panel-body">
                        <span class="price"><sup>$</sup>${product.price}<sup></sup></span>
                        <span class="period">price</span>
                    </div>
                    <ul class="list-group">
                    <form action="reviewProduct.do" method="POST">
                        <c:forEach var="feature" items="${product.features}">
                        <input type="hidden" name="features" value="${feature.id}"/>
                        	<span>
                        	<li class="list-group-item"><strong>Feature:  </strong>${feature.details} | ${feature.id}</li>
                        		
                        		<div name="ratings-${feature.id}"><span class="ratings">
    <input type="radio" class="rating"
        id="rating-input-1-5" name="rating-${feature.id}" value="1">
    <label for="rating-input-1-5" class="rating">1</label>
    <input type="radio" class="rating"
        id="rating-input-1-4" name="rating-${feature.id}" value="2">
    <label for="rating-input-1-4" class="rating">2</label>
    <input type="radio" class="rating"
        id="rating-input-1-3" name="rating-${feature.id}" value="3">
    <label for="rating-input-1-3" class="rating">3</label>
    <input type="radio" class="rating"
        id="rating-input-1-2" name="rating-${feature.id}" value="4">
    <label for="rating-input-1-2" class="rating">4</label>
    <input type="radio" class="rating"
        id="rating-input-1-1" name="rating-${feature.id}" value="5">
    <label for="rating-input-1-1" class="rating">5</label>
							</span></div>
                        
                        </c:forEach><hr>
                      <p>  	<input type="hidden" name="reviewerId" value="${reviewer.id}">
							<button type="submit" class="btn btn-primary" value="submit">Submit</button>
					</form>
					<form action="LoadRevProfile.do" method="POST">
					<input type="hidden" name="reviewerId" value="${reviewer.id}">
					<button type="submit" class="btn btn-primary" value="submit">Return to Profile</button>
					</form></p>
                        	</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4">
            	<div class="panel panel-default text-center">
            		<img class="img-responsive" src="${product.photoUrl}">
            	</div>
            </div>
        </div>
        <!-- /.row -->

</body>
</html>