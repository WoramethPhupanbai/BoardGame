package project.com.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import project.com.entity.ReserveTable;

public interface ReserveTableRepository extends CrudRepository<ReserveTable,Long>{

	public List<ReserveTable> findAll();
	
	public ReserveTable findByidReserveTable(int idReserveTable);
}
