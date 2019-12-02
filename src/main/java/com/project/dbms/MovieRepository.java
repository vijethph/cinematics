package com.project.dbms;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface MovieRepository extends JpaRepository<Movie,Integer>{
	
	@Query("SELECT m,g FROM Movie m, Movie_genre g WHERE m.movie_id=g.movie_id AND m.title=?1")
	List<Object[]>[] findByMovieTitle(@Param("name") String name);
	
	@Query("SELECT m,g FROM Movie m, Movie_genre g WHERE m.movie_id=g.movie_id")
	List<Object[]>[] findByAllMovies();
	
	@Query("SELECT m,g FROM Movie m, Movie_genre g WHERE m.movie_id=g.movie_id AND m.title=?1 AND m.language=?2 AND (g.genre1=?3 OR g.genre2=?3 OR g.genre3=?3)")
	List<Object[]>[] findByAdvancedSearch(@Param("name") String name, @Param("language") String language, @Param("genre") String genre);
	
	@Query("SELECT m,g FROM Movie m, Movie_genre g, Performed_by a WHERE m.movie_id=g.movie_id AND m.movie_id=a.movie_id AND a.actor_name=?1")
	List<Object[]>[] findByCustomActor(@Param("name") String name);
	
	@Query("SELECT m,g FROM Movie m, Movie_genre g, Directed_by d WHERE m.movie_id=g.movie_id AND m.movie_id=d.movie_id AND d.director_name=?1")
	List<Object[]>[] findByCustomDirector(@Param("name") String name);
	
	@Query("SELECT m,g FROM Movie m, Movie_genre g WHERE m.movie_id=g.movie_id AND m.language=?1")
	List<Object[]>[] findByCustomLanguage(@Param("language") String language);
	
	@Query("SELECT q,m,p,a,d,g FROM Quote q, Movie m, Production_Company p, Performed_by a, Directed_by d, Movie_genre g WHERE m.movie_id=q.movie_id AND m.movie_id=a.movie_id AND m.movie_id=d.movie_id AND p.name=m.company_name AND m.movie_id=g.movie_id AND m.movie_id=?1")
	List<Object[]> findByMovieId(@Param("id") int id);
	
	@Query("SELECT m.budget, m.gross FROM Movie m WHERE m.movie_id=?1")
	List<Object[]> findForProcedure(@Param("id") int id);
	
	@Procedure(name="checkProfitLoss")
	HashMap<String,String> checkProfitOrLoss(@Param("budget") BigInteger budget,@Param("gross") BigInteger gross);
}
/*
	@Query("SELECT m,p FROM Movie m, Production_Company p WHERE p.name=m.company_name AND m.title=?1")
	List<Object[]> findByMovie(@Param("name") String name);

*/
