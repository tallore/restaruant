package meminfoDAO;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import meminfoDBConn.MemInfoDBConn;
import meminfoVO.Question_VO;


public class Question_DAO {
	
private Connection con;
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	public Question_DAO() throws ClassNotFoundException, SQLException {
		
		con = new MemInfoDBConn().getConnection(); 
		
	}
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) 
			pstmt.close();
	}
	
	public void Question_DAO_Close()
			throws SQLException, IOException {
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(con != null)
			con.close();
	}
	
	
	// 모든 게시글 리턴
	public ArrayList<Question_VO> getAllBoard(int start, int end) throws SQLException {
		ArrayList<Question_VO> tiarray = new ArrayList<Question_VO>();
		String sql = "SELECT * FROM (SELECT A.* ,Rownum Rnum FROM (SELECT * FROM Question_D ORDER BY Reg_RE_QD desc ,Res_RE_QD asc)A)"
				+ "WHERE Rnum >= ? and Rnum <= ?";
		pstmt= con.prepareStatement(sql);
		pstmt.setInt(1,start);
		pstmt.setInt(2,end);
		rs=pstmt.executeQuery(); // 쿼리 실행 후 결과 저장
		while(rs.next()) {	
			Question_VO tv = new Question_VO(
					rs.getInt("Num_QD"),
					rs.getString("Title_QD"),
					rs.getString("id_QD"),
					rs.getDate("Date_QD"),
					rs.getInt("Click_QD"),
					rs.getString("Content_QD"),
					rs.getString("File_QD"),
					rs.getInt("Reg_RE_QD"),
					rs.getInt("Res_RE_QD"),
					rs.getInt("Rel_RE_QD")
					);
			
			tiarray.add(tv);
			
			//자원 반납
			//con.close();
			
		}
		return tiarray;
	}
	
	// Insert
	public void lnsert_Question_D(Question_VO vo) throws SQLException {
		
		//빈클래스에 넘어오지 않은 데이터 초기화
		int ref = 0;// 글 그룹을 의미 = 쿼리를 실행시켜 가장큰 ref 값을 가져온후 +1을 더해주면 된다 
		int res = 1;//새글 = 부모 글
		int rel = 1;
	
		//가장 큰 ref값 읽어 옴
		String refSQL = "SELECT max(Reg_RE_QD) FROM Question_D";
		pstmt = con.prepareStatement(refSQL);
		
		//쿼리를 실행후 결과를 리턴
		 rs = pstmt.executeQuery();	
		
		if(rs.next()){//결과 값이 있다면
			ref = rs.getInt(1)+1;//최대 값에 +1을 더해서 글 그룹을 설정
		}
		
		if(vo.getFile3() != null) { // 첨부파일이 있을시
		// 전체 값 게시글 테이블에 저장
			String sql="INSERT INTO Question_D"
					+ "VALUES(Num_seq_QD.NEXTVAL,?,?,sysdate,0,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//?의 값을 맵핑
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getContent3());
			pstmt.setString(4, vo.getFile3());
			pstmt.setInt(5, vo.getRef());
			pstmt.setInt(6, vo.getRes());
			pstmt.setInt(7, vo.getRel());
		} else {	// 첨부파일이 없을시
			String sql="INSERT INTO Question_D(Num_QD, Title_QD, id_QD, Date_QD, Click_QD, Content_QD, Reg_RE_QD, Res_RE_QD, Rel_RE_QD)"
					+ "VALUES(Num_seq_QD.NEXTVAL,?,?,sysdate,0,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			//?의 값을 맵핑
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getId());
			pstmt.setString(3, vo.getContent3());
			pstmt.setInt(4, vo.getRef());
			pstmt.setInt(5, vo.getRes());
			pstmt.setInt(6, vo.getRel());
		}
		
		//자원 반납
		//con.close();
		
		//쿼리 실행
		int result = pstmt.executeUpdate();
		 
		if(result == 0) {
			System.out.println("insert 실패");
			return;
		}
		
	}

	//BoardInfo 하나의 게시글 리턴하는 메소드
	public Question_VO getOneBoard(int num){	
		//리턴 타입 선언
		Question_VO vo = new Question_VO(num, null, null, null, num, null, null, num, num, num);

		try {
			//조회수 증가 쿼리 
			String readsql = "UPDATE Question_D SET Click_QD = Click_QD+1 WHERE Num_QD=?";
			pstmt = con.prepareStatement(readsql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();	
			
			//쿼리준비
			String sql = "SELECT * FROM Question_D WHERE Num_QD=?";
			//쿼리실행객체 
			//쿼리실행 객체 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				 vo.setNum(rs.getInt(1));
				 vo.setTitle(rs.getString(2));
				 vo.setId(rs.getString(3));
				 vo.setD(rs.getDate(4));
				 vo.setCnt_ck2(rs.getInt(5));
				 vo.setContent3(rs.getString(6));
				 vo.setFile3(rs.getString(7));
				 vo.setRef(rs.getInt(8));
				 vo.setRes(rs.getInt(9));
				 vo.setRel(rs.getInt(10));
			}
			
			//자원 반납
			//con.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return vo;
	}
	
	//Update와 Delete시 하나의 게시글을 리턴
	public Question_VO getOneUpdateBoard(int num){	
		//리턴 타입 선언
		Question_VO vo = new Question_VO(num, null, null, null, num, null, null, num, num, num);

		try {
			//쿼리준비
			String sql = "SELECT * FROM Question_D WHERE Num_QD=?";
			//쿼리실행객체 
			//쿼리실행 객체 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,num);
			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				 vo.setNum(rs.getInt(1));
				 vo.setTitle(rs.getString(2));
				 vo.setId(rs.getString(3));
				 vo.setD(rs.getDate(4));
				 vo.setCnt_ck2(rs.getInt(5));
				 vo.setContent3(rs.getString(6));
				 vo.setFile3(rs.getString(7));
				 vo.setRef(rs.getInt(8));
				 vo.setRes(rs.getInt(9));
				 vo.setRel(rs.getInt(10));
			}
			
			//자원 반납
			//con.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return vo;
	}
	
	//update 와 delete시 필요한 패스워드 값을 리턴해 주는 메소드
	public String getPass(String id) {
		//리턴할 변수 객체 선언 
		String pass = "";
		
		try {		
			//쿼리 준비 
			String sql = "SELECT password FROM memtable WHERE id=?";
			
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			
			//쿼리 실행후 결과를 리턴
			rs= pstmt.executeQuery();
			
			//패스워드 값을 저장
			if(rs.next()) {
				pass = rs.getString(1);	
			}
			
			//자원 반납
			//con.close();
				
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return pass;
	}
	
	//하나의 게시글을 수정하는 메소드
	public void updateBoard(Question_VO vo){
		
		try {	
			String oldFilename = null;
			if ( rs.next() ) {
				oldFilename = rs.getString( "file3" );
			}
			
			if(vo.getFile3() != null) { // 첨부파일 있을 시
			//쿼리 준비 
			String sql = "UPDATE Question_D SET Title_QD=? , Content_QD=? , File_QD=? WHERE Num_QD=?";
			
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1,vo.getTitle());
			pstmt.setString(2,vo.getContent3());
			pstmt.setString(3, vo.getFile3());
			pstmt.setInt(4,vo.getNum());
			} else { // 첨부파일 없을 시
				String sql = "UPDATE Question_D SET Title_QD=? , Content_QD=? WHERE Num_QD=?";
				
				//쿼리 실행할 객체 선언
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1,vo.getTitle());
				pstmt.setString(2,vo.getContent3());
				pstmt.setInt(3,vo.getNum());
			}
			//쿼리 실행후 결과를 리턴
			pstmt.executeUpdate();
			
			//자원 반납
			con.close();
				
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//하나의 게시글을 삭제하는 매소드
	public void deleteBoard(int num) {
		
		try {		
			//쿼리 준비 
			String sql = "DELETE FROM Question_D WHERE Num_QD=?";
			
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			//?
			pstmt.setInt(1,num);
			
			//쿼리 실행
			pstmt.executeUpdate();
			
			//자원 반납
			con.close();
				
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
	//답변글이 저장되는 메소드 
		public void reWriteBoard(Question_VO vo){
			//부모글 그룹과 글레벨 글 스템을 읽어드림 
			int ref = vo.getRef();
			int res = vo.getRes();
			int rel = vo.getRel();
			
			try {
				/////////////////////핵심 코드 //////////////////////// 
					//부모글 보다 큰 re_level의 값을 전부 1씩 증가시켜줌 
					String  levelsql = "UPDATE Question_D SET Rel_RE_QD=Rel_RE_QD+1 WHERE Reg_RE_QD=? and Rel_RE_QD > ?";
					//쿼리 삽입 객체 선언 
					pstmt = con.prepareStatement(levelsql);
					pstmt.setInt(1 , ref);
					pstmt.setInt(2 , rel);
					//쿼리 실행 
					pstmt.executeUpdate();
					//답변글 데이터를 저장
					String sql ="INSERT INTO Question_D VALUES(Num_seq_QD.NEXTVAL,?,?,sysdate,0,?,?,?,?,?)";
					pstmt = con.prepareStatement(sql);
					//?에 값을 대입
					pstmt.setString(1, vo.getTitle());
					pstmt.setString(2, vo.getId());
					pstmt.setString(3, vo.getContent3());
					pstmt.setString(4, vo.getFile3());
					pstmt.setInt(5, ref);//부모의 ref 값을 넣어줌 
					pstmt.setInt(6, res+1);//답글이기에 부모글 re_stop에 1을 넣어줌 
					pstmt.setInt(7, rel + 1);
					
					//쿼리를 실행하시오
					pstmt.executeUpdate();	
					
					//자원 반납
					//con.close();
					
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
	
	public int getAllCount(){
		
		//게시글 전체수를 저장하는 변수 
		int count = 0;
		
		try {		
			//쿼리 준비 
			String sql = "SELECT count(*) FROM Question_D";
			
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			
			//쿼리 실행후 결과를 리턴 
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			//자원 반납
			//con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
}
