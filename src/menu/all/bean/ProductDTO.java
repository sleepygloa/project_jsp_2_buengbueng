package menu.all.bean;

import java.sql.Date;
import java.sql.Timestamp;

public class ProductDTO {
	private String code;
	private String name;
	private Date lastday;
	private int salecheck;
	private Timestamp beginregist;
	private String l_key;
	

	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getL_key() {
		return l_key;
	}
	public void setL_key(String l_key) {
		this.l_key = l_key;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getLastday() {
		return lastday;
	}
	public void setLastday(Date lastday) {
		this.lastday = lastday;
	}
	public int getSalecheck() {
		return salecheck;
	}
	public void setSalecheck(int salecheck) {
		this.salecheck = salecheck;
	}
	public Timestamp getBeginregist() {
		return beginregist;
	}
	public void setBeginregist(Timestamp beginregist) {
		this.beginregist = beginregist;
	}
}
