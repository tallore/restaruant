package meminfoVO;

import java.util.Date;

public class Question_VO {
	private int num; //no
	   private String title; //제목
	   private String id; //작성자
	   private Date d; //작성일
	   private int cnt_ck2; //조회수
	   private String content3; //내용
	   private String file3; //파일
	   private int ref; // 글그룹
	   private int res; // 글스텝
	   private int rel; // 글레벨
	
	public Question_VO(int num, String title, String id, Date d, int cnt_ck2, String content3, String file3, int ref, int res, int rel) {
		super();
		this.num = num;
		this.title = title;
		this.id = id;
		this.d = d;
		this.cnt_ck2 = cnt_ck2;
		this.content3 = content3;
		this.file3 = file3;
		this.ref = ref;
		this.res = res;
		this.rel = rel;
	}
	
	public Question_VO() {}
	
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

	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}

	public int getCnt_ck2() {
		return cnt_ck2;
	}

	public void setCnt_ck2(int cnt_ck2) {
		this.cnt_ck2 = cnt_ck2;
	}

	public String getContent3() {
		return content3;
	}

	public void setContent3(String content3) {
		this.content3 = content3;
	}

	public String getFile3() {
		return file3;
	}

	public void setFile3(String file3) {
		this.file3 = file3;
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
