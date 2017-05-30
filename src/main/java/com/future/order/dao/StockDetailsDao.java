/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月22日 上午10:46:40   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.StockDetails;
import com.future.order.service.IStockDetailsService;
import com.future.order.util.PageCut;

@Service
public class StockDetailsDao extends BaseDao<StockDetails> implements IStockDetailsService {

	@Override
	public PageCut<StockDetails> getPageCut(int currentPage, int pageSize, int stockid) {
		String hql ;
		int count=0;
		hql = "select count(*) from StockDetails o where o.stockId='"+stockid+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<StockDetails> pc = new PageCut<StockDetails>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from StockDetails o where o.stockId='"+stockid+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public boolean DeletStockDetails(int id) {
		boolean sign = false;
		try{
			String hql="delete from StockDetails o Where o.stockId='"+id+"'";
			int mark=this.executeUpdate(hql);
		if(mark==1){
			sign=true;
		}else{
			sign=false;
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

}
