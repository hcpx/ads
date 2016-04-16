package com.edu.ads.dao.ad;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.ads.bean.ggp.GgpType;
import com.edu.ads.dao.imp.DaoSupport;
@Repository
public class GgpTypeDao extends DaoSupport<GgpType>{
	
	public List<GgpType> getAllgglx(){
		return findListForList("from GgpType");
	}
}
