package com.edu.ads.bean.user;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Table(name="t_ry")
@Entity
public class User {

	@Id
	@GenericGenerator(name="hibernate-uuid",strategy="uuid")
	@Column(name = "c_id", nullable = false, length = 32)
	private String id;
	
	/**
	 * 用户姓名
	 */
	@Column(name = "c_name", nullable = true, length = 300)
	private String name;
	
	@Column(name = "n_type", nullable = true, length = 11 )
	private int type;

	@Column(name = "c_username", nullable = false, length = 300 )
	private String userName;
	
	@Column(name = "c_password", nullable = false, length = 300 )
	private String password;
	
	@Column(name = "d_createDate", nullable = false, length = 300 )
	private Date createDate;
	
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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
}
