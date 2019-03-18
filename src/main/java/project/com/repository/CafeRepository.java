package project.com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import project.com.entity.Cafe;
import project.com.entity.Member;

public interface CafeRepository extends CrudRepository<Cafe,Long>{

	//public List<Cafe> findAll();
	
	public Cafe findByNameCafe(String nameCafe);
	public Cafe findByEmail(String email);
	
@Query(nativeQuery=true, value="SELECT * FROM cafe ORDER BY name_cafe")
    public List<Cafe> findAll();

	
}
