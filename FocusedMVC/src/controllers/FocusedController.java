package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.FocusedDbDao;
import data.ReviewData;
import entities.Company;
import entities.Product;
import entities.Reviewer;
import entities.Reward;

@Controller
@SessionAttributes({ "reviewer", "authenticated", "cart", "company" })
public class FocusedController {

	@Autowired
	private FocusedDbDao dao;

	// Session Attributes
	@ModelAttribute("reviewer")
	public Reviewer initReviewer() {
		return new Reviewer();
	}

	@ModelAttribute("authenticated")
	public boolean authenticated() {
		return false;
	}

	@ModelAttribute("cart")
	public List<Reward> initCart() {
		return new ArrayList<>();
	}
	
	@ModelAttribute("company")
	public Company initCompany() {
		return new Company();
	}

	// Company methods
	@RequestMapping(path = "CreateCompany.do", method = RequestMethod.POST)
	public ModelAndView createCompany(String name, String username, String password, String description,
			String photoUrl) {
		if (dao.isDuplicateCompany(username)) {
			return new ModelAndView("DuplicateCompany.html");
		}

		Company c = dao.createCompany(name, username, password, description, photoUrl);
		return new ModelAndView("company.jsp", "company", c);

	}

	@RequestMapping(path = "UpdateCompany.do", method = RequestMethod.POST)
	public ModelAndView updateCompany(int id, String name, String username, String password, String description,
			String photoUrl) {
		Company c = dao.updateCompany(id, name, username, password, description, photoUrl);
		ModelAndView mv = new ModelAndView("company.jsp");
		mv.addObject("company", c);
		List<ReviewData> rd = dao.getReviewData(c.getId());
		mv.addObject("ReviewData", rd);
		return mv;
	}

	@RequestMapping(path = "UpdateCompanyMenu.do", method = RequestMethod.POST)
	public ModelAndView updateCompanyMenu(int id) {
		return new ModelAndView("EditCompany.jsp", "company", dao.getCompanyById(id));
	}

	@RequestMapping(path = "ExistingLoginCompany.do", method = RequestMethod.POST)
	public ModelAndView logInCompany(String username, String password, @ModelAttribute("company") Company company) {
		Company match = dao.MatchCompany(username, password);

		if (match.getPassword().equals(password)) {
			ModelAndView mv = new ModelAndView("company.jsp");
			company = dao.getCompanyById(match.getId());
			mv.addObject("company", company);
			List<ReviewData> rd = dao.getReviewData(match.getId());
			mv.addObject("ReviewData", rd);
			return mv;
		} else {
			return new ModelAndView("CompanyLoginWrongPass.html");
		}

	}

	// Reviewer methods
	@RequestMapping(path = "CreateReviewer.do", method = RequestMethod.POST)
	public ModelAndView createReviewer(String username, String password, int age, String gender, String photoUrl, @ModelAttribute("reviewer") Reviewer reviewer) {
		if (dao.isDuplicateReviewer(username)) {
			return new ModelAndView("DuplicateReviewer.html");
		}
		ModelAndView mv = new ModelAndView("reviewer.jsp");
		reviewer = dao.createReviewer(username, password, age, gender, photoUrl);
		mv.addObject("reviewer", reviewer);
		mv.addObject("unratedProducts", dao.getUnratedProducts(reviewer.getId()));
		return mv;
	}

	@RequestMapping(path = "UpdateReviewer.do", method = RequestMethod.POST)
	public ModelAndView updateReviewer(int id, String username, String password, int age, String gender,
			String photoUrl) {
		Reviewer r = dao.updateReviewer(id, username, password, age, gender, photoUrl);
		ModelAndView mv = new ModelAndView("reviewer.jsp");
		mv.addObject("unratedProducts", dao.getUnratedProducts(id));
		mv.addObject("ratedProducts", dao.getRatedProducts(id));
		mv.addObject("reviewer", r);
		return mv;
	}

	@RequestMapping(path = "UpdateReviewerMenu.do", method = RequestMethod.POST)
	public ModelAndView updateReviewerMenu(int id) {
		return new ModelAndView("EditReviewer.jsp", "reviewer", dao.getReviewerById(id));
	}

	@RequestMapping(path = "ReviewProductMenu.do", method = RequestMethod.POST)
	public ModelAndView reviewProductMenu(int reviewerId, @ModelAttribute("authenticated") boolean auth) {
		List<Product> products = dao.getUnratedProducts(reviewerId);
		ModelAndView mv = new ModelAndView("ReviewProduct.jsp");
		mv.addObject("products", products);
		mv.addObject("reviewer", dao.getReviewerById(reviewerId));
		return mv;
	}
	
