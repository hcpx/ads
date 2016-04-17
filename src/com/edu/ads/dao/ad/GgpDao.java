package com.edu.ads.dao.ad;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.edu.ads.bean.ggp.Ggp;
import com.edu.ads.dao.imp.DaoSupport;

@Repository
public class GgpDao extends DaoSupport<Ggp>{
	public List<Ggp> getAllgg(){
		return findListForList("from Ggp");
	}
}
