<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="resources/css/login.css">
<title>Welcome, Please Login</title>
</head>
<body >
	
	<div class="simple-login-container">
		<h2>Login</h2>
			<form id="prueba1" >
	
			
			<div class="row">
				<div class="col-md-12 form-group">
					<input id="1" type="email" placeholder="Username" class="form-control" name="username" />
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 form-group">
					<input id="2" type="password" placeholder="Password" class="form-control" name="password" />
					
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="submit" class="btn btn-block btn-login" value="Iniciar Sesi&oacute;n">
				</div>
			</div>
			</form>
	</div>
	<script type='text/javascript'>
		$(document).ready(function(){
		  $('#1').val('');
		  $('#2').val('');
		});
    </script>
    
   	<script type='text/javascript'>
	   	$("#prueba1").on('submit', function (e) {
			e.preventDefault();
			$.ajax(
				{
					url: "${pageContext.request.contextPath}/login",
					data:  $("#prueba1").serialize(),
					type: 'POST',
					success: function (result) {

						location.href = "${pageContext.request.contextPath}/sucursal/main"
					},
					error: function (xhr) {
						swal("Usuario o contraseña inválido, por favor intente nuevamente", {
				 	    	icon: "error",
		 		   		});
					}
				});
		});
    </script>
    
</body>
</html>