	@RequestMapping(path = "SingleProductReview.do", method = RequestMethod.POST)
	public ModelAndView singleProductReview(int productId) {
		Product product = dao.getProductById(productId);
		ModelAndView mv = new ModelAndView("ReviewProduct.jsp");
		mv.addObject("product", product);
		return mv;
	}

	@RequestMapping(path = "ExistingLogin.do", method = RequestMethod.POST)
	public ModelAndView logInReviewer(String username, String password, @ModelAttribute("reviewer") Reviewer reviewer,
			@ModelAttribute("authenticated") boolean auth) {
		Reviewer match = dao.MatchReviewer(username, password);

		if (match.equals(null)) {
			return new ModelAndView("ReviewerLoginWrongPass.html");
		} else if (match.getPassword().equals(password)) {
			ModelAndView mv = new ModelAndView("reviewer.jsp");
			mv.addObject("reviewer", dao.getReviewerById(match.getId()));
			mv.addObject("authenticated", true);
			mv.addObject("unratedProducts", dao.getUnratedProducts(match.getId()));
			mv.addObject("ratedProducts", dao.getRatedProducts(match.getId()));
			return mv;
		} else {
			return new ModelAndView("ReviewerLoginWrongPass.html");
		}

	}

	// Product Methods
	@RequestMapping(path = "NewProductMenu.do", method = RequestMethod.POST)
	public ModelAndView newProductMenu(int id) {
		return new ModelAndView("NewProduct.jsp", "company", dao.getCompanyById(id));
	}

	@RequestMapping(path = "NewProduct.do", method = RequestMethod.POST)
	public ModelAndView newProduct(int companyId, String name, double price, String photoUrl, String description) {
		Product p = dao.createProduct(companyId, name, price, photoUrl, description);
		ModelAndView mv = new ModelAndView("company.jsp");
		mv.addObject("company", dao.getCompanyById(companyId));
		List<ReviewData> rd = dao.getReviewData(companyId);
		mv.addObject("ReviewData", rd);
		mv.addObject("product", p);
		return mv;
	}

	@RequestMapping(path = "UpdateProduct.do", method = RequestMethod.POST)
	public ModelAndView updateProduct(int id, String name, double price, String photoUrl, String description) {
		Product p = dao.updateProduct(id, name, price, photoUrl, description);
		return new ModelAndView("company.jsp", "product", p);
	}

	@RequestMapping(path = "UpdateProductMenu.do", method = RequestMethod.POST)
	public ModelAndView updateProductMenu(int id, int companyId) {
		ModelAndView mv = new ModelAndView("EditProduct.jsp");
		mv.addObject("company", dao.getCompanyById(companyId));
		mv.addObject("product", dao.getProductById(id));
		return mv;
	}

	@RequestMapping(path = "RemoveProduct.do", method = RequestMethod.POST)
	public ModelAndView removeProduct(int id, int companyId) {
		dao.removeProduct(id);
		ModelAndView mv = new ModelAndView("company.jsp");
		mv.addObject("company", dao.getCompanyById(companyId));
		List<ReviewData> rd = dao.getReviewData(companyId);
		mv.addObject("ReviewData", rd);
		return mv;
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
		return new ModelAndView("ProductFeaturesMenu.jsp", "product", dao.getProductById(productId));
	}

	@RequestMapping(path = "RemoveFeature.do", method = RequestMethod.POST)
	public ModelAndView removeFeature(int id, int productId) {
		dao.removeFeature(id);
		return new ModelAndView("ProductFeaturesMenu.jsp", "product", dao.getProductById(productId));
	}

	@RequestMapping(path = "ProductFeaturesMenu.do", method = RequestMethod.POST)
	public ModelAndView productFeaturesMenu(int id) {
		System.out.println("ProductFeaturesMenu & id equals " + id);
		return new ModelAndView("ProductFeaturesMenu.jsp", "product", dao.getProductById(id));
	}

	@RequestMapping(path = "Logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, @ModelAttribute("authenticated") boolean auth) {
		HttpSession httpSession = request.getSession();
		httpSession.invalidate();
		ModelAndView mv = new ModelAndView("logout.html");
		mv.addObject("authenticated", false);
		return mv;
	}

