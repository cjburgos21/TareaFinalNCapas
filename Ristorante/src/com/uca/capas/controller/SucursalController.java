package com.uca.capas.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.uca.capas.domain.Sucursal;
import com.uca.capas.dto.EditarDTO;
import com.uca.capas.service.EmpleadoService;
import com.uca.capas.service.SucursalService;

@Controller
public class SucursalController {

	@Autowired
	SucursalService sucursalService;
	
	@Autowired
	EmpleadoService empleadoService;
	
	
	@RequestMapping(value = "/sucursal/eliminar", method = RequestMethod.POST)
	public ModelAndView eliminar(@RequestParam(name = "valorId") Integer id){
		ModelAndView mav = new ModelAndView();
		sucursalService.eliminarSucursal(id);
		mav.addObject("sucursales", sucursalService.findAll());
		mav.setViewName("sucursales/main");
		return mav;
	}
	
	@RequestMapping(value = "/sucursal/main", method = RequestMethod.GET)
	public ModelAndView main(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("sucursales", sucursalService.findAll());
		mav.setViewName("sucursales/main");
		return mav;
	}
	
	@RequestMapping(value = "/sucursal/ver", method = RequestMethod.POST)
	public ModelAndView ver(@RequestParam(name = "editId") Integer id){
		ModelAndView mav = new ModelAndView();
		mav.addObject("editarDTO", sucursalService.obtenerSucursalDTO(id));
		mav.setViewName("sucursales/edit");
		return mav;
	}
	
	@RequestMapping(value = "/sucursal/editar", method = RequestMethod.POST)
	public ModelAndView editar(@Valid @ModelAttribute EditarDTO editarDTO, BindingResult result){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName("sucursales/edit");
		}else {
			sucursalService.editarSucursal(editarDTO);
			mav.setViewName("sucursales/main");
		}
		return mav;
	}
	
	@RequestMapping(value = "/sucursal/nueva", method = RequestMethod.GET)
	public ModelAndView registrar(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("editarDTO", new EditarDTO());
		mav.setViewName("sucursales/registrar");
		return mav;
	}

	@RequestMapping(value = "/sucursal/registrar", method = RequestMethod.POST)
	public ModelAndView nuevaSucursal(@Valid @ModelAttribute EditarDTO editarDTO, BindingResult result){
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			mav.setViewName("sucursales/registrar");
		}else {
			sucursalService.agregarSucursal(editarDTO);
			mav.setViewName("sucursales/main");
		}
		return mav;
	}
	
}
