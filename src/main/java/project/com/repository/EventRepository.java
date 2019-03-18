package project.com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import project.com.entity.Event;

public interface EventRepository extends CrudRepository<Event,Long>{
	
	//public List<Event> findAll();

	public Event findByidEvent(int idEvent);
	
	@Query(nativeQuery=true, value="SELECT * FROM event ORDER BY event_date ASC")
    public List<Event> findAll();
}

