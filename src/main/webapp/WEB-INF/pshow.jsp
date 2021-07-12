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
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Products</title>
<style>

</style>
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
			<h1><c:out value="${aPro.name}"/>'s categories:</h1>
			<div id="left">
					<c:forEach items="${aPro.categories}" var="cat">
						<ul>
							<li>
							
							<form action="/rempfromcat/${aPro.id}" method="post">
								<c:out value="${cat.name}"/>
								<input type="hidden" name="categories" value="${cat.id}"/>
								<button type="submit" class="btn btn-primary ml-1">Remove</button>
							</form>
							
							</li>
						</ul>
					</c:forEach>
			</div>
			<div id="right">
				<form action="/addptocat/${aPro.id}" method="post">
    			<div class="p-3 form-group row form-inline">
    				<label for="categories" class="col-sm-1 col-form-label"> Add Category:</label>
    				<div class="col-sm-1">
    					<select name="categories">
    					
    						<c:forEach items="${allcat}" var="c">
    							<option value="${c.id}"><c:out value="${c.name}"/></option>
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