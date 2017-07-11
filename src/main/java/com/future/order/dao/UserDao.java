/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 上午10:29:02   
 * @Description:  
 * 
 */  
package com.future.order.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Tables;
import com.future.order.entity.User;
import com.future.order.service.IUserService;
import com.future.order.util.PageCut;

@Service
public class UserDao extends BaseDao<User> implements IUserService {

	public User login(String phone, String password) {	//登录
		String hql = "from User where phone='"+phone+"'and password= '"+password+"'";
		return (User)this.uniqueResult(hql);

	}
	
	@Override
	public boolean addUser(User user) {
		String hql = "from User where phone='"+user.getPhone()+"'";
		User userDataBase = (User) this.uniqueResult(hql);
		if(userDataBase==null){
			Date date  = new Date();
			user.setCreateDate(date);
			this.saveEntity(user);
			return true;
		}
		return false;
	}

	@Override
	public List<User> selectAllUser() {//查找所有用户
		List<User> list = this.selectAll();
		return list;
	}

	@Override
	public User viewUser(int id ){
		User user = this.getEntity(id);
		return user;
	}
	@Override
	public boolean updateUser(User user) {	//修改用户信息
		return this.updateEntity(user);
	}
	@Override
	public boolean deleteUser(User user) {
		return this.deleteEntity(user);
	}

	@Override
	public PageCut<User> getPageCut(int curr,int pageSize,String ask,String inquiry) {
		System.out.println("ask"+ask+"  inquiry:"+inquiry);
		String hql = "select count(*) from User";
		String selectHql =  "from User";
		if(ask!=null&&ask.equals("phone")){
			hql = "select count(*) from User u where u.phone= '"+inquiry+"'";
			selectHql = "from User where phone = '"+inquiry+"'";
		} else if(ask!=null&&ask.equals("manager")) {
			hql = "select count(*) from User u where u.sort= 'manager'";
			selectHql = "from User where sort = 'manager'";
		} else if(ask!=null&&ask.equals("cook")){
			hql = "select count(*) from User u where u.sort= 'cook'";
			selectHql = "from User where sort = 'cook'";
		}
		int count = ((Long) this.uniqueResult(hql)).intValue();
		PageCut<User> pc = new PageCut<User>(curr,pageSize,count);
		pc.setData(this.getEntityLimitList(selectHql, (curr-1)*pageSize, pageSize));
		return pc;
	}
}
