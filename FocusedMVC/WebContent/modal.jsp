<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#editProduct">
  Edit Product
</button>

<!-- Modal -->
<div class="modal fade" id="editProduct" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title" id="myModalLabel">Edit Product</h4>
      </div>
      <div class="modal-body">
        	<form action="UpdateProduct.do" method="POST">
			<input type="hidden" name="id" value="${product.id}">
			<input type="text" name="name" value="${product.name}" required>
			<input type="text" name="price" value="${product.price}" required>
			<input type="text" name="photoUrl" value="${product.photoUrl}" required>
			<textarea rows="4" cols="50" name="description">${product.description}</textarea>
			<input type="reset" value="reset">
			<input type="submit" value="submit">
			
			<%-- <%@include file="EditProduct.jsp" %> --%>
			
      <!-- <div class="modal-footer"> -->
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" >Save changes</button></form>
      </div>
      <!-- </div> -->
    </div>
  </div>
</div>
</body>
</html>