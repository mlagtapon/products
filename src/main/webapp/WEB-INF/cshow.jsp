<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#main {
		margin-left: 2%;
	}
	#homelink {
		color: rgba(0,0,0,.5);
	}
	li {
		list-style: none;
	}
</style>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Categories</title>
</head>
<body>
	<div id="wrapper">
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
			<h1><c:out value="${aCat.name}"/>'s products:</h1> 
				<div id="left">
						<c:forEach items="${aCat.products}" var="pro">
							<ul>
								<li>
								<form action="/remcfrompro/${aCat.id}" method="post">
									<div class="card w-25">
									  <div class="card-body">
									    <h4 class="card-title"><c:out value="${pro.name}"/></h4>
									    <p class="card-text">
											Description: <c:out value="${pro.description}"/>
											<br> Price: <c:out value="${pro.price}"/><br>
									    </p>
										<input type="hidden" name="products" value="${pro.id}"/>
										<button type="submit" class="btn btn-primary">Remove</button>
									  </div>
									</div>
								</form>
								</li>
							</ul>
						</c:forEach>
				</div>
				<div id="right">
					<form action="/addctopro/${aCat.id}" method="post">
	    			<div class="p-3 form-group row form-inline">
	    				<label for="products" class="col-sm-1 col-form-label"> Add Product:</label>
	    				<div class="col-sm-1">
	    					<select name="products">
	    					
	    						<c:forEach items="${allpro}" var="p">
	    							<option value="${p.id}"><c:out value="${p.name}"/></option>
	    						</c:forEach>
	        				</select>
	        			</div>
	        		<div class="form-group row form-inline">
	    				<div class="done">
	    					<input class="btn btn-primary" type="submit" value="Add"/>
	    				</div>
	    			</div>
	    		</div>
				</form> 
		</div>
	</div>
	</div>
</body>
</html>