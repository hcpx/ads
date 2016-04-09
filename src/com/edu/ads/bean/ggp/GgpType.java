package com.edu.ads.bean.ggp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="t_ggplx")
@Entity
public class GgpType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c_id", nullable = false, length = 32)
	private String id;
	
	@Column(name = "c_mc", nullable = true, length = 300)
	private String name;
	
	@Column(name = "c_ms", nullable = true, length = 300)
	private String discription;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}
	
	
	
}
