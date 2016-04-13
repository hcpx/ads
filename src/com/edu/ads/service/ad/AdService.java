package com.edu.ads.service.ad;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.ads.bean.ggp.GgpType;
import com.edu.ads.common.page.Page;
import com.edu.ads.common.page.PageResult;
import com.edu.ads.dao.ad.GgpTypeDao;

@Service
public class AdService {
	@Autowired
	private GgpTypeDao ggpTypeDao;
	public PageResult<GgpType> ggTypeList(Map<String,Object> params,Page page,String ordery){
		return ggpTypeDao.getList(page.getStartIndex(), page.getPageLength(), params, ordery);
	}
}
