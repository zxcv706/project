package com.ssadagoo.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		log.info("--------------home");
		return "home.jsp";
	}

}
