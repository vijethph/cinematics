package io.github.cinematics.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Also_An {
@Id
@GeneratedValue(strategy=GenerationType.AUTO)
	private String director_name;

public String getActor_name() {
	return actor_name;
}

public void setActor_name(String actor_name) {
	this.actor_name = actor_name;
}

public String getDirector_name() {
	return director_name;
}

public void setDirector_name(String director_name) {
	this.director_name = director_name;
}
	private String actor_name;
}
