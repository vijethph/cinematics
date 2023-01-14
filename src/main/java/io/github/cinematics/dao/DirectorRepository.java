package io.github.cinematics.dao;
import java.util.List;

import io.github.cinematics.model.Director;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface DirectorRepository extends JpaRepository<Director,Integer>{
	
	@Query("SELECT d from Director d WHERE d.name=?1")
	List<Object[]> findByDirectorName(@Param("name") String name);

}
