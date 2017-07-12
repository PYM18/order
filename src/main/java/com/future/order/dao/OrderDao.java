/**        
 * @author: 焦祥宇 马黎明
 * @date:   createDate：2017年5月22日 上午10:48:47   
 * @Description:  
 * 
 */ 
package com.future.order.dao;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import com.future.order.base.BaseDao;
import com.future.order.entity.Order;
import com.future.order.service.IOrderService;
import com.future.order.util.PageCut;
@Service
public class OrderDao extends BaseDao<Order> implements IOrderService {

	@Override
	public List<Order> getAll() {

		List<Order> list = new ArrayList<Order>();
		try{
			String hql="from Order as a order by a.createDate asc";
			list=this.getEntityList(hql);
			System.out.println(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(list);   
		return list;

	}
	@Override
	public boolean DeletOrder(int id) {
		boolean sign = false;
		try{
			String hql="delete from Order o Where o.id='"+id+"'";
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

	@Override
	public boolean PayOrder(int id) {
		boolean sign=false;
		try{
			String status="已付款";
			String hql="update from Order o set o.status='"+status+"' Where o.id='"+id+"'";
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
//wqj
	@Override
	public boolean updetemenu(int id){
		Order order = this.getEntity(id);
		String status="处理中";
		order.setStatus(status);
		boolean menus = this.updateEntity(order);
		return true;
	}
	@Override
	public List<Order> finish(){
		List<Order> list = new ArrayList<Order>();
		 String status="已付款";
		String hql="from Order o where o.status='"+status+"'";
		String hql1="from Order as a order by a.createDate asc ";
		list=this.getEntityList(hql);
		list=this.getEntityList(hql1);
		return list;
	}
	@Override
	public PageCut<Order> getPagee(int currentPage, int pageSize) {
		String status="已付款";
		String hql ;
		int count=0;
		hql = "select count(*) from Order o where o.status='"+status+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order as o order by o.createDate asc", (currentPage-1)*pageSize, pageSize));
		pc.setData(this.getEntityLimitList("from Order o where o.status='"+status+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}
	@Override
	public PageCut<Order> getPageee(int currentPage, int pageSize) {
		String status1="未处理";
		String status2="未付款";
		String status3="处理中";
		String hql ;
		int count=0;
		hql = "select count(*) from Order o where o.status='"+status1+"' or o.status='"+status2+"' or o.status='"+status3+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order as o order by o.createDate asc", (currentPage-1)*pageSize, pageSize));
		pc.setData(this.getEntityLimitList("from Order o where o.status='"+status1+"' or o.status='"+status2+"' or o.status='"+status3+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}
	
	@Override
	public Order CheckById(int id) {
		@SuppressWarnings("unused")
		Order order = new Order();
		try{
			String hql="from Order o where o.id='"+id+"'";
			order=(Order) this.uniqueResult(hql);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public boolean UpdateOrder(Order orders) {
		boolean sign=false;
		try{
			sign=this.updateEntity(orders);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return sign;
	}

	@Override
	public PageCut<Order> getPageCut(int currentPage, int pageSize) {
		String hql ;
		int count=0;
		hql = "select count(*) from Order";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order as o order by o.createDate asc", (currentPage-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public PageCut<Order> getNoPageCut(int currentPage, int pageSize) {
		String statuss="未付款";
		String hql ;
		int count=0;
		hql = "select count(*) from Order o where o.status='"+statuss+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order o where o.status='"+statuss+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}

	@Override
	public PageCut<Order> getPage(int currentPage, int pageSize) {
		String status="已付款";
		String hql ;
		int count=0;
		hql = "select count(*) from Order o where o.status='"+status+"'";
		count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<Order> pc = new PageCut<Order>(currentPage, pageSize, count);
		pc.setData(this.getEntityLimitList("from Order o where o.status='"+status+"'", (currentPage-1)*pageSize, pageSize));
		return pc;
	}
	@Override
	public Order get(int tableId) {
		String hql="from Order s where s.tableId="+tableId;
		List<Order> order=this.getEntityList(hql);
		if(order.size()>0){
			return (Order)order.toArray()[0];
		}
		else{
			return null;
		}	
	}
	@Override
	public Boolean update(Order order) {
		return this.updateEntity(order);
	}
	@Override
	public Boolean save(Order order) {
		return this.saveEntity(order);
	}
	@Override
	public List<Order> getFinal(int tableId,int num) {
		String sql="select * from tb_order s where s.tableId="+tableId+" order by total desc limit "+num;
		return this.executeSQLQuery(sql);
	}
	@Override
	public boolean deleteOrder(int tableId) {
		boolean li = false;
		try{
			String hql="delete from Order o Where o.tableId='"+tableId+"'";
			int mark=this.executeUpdate(hql);
		if(mark==1){
			li=true;
		}else{
			li=false;
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return li;//返回底层方法，底层中有与数据库连接的增删改查的方法。
	}
	@Override
	public List<Order> getOrder(int tableId) {
		String hql="from Order s where s.tableId="+tableId;
		return this.getEntityList(hql);
	}

}
