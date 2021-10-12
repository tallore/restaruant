package meminfoVO;

import java.util.Date;


//VO (Value Object) 

public class ReserveVO {

	
	private int rnum;		//number(5)	
	private Date rdate;	 	//date
	private String rtime;    //varchar2(20)
	private String rname;	//varchar2(15)
	private String rtel;	//varchar2(20)
	private String setmenu;	//varchar2(60)
	private int people;  //number(2)
	private String require; //varchar2(100)
	private int totalprice; //number(7)
	private String payway; 	//varchar2(30)
	private String payyn;	 //char(1)
	
	
	public ReserveVO(int rnum, Date rdate, String rtime, String rname, String rtel, String setmenu, int people,
			String require, int totalprice, String payway, String payyn) {
		this.rnum = rnum;
		this.rdate = rdate;
		this.rtime = rtime;
		this.rname = rname;
		this.rtel = rtel;
		this.setmenu = setmenu;
		this.people = people;
		this.require = require;
		this.totalprice = totalprice;
		this.payway = payway;
		this.payyn = payyn;
	}
	
	public ReserveVO(String rname, Date rdate, String rtime, String rtel, String menu, int people,
			String require, int price) {
		this.rname = rname;
		this.rdate = rdate;
		this.rtime = rtime;
		this.rtel = rtel;
		this.setmenu = menu;
		this.people = people;
		this.require = require;
		this.totalprice = price;
	}

	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRtel() {
		return rtel;
	}
	public void setRtel(String rtel) {
		this.rtel = rtel;
	}
	public String getSetmenu() {
		return setmenu;
	}
	public void setSetmenu(String setmenu) {
		this.setmenu = setmenu;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getRequire() {
		return require;
	}
	public void setRequire(String require) {
		this.require = require;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setPrice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getPayway() {
		return payway;
	}
	public void setPayway(String payway) {
		this.payway = payway;
	}
	public String getPayyn() {
		return payyn;
	}
	public void setPayyn(String payyn) {
		this.payyn = payyn;
	}
		
	
}