	@RequestMapping(path = "reviewProduct.do", method = RequestMethod.POST)
	public ModelAndView reviewProduct(/*@RequestParam("featureId") int[] featureIds,
			@RequestParam("rating") int[] ratings, */int reviewerId, String[] features, HttpServletRequest request) {
//		System.out.println("in reviewProduct");
		//int rateCount = 0;
		for (String id : features) {
			//for (String id : request.getParameterValues("features")) {
//			System.out.println(id);
//			System.out.println(request.getParameter("rating-" + id));
			
			int radioButtonSelection = Integer.parseInt(request.getParameter("rating-" + id));
			int intId = Integer.parseInt(id);
			dao.reviewProduct(intId, reviewerId, radioButtonSelection);
//			System.out.println("radio button selection" + radioButtonSelection);
		}
		ModelAndView mv = new ModelAndView("reviewer.jsp");
		
		mv.addObject("unratedProducts", dao.getUnratedProducts(reviewerId));
		mv.addObject("ratedProducts", dao.getRatedProducts(reviewerId));
		mv.addObject("reviewer", dao.getReviewerById(reviewerId));
		return mv;	
	}

	// Rewards Methods
	@RequestMapping(path = "RewardsList.do", method = RequestMethod.POST)
	public ModelAndView rewardsList(@ModelAttribute("reviewer") Reviewer reviewer,
									@ModelAttribute("cart") List<Reward> cart) {
		ModelAndView mv = new ModelAndView("rewards.jsp");
		mv.addObject("total",dao.getRewardTotalCost(cart));
		mv.addObject("rewards", dao.getRewards());
		mv.addObject("cartsize", cart.size());
		return mv;
	}

	@RequestMapping(path = "showCart.do", method = RequestMethod.POST)
	public ModelAndView showCart(@ModelAttribute("reviewer") Reviewer reviewer,
								 @ModelAttribute("cart") List<Reward> cart){
		ModelAndView mv = new ModelAndView("ShoppingCart.jsp");
		mv.addObject("total",dao.getRewardTotalCost(cart));
		mv.addObject("cart", cart);
		mv.addObject("reviewer", reviewer);
		mv.addObject("cartsize", cart.size());
				return mv;
	}
	@RequestMapping(path = "addToCart.do", method = RequestMethod.POST)
	public ModelAndView addToCart(@ModelAttribute("reviewer") Reviewer reviewer,
								  @ModelAttribute("cart") List<Reward> cart,
								  @RequestParam("rewardId") int id){
		ModelAndView mv = new ModelAndView("rewards.jsp");
		Reward reward = new Reward();
		reward = dao.getRewardById(id);
		cart.add(reward);
		mv.addObject("cart", cart);
		mv.addObject("total",dao.getRewardTotalCost(cart));
		mv.addObject("cartsize", cart.size());
		mv.addObject("lastItem", reward.getName());
		mv.addObject("rewards", dao.getRewards());
		return mv;
	}
	
	@RequestMapping(path = "removeFromCart.do", method = RequestMethod.POST)
	public ModelAndView removeFromCart(@ModelAttribute("reviewer") Reviewer reviewer,
			@ModelAttribute("cart") List<Reward> cart,
			@RequestParam("rewardId") int id){
		ModelAndView mv = new ModelAndView("ShoppingCart.jsp");
		Reward reward = dao.getRewardById(id);
		dao.removeItemfromCart(cart, reward);
		mv.addObject("cart", cart);
		mv.addObject("total",dao.getRewardTotalCost(cart));
		mv.addObject("cartsize", cart.size());
		mv.addObject("lastItem", reward.getName());
		mv.addObject("rewards", dao.getRewards());
		return mv;
	}
	
	@RequestMapping(path = "LoadRevProfile.do", method = RequestMethod.POST)
	public ModelAndView loadRevProfile(@ModelAttribute("reviewer")Reviewer reviewer,
										@ModelAttribute("cart") List<Reward> cart) {
		ModelAndView mv = new ModelAndView("reviewer.jsp");
		mv.addObject("reviewer", reviewer);
		mv.addObject("cart", cart);
		mv.addObject("unratedProducts", dao.getUnratedProducts(reviewer.getId()));
		mv.addObject("ratedProducts", dao.getRatedProducts(reviewer.getId()));
		return mv;
	}
	
	@RequestMapping(path = "LoadCoProfile.do", method = RequestMethod.POST)
	public ModelAndView loadCoProfile(@ModelAttribute("company") Company company) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("company", company);
		List<ReviewData> rd = dao.getReviewData(company.getId());
		mv.addObject("ReviewData", rd);
		mv.setViewName("company.jsp");
		return mv;
	}
}

