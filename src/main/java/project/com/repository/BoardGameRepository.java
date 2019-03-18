package project.com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import project.com.entity.BoardGame;

public interface BoardGameRepository extends CrudRepository<BoardGame,Long>{

	//public List<BoardGame> findAll();
	
	public BoardGame findByidBoardGame(int idBoardGame);
	

	public BoardGame findByAgeBoardGame(String ageBoardGame);
	
	//public BoardGame findByNameBoardGame(String nameBoardGame);
	
	
	@Query(nativeQuery=true, value="SELECT * FROM boardgame ORDER BY name_board_game")
    public List<BoardGame> findAll();
	
	
	@Query(nativeQuery=true, value="SELECT * FROM boardgame  WHERE name_board_game like %:name% ORDER BY name_board_game")
	public List<BoardGame> findByNameBoardGame(@Param("name")String nameBoardGame);
	
	
	
}
