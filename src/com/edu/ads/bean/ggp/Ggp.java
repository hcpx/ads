package com.edu.ads.bean.ggp;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Table(name="t_ggp")
@Entity
public class Ggp {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c_id", nullable = false, length = 32)
	private String id;
	
	@ManyToOne(cascade={CascadeType.ALL})           
    @JoinColumn(name="ggplx_id") 
	private Ggplx lx;
	
	@Column(name = "c_ms", nullable = true, length = 900)
	private String ms;
	
	@Column(name = "n_jg", nullable = true, length = 11)
	private int jg;
	
	@Column(name = "n_zt", nullable = true, length = 11)
	private int zt;
	
	@Column(name = "c_tjry", nullable = true, length = 900)
	private String tjry;
	
	@OneToMany(cascade=CascadeType.ALL,mappedBy="ggp")    
	private Set<Ggptp> ggptps;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}


	public Ggplx getLx() {
		return lx;
	}

	public void setLx(Ggplx lx) {
		this.lx = lx;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public int getJg() {
		return jg;
	}

	public void setJg(int jg) {
		this.jg = jg;
	}

	public int getZt() {
		return zt;
	}

	public void setZt(int zt) {
		this.zt = zt;
	}

	public String getTjry() {
		return tjry;
	}

	public void setTjry(String tjry) {
		this.tjry = tjry;
	}

	public Set<Ggptp> getGgptps() {
		return ggptps;
	}

	public void setGgptps(Set<Ggptp> ggptps) {
		this.ggptps = ggptps;
	}
	
	
}
