package project.com.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import project.com.entity.Cafe;
import project.com.entity.PictureCafe;


public interface PictureCafeRepository extends CrudRepository<PictureCafe,Long>{

	public List<PictureCafe> findAll();
	
	public PictureCafe findByNameCafe(Cafe nameCafe);
	
	public PictureCafe findBypictureCafe(String pictureCafe);
}
