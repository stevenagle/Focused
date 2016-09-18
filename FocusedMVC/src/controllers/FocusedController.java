package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.FocusedDbDao;
import entities.Company;
import entities.Feature;
import entities.Product;
import entities.Reviewer;

@Controller
public class FocusedController {

	@Autowired
	private FocusedDbDao dao;

	// Company methods
	@RequestMapping(path = "CreateCompany.do", method = RequestMethod.POST)
	public ModelAndView createCompany(String name, String username, String password, String description) {
		Company c = dao.createCompany(name, username, password, description);

		return new ModelAndView("company.jsp", "company", c);
	}

	@RequestMapping(path = "UpdateCompany.do", method = RequestMethod.POST)
	public ModelAndView updateCompany(int id, String name, String username, String password, String description) {
		Company c = dao.updateCompany(id, name, username, password, description);
		return new ModelAndView("company.jsp", "company", c);
	}

	@RequestMapping(path = "UpdateCompanyMenu.do", method = RequestMethod.POST)
	public ModelAndView updateCompanyMenu(int id) {
		return new ModelAndView("EditCompany.jsp", "company", dao.getCompanyById(id));
	}
	
	@RequestMapping(path = "ExistingLoginCompany.do", method = RequestMethod.POST)
	public ModelAndView logInCompany(String username, String password) {
		Company match = dao.MatchCompany(username, password);
		if (match.getPassword().equals(password)) {
			return new ModelAndView("company.jsp", "company", dao.getCompanyById(match.getId()));
		} else {
			return new ModelAndView("CompanyLoginWrongPass.html");
		}
	}

	// Reviewer methods
	@RequestMapping(path = "CreateReviewer.do", method = RequestMethod.POST)
	public ModelAndView createReviewer(String username, String password, int age, String gender) {
		Reviewer r = dao.createReviewer(username, password, age, gender);
		return new ModelAndView("reviewer.jsp", "reviewer", r);
	}

	@RequestMapping(path = "UpdateReviewer.do", method = RequestMethod.POST)
	public ModelAndView updateReviewer(int id, String username, String password, int age, String gender) {
		Reviewer r = dao.updateReviewer(id, username, password, age, gender);
		return new ModelAndView("reviewer.jsp", "reviewer", r);
	}

	@RequestMapping(path = "UpdateReviewerMenu.do", method = RequestMethod.POST)
	public ModelAndView updateReviewerMenu(int id) {
		return new ModelAndView("EditReviewer.jsp", "reviewer", dao.getReviewerById(id));
	}

	@RequestMapping(path = "ExistingLogin.do", method = RequestMethod.POST)
	public ModelAndView logInReviewer(String username, String password) {
		Reviewer match = dao.MatchReviewer(username, password);
		
		if (match.equals(null)){
			return new ModelAndView("ReviewerLoginWrongPass.html");
		}
		else if (match.getPassword().equals(password)) {
			return new ModelAndView("reviewer.jsp", "reviewer", dao.getReviewerById(match.getId()));
		} else {
			return new ModelAndView("ReviewerLoginWrongPass.html");
		}
		
	}

	// Product Methods
	@RequestMapping(path = "NewProductMenu.do", method = RequestMethod.POST)
	public ModelAndView newProductMenu(int id) {
		System.out.println("NewProductMenu & id equals " + id);
		return new ModelAndView("NewProduct.jsp", "company", dao.getCompanyById(id));
	}

	@RequestMapping(path = "NewProduct.do", method = RequestMethod.POST)
	public ModelAndView newProduct(int companyId, String name, double price, String photoUrl, String description) {
		System.out.println("in NewProduct.do" + companyId + description + "");
		Product p = dao.createProduct(companyId, name, price, photoUrl, description);			
		ModelAndView mv = new ModelAndView("company.jsp", "company", dao.getCompanyById(companyId));
		mv.addObject("product", p);
		return mv;
	}
	
	@RequestMapping(path = "UpdateProduct.do", method = RequestMethod.POST)
	public ModelAndView updateProduct(int id, String name, double price, String photoUrl, String description) {
		Product p = dao.updateProduct(id, name, price, photoUrl, description);
		return new ModelAndView("ProductFeaturesMenu.jsp", "product", p);
	}
	
	@RequestMapping(path = "UpdateProductMenu.do", method = RequestMethod.POST)
	public ModelAndView updateProductMenu(int id) {
		return new ModelAndView("EditProduct.jsp", "product", dao.getProductById(id));
	}
	
	@RequestMapping(path = "RemoveProduct.do", method = RequestMethod.POST)
	public ModelAndView removeProduct(int id, int companyId) {
		dao.removeProduct(id);
		return new ModelAndView("company.jsp", "company", dao.getCompanyById(companyId));
	}
	
	// Feature methods
	@RequestMapping(path = "NewFeature.do", method = RequestMethod.POST)
	public ModelAndView newFeature(int productId, String details) {
		dao.createFeature(productId, details);
		return new ModelAndView("ProductFeaturesMenu.jsp", "product", dao.getProductById(productId));
	}
	@RequestMapping(path = "NewFeatureMenu.do", method = RequestMethod.POST)
	public ModelAndView productFeatureMenu(int productId, String details) {
		return new ModelAndView("NewFeature.jsp", "product", dao.getProductById(productId));
	}
	
	@RequestMapping(path = "UpdateFeatureMenu.do", method = RequestMethod.POST)
	public ModelAndView updateFeatureMenu(int id) {
		return new ModelAndView("EditFeature.jsp", "feature", dao.getFeatureById(id));
	}
	@RequestMapping(path = "UpdateFeature.do", method = RequestMethod.POST)
	public ModelAndView updateFeature(int id, int productId, String details) {
		dao.updateFeature(id, details);
		return new ModelAndView("ProductFeaturesMenu.jsp","product", dao.getProductById(productId));
	}
	
	
	@RequestMapping(path = "ProductFeaturesMenu.do", method = RequestMethod.POST)
	public ModelAndView productFeaturesMenu(int id) {
		System.out.println("ProductFeaturesMenu & id equals " + id);
		return new ModelAndView("ProductFeaturesMenu.jsp", "product", dao.getProductById(id));
	}
	
}
