package meminfoVO;

import java.util.Date;

public class Review_VO {
	private int num; //no
	   private String title; //제목
	   private String id; //작성자
	   private int star; //별점갯수
	   private Date d; //작성일
	   private String content2; //내용
	   private String file2; //파일
	   private int ref; // 글그룹
	   private int res; // 글스텝
	   private int rel; // 글레벨
	
	public Review_VO(int num, String title, String id, int star, Date d, String content2, String file2, int ref, int res, int rel) {
		super();
		this.num = num;
		this.title = title;
		this.id = id;
		this.star = star;
		this.d = d;
		this.content2 = content2;
		this.file2 = file2;
		this.ref = ref;
		this.res = res;
		this.rel = rel;
	}
	
	public Review_VO() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}

	public String getContent2() {
		return content2;
	}

	public void setContent2(String content2) {
		this.content2 = content2;
	}

	public String getFile2() {
		return file2;
	}

	public void setFile2(String file2) {
		this.file2 = file2;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRes() {
		return res;
	}

	public void setRes(int res) {
		this.res = res;
	}

	public int getRel() {
		return rel;
	}

	public void setRel(int rel) {
		this.rel = rel;
	}

}
