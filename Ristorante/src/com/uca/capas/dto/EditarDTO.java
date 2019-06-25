package com.uca.capas.dto;

import java.math.BigInteger;
import java.sql.Time;

import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

@SuppressWarnings("deprecation")
public class EditarDTO {
	
	private Integer idSucursal;
	
	@NotEmpty(message = "favor ingrese el nombre de la sucursal")
	@Size(message = "la longitud maxima es de 100 caracteres", min = 0, max = 100)
	private String nombreSucursal;
	
	@NotEmpty(message = "favor ingrese la ubicacion de la sucursal")
	@Size(message = "la longitud maxima es de 100 caracteres", min = 0, max = 100)
	private String ubicacionSucursal;

	@NotEmpty(message = "favor ingresar una hora")
	private String horarioEntrada;
	
	@NotEmpty(message = "favor ingresar una hora")
	private String horarioSalida;
	
	@NotNull(message="favor ingresar un cantidad")
	@PositiveOrZero(message = "en numero de mesas no es valido")
	@Digits(message = "Su cantidad de mesas ha sobrepasado 9,999,999 ", integer = 7, fraction = 0)
	private BigInteger numeroMesas;
	
	@NotEmpty(message = "favor ingrese el nombre del gerente")
	@Size(message = "la longitud maxima es de 100 caracteres", min = 0, max = 100)
	private String nombreGerente;

	public EditarDTO() {
		super();
	}

	public EditarDTO(Integer idSucursal,
			@NotEmpty(message = "favor ingrese el nombre de la sucursal") @Size(message = "la longitud maxima es de 150 caracteres", min = 0, max = 100) String nombreSucursal,
			@NotEmpty(message = "favor ingrese la ubicacion de la sucursal") @Size(message = "la longitud maxima es de 150 caracteres", min = 0, max = 100) String ubicacionSucursal,
			@NotEmpty(message = "favor ingrese el horario de entrada") @Pattern(regexp = "^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$", message = "ingrese un formato valido 'HH:MM'") String horarioEntrada,
			@NotEmpty(message = "favor ingrese el horario de salida") @Pattern(regexp = "^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$", message = "ingrese un formato valido 'HH:MM'") String horarioSalida,
			@NotEmpty(message = "favor ingrese el numero de mesas") @PositiveOrZero(message = "el numero de mesas debe ser un entero positivo") @Digits(message = "ingrese un numero valido", integer = 6, fraction = 0) BigInteger numeroMesas,
			@NotEmpty(message = "favor ingrese el nombre del gerente") @Size(message = "la longitud maxima es de 150 caracteres", min = 0, max = 100) String nombreGerente) {
		super();
		this.idSucursal = idSucursal;
		this.nombreSucursal = nombreSucursal;
		this.ubicacionSucursal = ubicacionSucursal;
		this.horarioEntrada = horarioEntrada;
		this.horarioSalida = horarioSalida;
		this.numeroMesas = numeroMesas;
		this.nombreGerente = nombreGerente;
	}

	public Integer getIdSucursal() {
		return idSucursal;
	}

	public void setIdSucursal(Integer idSucursal) {
		this.idSucursal = idSucursal;
	}

	public String getNombreSucursal() {
		return nombreSucursal;
	}

	public void setNombreSucursal(String nombreSucursal) {
		this.nombreSucursal = nombreSucursal;
	}

	public String getUbicacionSucursal() {
		return ubicacionSucursal;
	}

	public void setUbicacionSucursal(String ubicacionSucursal) {
		this.ubicacionSucursal = ubicacionSucursal;
	}

	public String getHorarioEntrada() {
		return horarioEntrada;
	}

	public void setHorarioEntrada(String horarioEntrada) {
		this.horarioEntrada = horarioEntrada;
	}

	public String getHorarioSalida() {
		return horarioSalida;
	}

	public void setHorarioSalida(String horarioSalida) {
		this.horarioSalida = horarioSalida;
	}

	public BigInteger getNumeroMesas() {
		return numeroMesas;
	}

	public void setNumeroMesas(BigInteger numeroMesas) {
		this.numeroMesas = numeroMesas;
	}

	public String getNombreGerente() {
		return nombreGerente;
	}

	public void setNombreGerente(String nombreGerente) {
		this.nombreGerente = nombreGerente;
	}
	
	public Time getHorarioEntradaDelegate() {
		if(this.horarioEntrada == null) return null;
		else {
			int hora = Integer.parseInt(horarioEntrada.substring(0,2));
			int minutos = Integer.parseInt(horarioEntrada.substring(3,5));
			Time horaEntrada = new Time(hora, minutos, 00);
			return horaEntrada;
		}
	}
	
	public Time getHorarioSalidaDelegate() {
		if(this.horarioSalida == null) return null;
		else {
			int hora = Integer.parseInt(horarioSalida.substring(0,2));
			int minutos = Integer.parseInt(horarioSalida.substring(3,5));
			Time horaSalida = new Time(hora, minutos, 00);
			return horaSalida;
		}
	}
}
