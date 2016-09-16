package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.FocusedDbDao;
import entities.Company;

@Controller
public class FocusedController {
	
	@Autowired
	private FocusedDbDao dao;
	
	//TODO requestmapping methods
    @RequestMapping(path="CreateCompany.do")
    // request parameters in here to get fields from form.
    // public Company createCompany(int id, String name, String description, String username, String password) 
    public ModelAndView createCompany(String name, String username, String password, String description) {
        Company c = dao.createCompany(name, username, password, description); // insert parameter fields from parameters
        return new ModelAndView("company.jsp", "company", c);
    }
}
