<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="resources/css/login.css">
<title>Registrar Sucursal</title>
</head>
<body>
<div class="container">
    	<h2 class="col-sm-10 text-secondary border border-success border-top-0 border-left-0 border-right-0">Registrar Sucursal</h2>
	<form:form id="registersucursal" action="${pageContext.request.contextPath}/sucursal/registrar" method="POST" modelAttribute="editarDTO">
		<form:input type="hidden" name="id" value="1" path="idSucursal"/>
		
			<div class="row">
				<div class="col-md-12 form-group">
					<form:label path = "nombreSucursal">Nombre Sucursal: </form:label>
					<form:input type="text" class="form-control" name="nombre" path="nombreSucursal"/>
					<form:errors path="nombreSucursal"  cssStyle="color:red;"></form:errors>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 form-group">
					<form:label path = "ubicacionSucursal">Ubicacion Sucursal: </form:label>
					<form:input type="text" class="form-control" name="ubicacion" path="ubicacionSucursal"/>
					<form:errors path="ubicacionSucursal" cssStyle="color:red;"></form:errors>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 form-group">
					<form:label path = "horarioEntrada">Horario de Entrada: </form:label>
					<form:input type="time" class="form-control" name="horario entrada" path="horarioEntrada"/>
					<form:errors path="horarioEntrada" cssStyle="color:red;"></form:errors>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 form-group">
					<form:label path = "horarioSalida">Horario de Salida: </form:label>
					<form:input type="time" class="form-control" name="horario salida" path="horarioSalida"/>
					<form:errors path="horarioSalida" cssStyle="color:red;"></form:errors>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 form-group">
					<form:label path = "numeroMesas">Numero de Mesas: </form:label>
					<form:input type="number" class="form-control" name="numero de mesas" path="numeroMesas"/>
					<form:errors path="numeroMesas" cssStyle="color:red;"></form:errors>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12 form-group">
					<form:label path = "nombreGerente">Nombre del Gerente: </form:label>
					<form:input type="text" class="form-control" name="Nombre Gerente" path="nombreGerente"/>
					<form:errors path="nombreGerente" cssStyle="color:red;"></form:errors>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
				<input id="enviar" type = "submit" value="Agregar Sucursal" class="btn btn-lg btn-login btn-warning">
				</div>
			</div>
		</form:form>
</div>
</body>
</html>