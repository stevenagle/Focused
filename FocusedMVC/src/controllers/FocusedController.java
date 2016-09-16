package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import dao.FocusedDbDao;

@Controller
public class FocusedController {
	
	@Autowired
	private FocusedDbDao dao;
	
	//TODO requestmapping methods
}
