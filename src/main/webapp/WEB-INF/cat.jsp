<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.sub {
		margin-left: 9.8%;
	}
	h1 {
		padding: 20px;
		margin-left: 1.8%;
	}
</style>
<meta charset="ISO-8859-1">
<title>Category</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div id="wrapper">
		<h1>New Category</h1>
		<div id="main">
		<form:form action="/category" method="post" modelAttribute="cat">
    		<div class="p-3 form-group row form-inline">
    			<form:label path="name" class="col-sm-1 col-form-label"> Name:</form:label>
    				<div class="col-sm-4">
		        		<form:errors path="name"/>
		        		<form:input path="name" class="form-control"/>
        			</div>
    		</div>
        	<div class="form-group row form-inline">
    			<div class="sub">
    				<input class="btn btn-primary" type="submit" value="Create"/>
    				<a class="btn btn-primary ml-2" href="/"> Back </a>
    			</div>
    		</div>
		</form:form> 
		</div>
	</div>
</body>
</html>