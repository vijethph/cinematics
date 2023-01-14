package io.github.cinematics.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Actor_awards {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	
	private String actor_name;
	
	private String award1;
	private String award2;
	private String award3;
	public String getActor_name() {
		return actor_name;
	}
	public void setActor_name(String actor_name) {
		this.actor_name = actor_name;
	}
	public String getAward1() {
		return award1;
	}
	public void setAward1(String award1) {
		this.award1 = award1;
	}
	public String getAward2() {
		return award2;
	}
	public void setAward2(String award2) {
		this.award2 = award2;
	}
	public String getAward3() {
		return award3;
	}
	public void setAward3(String award3) {
		this.award3 = award3;
	}
	
	
	
}
