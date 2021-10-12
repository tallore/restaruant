package meminfoVO;

public class MenuVO {
	private int mnum;
	private String menu;
	
	
	private String menudetail;
	private int price;
	
	public MenuVO() {
	}
	
	public MenuVO(int mnum, String menu, String menudetail, int price) {
		this.mnum = mnum;
		this.menu = menu;
		this.menudetail = menudetail;
		this.price = price;
	}
	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getMenudetail() {
		return menudetail;
	}
	public void setMenudetail(String menudetail) {
		this.menudetail = menudetail;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
