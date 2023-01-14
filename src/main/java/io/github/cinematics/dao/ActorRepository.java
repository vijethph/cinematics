package io.github.cinematics.dao;

import io.github.cinematics.model.Actor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface ActorRepository extends JpaRepository<Actor,Integer>{
	
	@Query("SELECT a,w from Actor a,Actor_awards w WHERE a.name=w.actor_name AND a.name=?1")
	List<Object[]> findByActorName(@Param("name") String name);

}
