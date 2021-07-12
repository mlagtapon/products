package mari.products.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import mari.products.models.Category;
import mari.products.models.Product;
import mari.products.repositories.CatRepository;

@Service
public class CatService {
	private final CatRepository cRepo;
	
	public CatService(CatRepository cRepo) {
		this.cRepo = cRepo;
	}
	
	public List<Category> allCat(){
		return cRepo.findAll();
	}
	
	public Category createC(Category c) {
		return cRepo.save(c);
	}
	
	public Category findOne(Long id) {
		Optional<Category> cat = cRepo.findById(id);
			if(cat.isPresent()) {
				return cat.get();
			} else {
				return null;
			}
	}
	
	public Category addPro(Long id, Product p) {
		Category c = findOne(id);
		List<Product> pro = c.getProducts();
		pro.add(p);
		c.setProducts(pro);
		return cRepo.save(c);
	}
	
	public Category removePro(Long id, Product p) {
		Category c = findOne(id);
		List<Product> pro = c.getProducts();
		pro.remove(p);
		c.setProducts(pro);
		return cRepo.save(c);
	}
	
	public Category update(Category c) {
		return cRepo.save(c);
	}
	
	public void delete(Long id) {
		cRepo.deleteById(id);
	}
	
	
	public Iterable<Category> availableCatforPro(Product pro){
		return cRepo.findByProductsNotContains(pro);
	}
}
