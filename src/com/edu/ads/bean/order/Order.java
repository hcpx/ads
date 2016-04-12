package com.edu.ads.bean.order;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Table(name="t_ggdd")
@Entity
public class Order {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "c_id", nullable = false, length = 32)
	private String id;
	
	/**
	 * 客户联系人
	 */
	@Column(name = "c_khlxr", nullable = true, length = 300)
	private String khlxr;
	
	/**
	 * 客户联系电话
	 */
	@Column(name = "c_khlxdh", nullable = true, length = 300)
	private String khlxrdh;
	

	/**
	 * 开始时间
	 */
	@Column(name = "d_kssj", nullable = true)
	private Date kssj;
	
	/**
	 * 结束时间
	 */
	@Column(name = "d_jssj", nullable = true)
	private Date jssj;
	
	@Column(name = "n_count", nullable = true)
	private double count;
	
	/**
	 * 外键销售人员
	 */
	@Column(name = "c_xsry", nullable = true, length = 300)
	private String xsry;
	
	/**
	 * 外键广告牌
	 */
	@Column(name = "c_xsry", nullable = true, length = 300)
	private String ggpid;
	
	/**
	 * 订单时间
	 */
	@Column(name = "n_count", nullable = true)
	private Date ddsj;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKhlxr() {
		return khlxr;
	}

	public void setKhlxr(String khlxr) {
		this.khlxr = khlxr;
	}

	public String getKhlxrdh() {
		return khlxrdh;
	}

	public void setKhlxrdh(String khlxrdh) {
		this.khlxrdh = khlxrdh;
	}

	public Date getKssj() {
		return kssj;
	}

	public void setKssj(Date kssj) {
		this.kssj = kssj;
	}

	public Date getJssj() {
		return jssj;
	}

	public void setJssj(Date jssj) {
		this.jssj = jssj;
	}

	public double getCount() {
		return count;
	}

	public void setCount(double count) {
		this.count = count;
	}

	public String getXsry() {
		return xsry;
	}

	public void setXsry(String xsry) {
		this.xsry = xsry;
	}

	public String getGgpid() {
		return ggpid;
	}

	public void setGgpid(String ggpid) {
		this.ggpid = ggpid;
	}

	public Date getDdsj() {
		return ddsj;
	}

	public void setDdsj(Date ddsj) {
		this.ddsj = ddsj;
	}
	
}
