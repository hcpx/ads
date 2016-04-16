package com.edu.ads.service.ad;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.ads.bean.ggp.Ggp;
import com.edu.ads.bean.ggp.GgpType;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.dao.ad.GgpDao;
import com.edu.ads.dao.ad.GgpTypeDao;
import com.edu.ads.dao.ad.GgptpDao;

@Service
public class AdService {
	@Autowired
	private GgpTypeDao ggpTypeDao;
	@Autowired
	private GgpDao ggpDao;
	@Autowired
	private GgptpDao ggptpDao;
	public PageResult<GgpType> ggTypeList(Map<String,Object> params,Page page,String ordery){
		return ggpTypeDao.getList(page.getStartIndex(), page.getPageLength(), params, ordery);
	}
	
	/**
	 * 新增广告类型
	 * @param user
	 */
	public void addggpType(GgpType ggpType){
		ggpTypeDao.save(ggpType);
	}
	
	/**
	 * 更新广告类型
	 * @param id
	 * @return User
	 */
	public void updateGgp(GgpType ggpType){
		ggpTypeDao.update(ggpType);
	}
	
	/**
	 * 查找广告类型
	 * @param id
	 * @return User
	 */
	public GgpType findggpType(String id){
		return ggpTypeDao.find(id);
	}
	
	/**
	 * 查找广告类型
	 * @param id
	 * @return User
	 */
	public void delete(GgpType ggpType) {
		ggpTypeDao.delete(ggpType);
	}
	
	/**
	 * 找到所有广告类型
	 * @param id
	 * @return User
	 */
	public List<GgpType> getAllGgType() {
		return ggpTypeDao.getAllgglx();
	}
	
	/**
	 * 找到所有广告类型总条数
	 * @param id
	 * @return User
	 */
	public int getAllTypeCount() {
		int count=(int)ggpTypeDao.getCount();
		return count;
	}
	
	/*=======================================广告牌==============================================*/
	/**
	 * 新增广告牌
	 * @param user
	 */
	public void addggp(Ggp ggp){
		ggpDao.save(ggp);
	}
}
