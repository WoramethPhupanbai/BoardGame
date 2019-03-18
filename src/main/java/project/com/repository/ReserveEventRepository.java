package project.com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import project.com.entity.BoardGame;
import project.com.entity.ReserveEvent;

public interface ReserveEventRepository extends CrudRepository<ReserveEvent,Long>{

	public List<ReserveEvent> findAll();
	
	public ReserveEvent findByidReserveEvent(int idReserveEvent);


	

}
