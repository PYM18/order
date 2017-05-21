/**        
 * @author: 焦祥宇 
 * @date:   createDate：2017年5月21日 下午8:32:57   
 * @Description:  
 * 
 */  
package com.future.order.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tb_stockdetails")
public class StockDetails {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(length=20)
	private int stockId;//进货id
	@Column(length=10)
	private int ingId;//配料id
	@Column(length=10)
	private String ingName;//配料名称
	@Column(length=10)
	private double price;//单价
	@Column(length=10)
	private double num;//数量
	private Date createDate;//进货时间
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the stockId
	 */
	public int getStockId() {
		return stockId;
	}
	/**
	 * @param stockId the stockId to set
	 */
	public void setStockId(int stockId) {
		this.stockId = stockId;
	}
	/**
	 * @return the ingId
	 */
	public int getIngId() {
		return ingId;
	}
	/**
	 * @param ingId the ingId to set
	 */
	public void setIngId(int ingId) {
		this.ingId = ingId;
	}
	/**
	 * @return the ingName
	 */
	public String getIngName() {
		return ingName;
	}
	/**
	 * @param ingName the ingName to set
	 */
	public void setIngName(String ingName) {
		this.ingName = ingName;
	}
	/**
	 * @return the price
	 */
	public double getPrice() {
		return price;
	}
	/**
	 * @param price the price to set
	 */
	public void setPrice(double price) {
		this.price = price;
	}
	/**
	 * @return the num
	 */
	public double getNum() {
		return num;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(double num) {
		this.num = num;
	}
	/**
	 * @return the createDate
	 */
	public Date getCreateDate() {
		return createDate;
	}
	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@Override
	public String toString() {
		return "StockDetails [id=" + id + ", stockId=" + stockId + ", ingId=" + ingId + ", ingName=" + ingName
				+ ", price=" + price + ", num=" + num + ", createDate=" + createDate + "]";
	}	
}
