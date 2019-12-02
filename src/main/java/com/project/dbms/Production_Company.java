package com.project.dbms;
import java.util.Set;

import javax.persistence.*;

@Entity
public class Production_Company {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	private String name;
	
	private String address;
	
	@OneToMany(mappedBy="company_name",cascade=CascadeType.ALL)
	private Set<Movie> movies;

	public String getName(){
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress(){
		return address;
	}
	
	public Set<Movie> getMovies() {
		return movies;
	}

	public void setMovies(Set<Movie> movies) {
		this.movies = movies;
	}
	
}
