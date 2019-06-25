package com.uca.capas.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.dto.EditarEmpDTO;
import com.uca.capas.service.EmpleadoService;
import com.uca.capas.service.SucursalService;

@Controller
public class EmpleadoController {

	@Autowired
	SucursalService sucursalService;
	
	@Autowired
	EmpleadoService empleadoService;
	
	@RequestMapping(value = "/empleado/main", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView main(@RequestParam(name = "id") Integer id){
		ModelAndView mav = new ModelAndView();
		mav.addObject("sucursal", sucursalService.findOne(id));
		mav.setViewName("empleados/main");
		return mav;
	}
	
	@RequestMapping(value = "/empleado/eliminar", method = RequestMethod.POST)
	public ModelAndView eliminarEmpleado(@RequestParam(name = "empId",  required = true) Integer empId, @RequestParam(name = "sucId",  required = true) Integer sucId){
		ModelAndView mav = new ModelAndView();
		empleadoService.eliminarEmpleado(empId);
		mav.addObject("sucursal", sucursalService.findOne(sucId));
		mav.setViewName("empleados/main");
		return mav;
	}
	
	@RequestMapping(value = "/empleado/ver", method = RequestMethod.POST)
	public ModelAndView verEmpleado(@RequestParam(name = "empId2",  required = true) Integer empId, @RequestParam(name = "sucId2",  required = true) Integer sucId){
		ModelAndView mav = new ModelAndView();
		//empleadoService.eliminarEmpleado(empId);
		mav.addObject("editarEmpDTO", empleadoService.editEmpDTO(empId));
		mav.addObject("IdPadre", sucId);
		mav.setViewName("empleados/editarEmpleado");
		return mav;
	}
	
	@RequestMapping(value = "/empleado/editar", method = RequestMethod.POST)
	public ModelAndView editar(@Valid @ModelAttribute EditarEmpDTO editarDTO, BindingResult result, 
			@RequestParam(name = "empId") Integer empId){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.addObject("IdPadre", empId);
			mav.setViewName("empleados/editarEmpleado");
		}else {
			empleadoService.editarEmpleado(editarDTO);
			mav.addObject("sucursal", sucursalService.findOne(empId));
			mav.setViewName("empleados/main");
		}
		return mav;
	}
	
	@RequestMapping(value = "/empleado/nuevo", method = RequestMethod.GET)
	public ModelAndView registrar(@RequestParam(name = "id") Integer empId){
		ModelAndView mav = new ModelAndView();
		mav.addObject("editarEmpDTO", new EditarEmpDTO());
		//System.out.println(empId);
		mav.addObject("IDSucursal", empId);
		mav.setViewName("empleados/registrarEmpleado");
		return mav;
	}
	
	@RequestMapping(value = "/empleado/registrar", method = RequestMethod.POST)
	public ModelAndView nuevaSucursal(@Valid @ModelAttribute EditarEmpDTO editarDTO, BindingResult result,
			@RequestParam(name = "sucursalId", required = true) Integer empId){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.addObject("IDSucursal", empId);
			mav.setViewName("empleados/registrarEmpleado");
		}else {
			empleadoService.agregarEmpleado(editarDTO, empId);
			mav.addObject("sucursal", sucursalService.findOne(empId));
			mav.setViewName("empleados/main");
		}
		return mav;
	}
}
