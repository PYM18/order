package com.future.order.dao;

import org.springframework.stereotype.Service;

import com.future.order.base.BaseDao;
import com.future.order.entity.Restaurant;
import com.future.order.service.IRestaurantService;
/**
 * @author 安李杰
 *
 */

@Service
public class RestaurantDao extends BaseDao<Restaurant>  implements IRestaurantService{

	@Override

	public Restaurant getOne() {
		String hql="from Restaurant";
		Restaurant restaurant=(Restaurant) uniqueResult(hql);
		return restaurant;
	}


	public int Select() {
		return getNum();
	}

	@Override
	public boolean addRestaurant(Restaurant restaurant) {
		return this.saveEntity(restaurant);
	}

	@Override
	public Restaurant SelectAll() {
		String hql="from Restaurant";
		Restaurant restaurant1=(Restaurant) uniqueResult(hql);
		return restaurant1;
	}

	@Override
	public boolean updateRestaurant(Restaurant restaurant) {
		return this.updateEntity(restaurant);
	}

}