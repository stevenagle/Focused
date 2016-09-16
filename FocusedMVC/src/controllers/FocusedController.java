package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.FocusedDbDao;
import entities.Company;
import entities.Reviewer;

@Controller
public class FocusedController {

	@Autowired
	private FocusedDbDao dao;

	// Company methods
	@RequestMapping(path = "CreateCompany.do")
	public ModelAndView createCompany(String name, String username, String password, String description) {
		Company c = dao.createCompany(name, username, password, description);

		return new ModelAndView("company.jsp", "company", c);
	}

	@RequestMapping(path = "UpdateCompany.do", method = RequestMethod.POST)
	public ModelAndView updateCompany(int id, String name, String description, String username, String password) {
		Company c = dao.updateCompany(id, name, description, username, password);
		return new ModelAndView("company.jsp", "company", c);
	}

	
	// Reviewer methods
	@RequestMapping(path = "CreateReviewer.do")
	public ModelAndView createReviewer(String username, String password, int age, String gender) {
		Reviewer r = dao.createReviewer(username, password, age, gender);
		return new ModelAndView("reviewer.jsp", "reviewer", r);
	}
	
	@RequestMapping(path = "UpdateReviewer.do", method = RequestMethod.POST)
	public ModelAndView updateReviewer(int id, String username, String password, int age, String gender) {
		Reviewer r = dao.updateReviewer(id, username, password, age, gender);
		return new ModelAndView("reviewer.jsp", "reviewer", r);
	}
}
