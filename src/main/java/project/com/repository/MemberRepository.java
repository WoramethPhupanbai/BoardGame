package project.com.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import project.com.entity.Member;

public interface MemberRepository extends CrudRepository<Member,Long>{

	public List<Member> findAll();
	
	public Member findByStatus(String status);
	
	public Member findByEmail(String email);
	
	@Query("Select u from Member u where u.email = ?1")
	Member checkDup(String idmember);
	
//	@Query("Select u from Member u where u.phone = ?1 and u.password =?2")
//	Drivers login(String phone, String password);

}
