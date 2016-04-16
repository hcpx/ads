package com.edu.ads.bean.ggp;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Table(name="t_ggp")
@Entity
public class Ggp {
	@Id
	@GenericGenerator(name="hibernate-uuid",strategy="uuid")
	@Column(name = "c_id", nullable = false, length = 32)
	private String id;
	
	@ManyToOne(cascade={CascadeType.ALL})           
    @JoinColumn(name="c_lx")
	private GgpType lx;
	
	@Column(name = "c_ms", nullable = true, length = 900)
	private String ms;
	
	@Column(name = "n_jg", nullable = true, length = 11)
	private double jg;
	
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

	public GgpType getLx() {
		return lx;
	}

	public void setLx(GgpType lx) {
		this.lx = lx;
	}

	public String getMs() {
		return ms;
	}

	public void setMs(String ms) {
		this.ms = ms;
	}

	public double getJg() {
		return jg;
	}

	public void setJg(double jg) {
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
