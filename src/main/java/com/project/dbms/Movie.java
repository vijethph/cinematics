package com.project.dbms;
import java.math.BigInteger;

import javax.persistence.*;

@Entity
@NamedStoredProcedureQueries({
	@NamedStoredProcedureQuery(
			name="checkProfitLoss",
			procedureName="CHECK_PROFIT_OR_LOSS",
			resultClasses= {Movie.class},
			parameters= {
					@StoredProcedureParameter(
							name="budget",
							type=BigInteger.class,
							mode=ParameterMode.IN),
					@StoredProcedureParameter(
							name="gross",
							type=BigInteger.class,
							mode=ParameterMode.IN),
					@StoredProcedureParameter(
							name="diff",
							type=BigInteger.class,
							mode=ParameterMode.OUT),
					@StoredProcedureParameter(
							name="msg",
							type=String.class,
							mode=ParameterMode.OUT),
			})
})
public class Movie {

			@Id
			@GeneratedValue(strategy=GenerationType.AUTO)
			
			private Integer movie_id;
			
			private String title;
			
			private Integer length;
			
			private String release_date;
			
			private float rating;
			
			private String language;
			
			private BigInteger budget;
			
			private BigInteger gross;
			/*
			@ManyToOne
			@JoinColumn(name="name")
			private Production_Company production_company;
			
			public Production_Company getProduction_company() {
				return production_company;
			}

			public void setProduction_company(Production_Company production_company) {
				this.production_company = production_company;
			}
*/
			private String company_name;
			
			private String file_path;
			
			
			public Integer getMovie_id() {
				return movie_id;
			}

			public void setMovie_id(Integer movie_id) {
				this.movie_id = movie_id;
			}

			public String getTitle(){
				return title;
			}
			
			public void setTitle(String title) {
				this.title = title;
			}
			
			public Integer getLength(){
				return length;
			}
			
			public void setLength(Integer length) {
				this.length = length;
			}

			public String getRelease_date() {
				return release_date;
			}

			public void setRelease_date(String release_date) {
				this.release_date = release_date;
			}

			public float getRating() {
				return rating;
			}

			public void setRating(float rating) {
				this.rating = rating;
			}

			public String getLanguage() {
				return language;
			}

			public void setLanguage(String language) {
				this.language = language;
			}

			public BigInteger getBudget() {
				return budget;
			}

			public void setBudget(BigInteger budget) {
				this.budget = budget;
			}

			public BigInteger getGross() {
				return gross;
			}

			public void setGross(BigInteger gross) {
				this.gross = gross;
			}

			public String getCompany_name() {
				return company_name;
			}

			public void setCompany_name(String company_name) {
				this.company_name = company_name;
			}

			public String getFile_path() {
				return file_path;
			}

			public void setFile_path(String file_path) {
				this.file_path = file_path;
			}
			
}
