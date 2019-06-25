<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/tabla.css">
<title>Main</title>
</head>
<body>
	<script type='text/javascript'>
			var url = "${pageContext.request.contextPath}/empleado/main"
		 	var path = window.location.pathname;		
			if(path != url){
				location.href = "${pageContext.request.contextPath}/empleado/main?id=${sucursal.idSucursal}"
			}
    </script>
    <div class="container">
    	<div class="row col-md-6 col-md-offset-2 custyle">
    		<table id="table" class="table table-striped custab">
    		<thead>
    			<button onclick="location.href='${pageContext.request.contextPath}/sucursal/main'" class="btn btn-secondary btn-xl pull-left">Ver todas las Sucursales</button>
				<tr>
					<th class="text-center">Nombre</th>
					<th class="text-center">Ubicaci&oacute;n</th>
					<th class="text-center">Horario Entrada</th>
					<th class="text-center">Horario Salida</th>
					<th class="text-center">Numero de Mesas</th>
					<th class="text-center">Gerente Encargado</th>
				</tr>
			</thead>
				<tr>
					<td class="text-center">${sucursal.nombreSucursal}</td>
					<td class="text-center">${sucursal.ubicacionSucursal}</td>
					<td class="text-center">${sucursal.horarioEntradaDelegate}</td>
					<td class="text-center">${sucursal.horarioSalidaDelegate}</td>
					<td class="text-center">${sucursal.numeroMesas}</td>
					<td class="text-center">${sucursal.nombreGerente}</td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row col-md-6 col-md-offset-2 custyle">
			<table id="table" class="table table-striped custab">
				<thead>
				<button onclick="location.href='${pageContext.request.contextPath}/empleado/nuevo?id=${sucursal.idSucursal}'" class="btn btn-secondary btn-xl pull-left"><b></b> Registrar Empleado</button>
					<tr>
						<th class="text-center">Nombre</th>
						<th class="text-center">Edad</th>
						<th class="text-center">Genero</th>
						<th class="text-center">Estado</th>
					</tr>
				</thead>	
				<c:forEach items="${sucursal.empleados}" var="empleados" varStatus="status">
					<tr>
						<td class="text-center">${empleados.nombreEmpleado}</td>
						<td class="text-center">${empleados.edadEmpleado}</td>
						<td class="text-center">${empleados.generoEmpleadoDelegate}</td>
						<td class="text-center">${empleados.estadoEmpleadoDelegate}</td>
						<td>
							<form name="editarSucursal" action="${pageContext.request.contextPath}/empleado/ver" method="post">
			            		<input type="hidden" name="empId2" value=${empleados.idEmpleado}>
			            		<input type="hidden" name="sucId2" value=${empleados.sucursal.idSucursal}>
			            		<input type="Submit" class="btn btn-secondary" value="Editar">
							</form>
						</td>
						<td>
							<form action="${pageContext.request.contextPath}/empleado/eliminar" method="post"> 
			            		<input type="hidden" name="empId" value=${empleados.idEmpleado}>
			            		<input type="hidden" name="sucId" value=${empleados.sucursal.idSucursal}>
			            		<input type="submit" class="btn btn-danger" value="Eliminar">
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>