package project.com.repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import project.com.entity.BoardGame;
import project.com.entity.TableCafe;

public interface TableCafeRepository extends CrudRepository<TableCafe,Long>{
	
	public List<TableCafe> findAll();

	public TableCafe findByidTable(int idTable);
	
	public List<TableCafe> findByZone(String zone);
	

	  
	  @Query(nativeQuery=true, value="SELECT idtable,zone FROM tablecafe  WHERE cafe_namecafe like %:name% ORDER BY zone")
		public List<TableCafe> getTablebyname(@Param("name")String name);
		
}
