package com.edu.ads.dao;

public interface BaseDao <T> {

	public T find(String id);
	
	public String save(T entity);
	
	public void update(T entity);
	
	public void delete(T entity);
	
	/**
	 * 获取总的记录数
	 */
	public long getCount();
	
	//public List<PageResult<T>> list(Map<String,String> param,int startInde,int maxSize);
	
	
}
