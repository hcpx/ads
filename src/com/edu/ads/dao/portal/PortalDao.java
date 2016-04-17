package com.edu.ads.dao.portal;

import com.edu.ads.bean.order.Order;
import com.edu.ads.dao.imp.DaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by R on 2016/4/17.
 */
@Repository
public class PortalDao extends DaoSupport<Order> {

    public List<Order> getAdsOrderRankList(){
        String sql = "select t.c_xsry,t.total_price from (\n" +
                "SELECT t1.c_xsry,SUM(t2.n_jg) total_price FROM `t_ggdd` t1,`t_ggp` t2 where t1.c_ggpid=t2.c_id GROUP BY t1.c_xsry,t2.n_jg ) t\n" +
                "order by t.total_price";
        List<Order> list = (List<Order>)getHibernateTemplate().find(sql);
        return list;
    }

}
