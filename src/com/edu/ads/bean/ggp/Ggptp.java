package com.edu.ads.bean.ggp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Table(name="t_ggptp")
@Entity
public class Ggptp {
	@Id
	@GenericGenerator(name="hibernate-uuid",strategy="uuid")
	@Column(name = "c_id", nullable = false, length = 32)
	private String id;
	
	@ManyToOne(cascade={CascadeType.ALL})           
    @JoinColumn(name="ggp_id") 
	private Ggp ggp;
	
	@Column(name = "C_URL", nullable = true, length = 300)
	private String url;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Ggp getGgp() {
		return ggp;
	}

	public void setGgp(Ggp ggp) {
		this.ggp = ggp;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
