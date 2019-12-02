package com.project.dbms;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class Actor {
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		
		private String name;
		
		private String dob;
		
		private Integer age;
		
		private String gender;
		
		private String file_path;
		
		public String getName(){
			return name;
		}

		public String getDob(){
			return dob;
		}
		
		public Integer getAge(){
			return age;
		}
		
		public String getGender(){
			return gender;
		}

		public void setName(String name) {
			this.name = name;
		}

		public void setDob(String dob) {
			this.dob = dob;
		}

		public void setAge(Integer age) {
			this.age = age;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public String getFile_path() {
			return file_path;
		}

		public void setFile_path(String file_path) {
			this.file_path = file_path;
		}
		
}
