<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/tabla.css">
<title>Main</title>
</head>
<body>
	<script type='text/javascript'>
			var url = "${pageContext.request.contextPath}/sucursal/main"
		 	var path = window.location.pathname;		
			if(path != url){
				location.href = "${pageContext.request.contextPath}/sucursal/main"
			}
    </script>
    
    <div class="container">
    	<div class="row col-md-6 col-md-offset-2 custyle">
    		<table id="table" class="table table-striped custab">
    			<thead>
    				<button onclick="location.href='${pageContext.request.contextPath}/sucursal/nueva'" class="btn ouline-secondary btn-xl pull-right"><b></b> Registrar Sucursal</button>
					<tr>
						<th class="text-center">Nombre</th>
					</tr>
				</thead>
				<c:forEach items="${sucursales}" var="sucursales" varStatus="status">
				<tr>
					<td class="text-center">${sucursales.nombreSucursal}</td>
					<td class="text-center">
						<form name="verPerfil" action="${pageContext.request.contextPath}/empleado/main" method="post">
            				<input type="hidden" name="id" value=${sucursales.idSucursal}>
            				<input class="btn btn-primary" type="Submit" value="Ver Perfil">
						</form>
					</td>
					<td class="text-center">
						<form name="editarSucursal" action="${pageContext.request.contextPath}/sucursal/ver" method="post">
            				<input type="hidden" name="editId" value=${sucursales.idSucursal}>
            				<input class="btn btn-secondary" type="Submit" value="Editar">
						</form>
					</td>
					<td class="text-center">
						<form action="${pageContext.request.contextPath}/sucursal/eliminar" method="post"> 
            				<input type="hidden" name="valorId" value=${sucursales.idSucursal}>
            				<input class="btn btn-danger" type="submit" class="delete_button" value="Eliminar">
						</form>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	  </div>
</body>
</html>