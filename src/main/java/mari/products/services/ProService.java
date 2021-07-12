package mari.products.services;

import java.util.List;
import java.util.Optional;


import org.springframework.stereotype.Service;

import mari.products.models.Category;
import mari.products.models.Product;
import mari.products.repositories.CatProRepository;
import mari.products.repositories.CatRepository;
import mari.products.repositories.ProRepository;

@Service
public class ProService {
	private final ProRepository pRepo;
 	private final CatProRepository cRepo;
 	private final CatRepository catRepo;
	
	public ProService(ProRepository pRepo, CatProRepository cRepo, CatRepository catRepo) {
		this.pRepo = pRepo;
		this.cRepo = cRepo;
		this.catRepo = catRepo;
	}
	
	public List<Product> allProduct(){
		return pRepo.findAll();
	}
	
	public Product createP(Product p) {
		return pRepo.save(p);
	}
	
	public Product findOne(Long id) {
		Optional<Product> pro = pRepo.findById(id);
			if(pro.isPresent()) {
				return pro.get();
			} else {
				return null;
			}
	}
	
	public Product addCat(Long id, Category c) {
		Product p = findOne(id);
		List<Category> cat = p.getCategories();
		cat.add(c);
		p.setCategories(cat);
		return pRepo.save(p);
	}
	
	public Product removeCat(Long id, Category c) {
		Product p = findOne(id);
		List<Category> cat = p.getCategories();
		cat.remove(c);
		p.setCategories(cat);
		return pRepo.save(p);
	}
	
	public Product update(Product p) {
		return pRepo.save(p);
	}
	
	public void delete(Long id) {
		pRepo.deleteById(id);
	}
	
	public Category findOneCat(Long id) {
		Optional<Category> cat = catRepo.findById(id);
			if(cat.isPresent()) {
				return cat.get();
			} else {
				return null;
			}
    }
	
	public Iterable<Product> availableProForCat(Category category){
		return pRepo.findByCategoriesNotContains(category);
	}
}
