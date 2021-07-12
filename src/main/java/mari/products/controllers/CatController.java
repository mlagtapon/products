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
import mari.products.services.CatService;
import mari.products.services.ProService;

@Controller
public class CatController {
	
	private final ProService pSer;
	private final CatService cSer;
	
	public CatController(ProService pSer, CatService cSer) {
		this.pSer = pSer;
		this.cSer = cSer;
	}
	
	@RequestMapping("/categories/new")
	public String cat(@ModelAttribute("cat") Category cat) {
		return "cat.jsp";
	}
	
	@PostMapping("/category")
	
	public String createC(@Valid @ModelAttribute("cat") Category cat, BindingResult result) {
		if(result.hasErrors()){
			return "cat.jsp";
		} else {
			cSer.createC(cat);
			return "redirect:/";
		}
	}
	
	@RequestMapping("/categories/{id}")
	public String showOne(@PathVariable("id") Long id, @ModelAttribute("pro") Product product, @ModelAttribute("cat") Category cat, HttpServletRequest request, Model model) {
	    Category aCat = cSer.findOne(id);
	    model.addAttribute("aCat", aCat);
	    model.addAttribute("allpro", pSer.availableProForCat(cat));
		model.addAttribute("allcat", cSer.allCat());
	    return "cshow.jsp";
	 }
	
	@PostMapping("/addctopro/{id}")
	
	public String addP(@PathVariable("id") Long id, @RequestParam("products")Product p) {
			cSer.addPro(id, p);
			return "redirect:/categories/{id}";
	}
	
	@PostMapping("/remcfrompro/{id}")
	
	public String remC(@PathVariable("id") Long id,@RequestParam("products")Product p) {
			
			cSer.removePro(id, p);
			return "redirect:/categories/{id}";
	}
}
