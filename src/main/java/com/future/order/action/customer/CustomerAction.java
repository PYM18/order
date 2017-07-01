package com.future.order.action.customer;


import java.util.List;


import com.future.order.base.BaseAction;

import com.future.order.entity.Menu;
import com.future.order.entity.MenuMaterial;

import com.future.order.entity.ShopCart;
import com.future.order.entity.StockDetails;

/**
 * @author 安李杰 
 *
 */

public class CustomerAction extends BaseAction {

	/**这里写了用于对于菜单的信息显示获取菜单的详细信息的action
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private int id;
		
	//进入首页
	public String toIndex() throws Exception{
		//假定桌号为1,金高加
		id = 1;
		//把顾客桌号存在session
		session.put("userId", id);
		System.out.println("桌号:"+id);
		//获得推荐的菜品
		List<Menu> menus=menuService.getRecommend(8);
		session.put("menus", menus);
		return "toIndex";
	}
	//根据菜品类型id获得菜品
	public String getMenuByTypeId() throws Exception{
		List<Menu> menus=menuService.getByTypeId(id);
		session.put("menus", menus);
		return "getMenuByTypeId";
	}
	//获得菜品详情和菜品配料
	public String getMenuMaterial() throws Exception {		
		Menu menu =menuService.get(id);
		request.put("menu", menu);
		List<MenuMaterial> menumaterials=menuMaterialService.getByMenuId(id);		
		request.put("menumaterials",menumaterials);	
		return "getMenuMaterial";
	}
	//获得进货时间列表
	public String getStockDate() throws Exception {
		List<StockDetails> stockDetails=stockDetailsService.getByIngId(id,5);
		request.put("stockDetails", stockDetails);
		return "getStockDate";
	}
	//加入购物车
	public String joinCart() throws Exception {
		Menu menu=menuService.get(id);
<<<<<<< HEAD
		int tableId=(int) session.get("userId");//获得顾客桌号		
		String tableName=tablesService.get(tableId).getName();//根据顾客桌号取得桌子的名称	
		ShopCart shopCart=shopCartService.getByT_M_Id(tableId, menu.getId());//根据顾客的桌号和菜单的id获得购物车中的对应信息
=======
		int tableId=(int) session.get("userId");	
		String tableName=tablesService.get(tableId).getName();	
		ShopCart shopCart=shopCartService.getByT_M_Id(tableId, menu.getId());
>>>>>>> 16a25f24e8b093782a2c8ae8ec4e7dc44c940041
		if(shopCart==null){
			shopCart=new ShopCart(tableId, tableName, id, menu.getName(), 1, menu.getPrice());		
		}else{
			shopCart.setMenuNum(shopCart.getMenuNum()+1);
		}
		Boolean bool=shopCartService.update(shopCart);
		if(bool==true){
			request.put("addMeg", "添加成功！");
		}else{
			request.put("addMeg", "添加失败！");
		}

		return "joinCart";
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
