package mari.products.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import mari.products.models.CatPro;

@Repository
public interface CatProRepository extends CrudRepository<CatPro, Long>{
	List<CatPro> findAll();
	List<CatPro> findByProductId(Long proId);
}
