/*
	Vehicle.java

    SJSU - CS160 - Strangers

	May-5-2015
*/

package carmatch.beans;

import java.io.Serializable;

/**
 * Java Bean for a vehicle listing.
 * Only implements enough for display in search result
 */
public class Vehicle implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private long code;
	private long seller;
	private int price;
	private String maker;
	private String model;
	
	public Vehicle() 
	{
	}
	
	public long getCode() 
	{
		return code;
	}
	
	public void setCode(long code) 
	{
		this.code = code;
	}
	
	public long getSeller() 
	{
		return seller;
	}
	
	public void setSeller(long seller) 
	{
		this.seller = seller;
	}

	public int getPrice() 
	{
		return price;
	}

	public void setPrice(int price) 
	{
		this.price = price;
	}
	
	public String getMaker() 
	{
		return maker;
	}

	public void setMaker(String maker) 
	{
		this.maker = maker;
	}
	
	public String getModel() 
	{
		return model;
	}

	public void setModel(String model) 
	{
		this.model = model;
	}
}