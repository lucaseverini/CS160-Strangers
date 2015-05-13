/*
	Vehicle.java

    SJSU - CS160 - Strangers

	May-5-2015
*/

package carmatch.beans;

import java.io.Serializable;

/**
 * Java Bean for a vehicle listing.
 * Only implements enough for display in search results; add more as more of the
 * application is implemented.
 */
public class Vehicle implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private long id;
	private int price;		// Price in cents
	private String maker;
	private String model;
	
	public Vehicle() 
	{
	}
	
	public long getId() 
	{
		return id;
	}
	
	public void setId(long id) 
	{
		this.id = id;
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