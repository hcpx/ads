package com.edu.ads.service.portal;

import com.edu.ads.bean.order.Order;
import com.edu.ads.dao.portal.PortalDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by R on 2016/4/17.
 */
@Service
public class PortalService {

    @Autowired
    private PortalDao portalDao;

    /**
     * 查询销售排行数据
     * @return
     */
    public List<Order> getAdsOrderRankList(){
        return portalDao.getAdsOrderRankList();
    }

}
