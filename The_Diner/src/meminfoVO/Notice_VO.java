package meminfoVO;

import java.util.Date;

public class Notice_VO {
	private int num; //no
	private String title; //제목
	private String id; //작성자
	private Date d; //작성일
	private int cnt_ck1; //조회수
	private String content1; //글내용
	private String file1; //첨부파일 경로
	
	public Notice_VO(int num, String title, String id, Date d, int cnt_ck1, String content1, String file1) {

		this.num = num;
		this.title = title;
		this.id = id;
		this.d = d;
		this.cnt_ck1 = cnt_ck1;
		this.content1 = content1;
		this.file1 = file1;
	}
	
	public Notice_VO() {}


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

	public int getCnt_ck1() {
		return cnt_ck1;
	}

	public void setCnt_ck1(int cnt_ck1) {
		this.cnt_ck1 = cnt_ck1;
	}

	public String getContent1() {
		return content1;
	}

	public void setContent1(String content1) {
		this.content1 = content1;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}
	

}
