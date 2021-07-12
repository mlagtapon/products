<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#homelink {
		color: rgba(0,0,0,.5);
	}
	#main {
		margin-left: 2%;
	}
	#nostyle {
		list-style: none;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Categories and Products</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto d-flex justify-content-between">
	      <li class="nav-item">
	        <a class="nav-link" href="/categories/new">Create A Category</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="/products/new">Create A Product</a>
	      </li>
	    </ul>
		<div class="form-inline my-2 my-lg-0">
			<a class="nav-link" id="homelink" href="/">Home</a>
	    </div>
	  </div>
	</nav>
	<div id="main">
		<c:if test="${allcat != null}">
			<h1>All Categories:</h1>
		</c:if>
		<ul>
			<c:forEach items="${allcat}" var="one">
				<li id="nostyle">
				<div class="card w-25">
					<div class="card-body">
						<h4 class="card-title">
							<a href="categories/${one.id}">${one.name}</a>
						</h4>
					<ul>
						<c:forEach items="${one.products}" var="pro">
							<li>${pro.name}</li>
						</c:forEach>
					</ul>
					<br>
					</div>
				</div>
				</li>
				<br>
			</c:forEach>
		</ul>
			<c:if test="${allpro != null}">
				<h1>All Products:</h1>
			</c:if>
		<ul>
			<c:forEach items="${allpro}" var="one">
					<li id="nostyle">
					<div class="card w-25">
						<div class="card-body">
							<h4 class="card-title"><a href="/products/${one.id}"><c:out value="${one.name}"/></a></h4>
							<p class="card-text">
								<b>Description:</b> <c:out value="${one.description}"/>
								<br><b>Price:</b> <c:out value="${one.price}"/>
								<br><b>Categories:</b>
							</p>
							<ul>
								<c:forEach items="${one.categories}" var="cat">
									<li>${cat.name}</li>
								</c:forEach>
							</ul>
							<br>
						</div>
					</div>
					</li>
					<br>
			</c:forEach>
		</ul>
	</div>
</body>
</html>