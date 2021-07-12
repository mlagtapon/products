package mari.products.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mari.products.models.Category;
import mari.products.models.Product;
import mari.products.services.CatProService;
import mari.products.services.CatService;
import mari.products.services.ProService;

@Controller
public class ProController {
	
	private final ProService pSer;
	private final CatService cSer;
	private final CatProService cpSer;
	
	public ProController(ProService pSer, CatService cSer, CatProService cpSer) {
		this.pSer = pSer;
		this.cSer = cSer;
		this.cpSer = cpSer;
	}
	
	@RequestMapping("/")
	public String index(@ModelAttribute("pro") Product product, @ModelAttribute("cat") Category cat, Model model) {
		model.addAttribute("allpro", pSer.allProduct());
		model.addAttribute("allcat", cSer.allCat());
		return "home.jsp";
	}
	
	@RequestMapping("/products/new")
	public String pro(@ModelAttribute("pro") Product product) {
		return "product.jsp";
	}
	
	@RequestMapping("/products/{id}")
	public String showOne(@PathVariable("id") Long id, @ModelAttribute("pro") Product product, @ModelAttribute("cat") Category cat, HttpServletRequest request, Model model) {
	    Product aPro = pSer.findOne(id);
	    model.addAttribute("aPro", aPro);
	    model.addAttribute("allpro", pSer.allProduct());
		model.addAttribute("allcat", cSer.availableCatforPro(product));
	    return "pshow.jsp";
	 }
	
	@PostMapping("/addptocat/{id}")
	
	public String addC(@PathVariable("id") Long id, @RequestParam("categories")Category c) {
			
			pSer.addCat(id, c);
			return "redirect:/products/{id}";
	}
	
	@PostMapping("/rempfromcat/{id}")
	
	public String remC(@PathVariable("id") Long id, @RequestParam("categories")Category c) {
			
			pSer.removeCat(id, c);
			return "redirect:/products/{id}";
	}
	
	@PostMapping("/product")
	
	public String createP(@Valid @ModelAttribute("pro") Product product, BindingResult result) {
		if(result.hasErrors()){
			return "product.jsp";
		} else {
			pSer.createP(product);
			return "redirect:/";
		}
	}
	
}
