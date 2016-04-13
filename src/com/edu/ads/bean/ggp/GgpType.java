package com.edu.ads.bean.ggp;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Table(name="t_ggplx")
@Entity
public class GgpType {
	@Id
	@GenericGenerator(name="hibernate-uuid",strategy="uuid")
	@Column(name = "c_id", nullable = false, length = 32)
	private String id;
	
	@Column(name = "C_MC", nullable = true, length = 300)
	private String mc;
	
	@Column(name = "C_MS", nullable = false, length = 900)
	private String ms;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="lx")
	private Set<Ggp> ggps;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Set<Ggp> getGgps() {
		return ggps;
	}

	public void setGgps(Set<Ggp> ggps) {
		this.ggps = ggps;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public String getMc() {
		return mc;
	}

	public void setMc(String mc) {
		this.mc = mc;
	}
}
