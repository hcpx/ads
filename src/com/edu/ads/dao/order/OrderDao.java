package com.edu.ads.dao.order;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.edu.ads.bean.order.Order;
import com.edu.ads.common.page.Page;
import com.edu.ads.dao.imp.DaoSupport;

@Repository
public class OrderDao  extends DaoSupport<Order>{
	
	
	public List<Order> listOrders(Page page,Map<String ,Object> params){
		
		String sql = bulidListSql(page, params);
		return ( List<Order> )getJdbcTemplate().query(sql,  new RowMapper() {
			public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
				Order order = new Order();
				order.setId(rs.getString("id"));
				order.setCount(rs.getInt("count"));
				order.setKssj(rs.getDate("kssj"));
				order.setJssj(rs.getDate("jssj"));
				order.setDdsj(rs.getDate("ddsj"));
				order.setYsrymc(rs.getString("xsrymc"));
				order.setGgplxmc(rs.getString("lxmc"));
				return order;
			}
		});
		
		
	}
	
	private String bulidListSql(Page page,Map<String ,Object> params){
		StringBuffer sql  = new StringBuffer();
		sql.append(" select dd.c_id id, dd.n_count count , ");
        sql.append(" dd.d_kssj kssj,dd.d_jssj jssj,dd.d_ddsj ddsj ");
        sql.append(" ,ry.c_name xsrymc,ggplx.c_mc lxmc");
		sql.append(" from t_ggdd dd,t_ggp ggp,t_ry ry,t_ggplx ggplx ");
		sql.append(" where dd.c_ggpid=ggp.c_id and dd.c_xsry=ry.c_id ");
		sql.append(" and ggp.c_lx=ggplx.c_id ");
		if(params.containsKey("xsryMc")){
			sql.append(" and ry.c_name like  ");
			sql.append("'%").append(params.get("xsryMc"));
			sql.append("%'");
		}
		if(params.containsKey("ggpType")){
			sql.append(" and ggplx.c_mc like  ");
			sql.append("'%").append(params.get("ggpType"));
			sql.append("%'");
		}
		sql.append(" order by dd.d_ddsj desc");		
		sql.append("limit ").append(page.getStartIndex());
		sql.append(",").append(page.getPageLength());
		return sql.toString();
		
	}

}
