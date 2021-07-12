package mari.products.services;

import java.util.List;


import org.springframework.stereotype.Service;


import mari.products.models.CatPro;
import mari.products.repositories.CatProRepository;
import mari.products.repositories.CatRepository;
import mari.products.repositories.ProRepository;

@Service
	public class CatProService {
	
	private final CatProRepository cRepo;
 	private final ProRepository pRepo;
 	private final CatRepository catRepo;
 
 	public CatProService(CatProRepository cRepo, ProRepository pRepo,CatRepository catRepo) {
 		this.cRepo = cRepo; this.pRepo = pRepo; this.catRepo = catRepo;
 	}
 
 	public List<CatPro> allCatPro(){ return cRepo.findAll(); }

	
    public CatPro addThings(CatPro date) {
    	return cRepo.save(date);
    }
	
}
