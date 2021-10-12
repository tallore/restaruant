package meminfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import meminfoDBConn.MemInfoDBConn;
import meminfoVO.MenuVO;
import meminfoVO.Notice_VO;
import meminfoVO.ReserveVO;


//DAO 

public class ReserveDAO {

	private Connection con;			
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;				
	
	
	public ReserveDAO() throws ClassNotFoundException, SQLException {
		con=new MemInfoDBConn().getConnection(); 
											  	 			
	} 
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) 
			pstmt.close();
	}
	
	public void reserveClose()
			throws SQLException {
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(con != null)
			con.close();
	}
		
	//예약리스트 확인
	public ArrayList<ReserveVO> reserveList () throws SQLException {
		ArrayList<ReserveVO> rslist = new ArrayList<ReserveVO>();
		String sql ="select * from reserve order by rnum";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			int rnum=rs.getInt("rnum");
			Date rdate=rs.getDate("rdate");
			String rtime=rs.getString("rtime");
			String rname=rs.getString("rname");
			String rtel=rs.getString("rtel");
			String setmenu=rs.getString("setmenu");
			int people=rs.getInt("people");
			String require=rs.getString("require");
			int totalprice=rs.getInt("totalprice");
			String payway=rs.getString("payway");
			String payyn=rs.getString("payyn");
			
			ReserveVO rsvo = new ReserveVO(rnum,rdate,rtime,rname,rtel,setmenu,people,require,totalprice,payway,payyn);
			rslist.add(rsvo);
		}//while-end
		
		return rslist;
	}
	
	
	
	//예약 데이터 넣기
	public boolean insert_reserve(String rdate, String rtime, String rname, String rtel, String setmenu, int people, String require, int totalprice) throws SQLException {
		String sql = "insert into reserve(rnum,rdate,rtime,rname,rtel,setmenu,people,require,totalprice) values(rs_seq.nextval,to_date(?,'yyyy-mm-dd'),?,?,?,?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, rdate);
			pstmt.setString(2, rtime);
			pstmt.setString(3, rname);
			pstmt.setString(4, rtel);
			pstmt.setString(5, setmenu);
			pstmt.setInt(6, people);
			pstmt.setString(7, require);
			
			//결제하기
			pstmt.setInt(8, totalprice);
//			pstmt.setString(9, payway);
//			pstmt.setString(10, payyn);
			
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert Exception");
			return false;
		} finally {
			closeAll(rs,pstmt,con);
		}
		return true;
	}
	
	//예약리스트 여러 개 삭제
	public boolean Muldelete_reserve(String[] ckb) throws SQLException {
		String sql = "delete from reserve where rnum = ?";		
		try {
			pstmt = con.prepareStatement(sql);
			
			for(int i=0;i<ckb.length;i++) {
				pstmt.setString(1, ckb[i]);
				
				//쿼리문 pstmt에 모두 쌓아 한꺼번에 처리. Batch에 담기
				pstmt.addBatch();
				
				//파라미터 Clear
				pstmt.clearParameters();
			}
			//Batch 실행
			pstmt.executeBatch();
			con.commit();
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			System.out.println("delete Exception");
			return false;
		} finally {
			closeAll(rs,pstmt,con);
		}
		return true;
	}
	
	//내 예약 조회 -- no 검증
	public ArrayList<ReserveVO> user_rs() throws SQLException {
		ArrayList <ReserveVO> rslist2 = new ArrayList<ReserveVO>();
		String sql ="select * from rs_view";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String rname=rs.getString("rname");
				Date rdate=rs.getDate("rdate");
				String rtime=rs.getString("rtime");
				String rtel=rs.getString("rtel");
				String setmenu=rs.getString("setmenu");
				int people=rs.getInt("people");
				String require=rs.getString("require");
				int totalprice=rs.getInt("totalprice");
				
				ReserveVO rsvo= new ReserveVO(rname,rdate,rtime,rtel,setmenu,people,require,totalprice);
				rslist2.add(rsvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			closeAll(rs,pstmt,con);
		}
	return rslist2;
	}
	
	public boolean payy(String payyn, String rname) throws SQLException {
		String sql = "update reserve set payyn = ? where rname=?";
		//String sql ="insert into reserve(payyn) values(?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, payyn);
			pstmt.setString(2, rname);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("업데이트 실패");
			return false;
		} finally {
			closeAll(rs,pstmt,con);
		}
		return true;
	}
	
	//메뉴 리스트 출력하기
	public ArrayList<MenuVO> menuAll() throws SQLException {
		ArrayList<MenuVO> marray = new ArrayList<MenuVO>();
		String sql = "select * from menuTable order by mnum";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			int mnum = rs.getInt("mnum");
			String menu = rs.getString("menu");
			String menudetail = rs.getString("menudetail");
			int price = rs.getInt("price");
			
			MenuVO mvo = new MenuVO(mnum,menu,menudetail,price);
			marray.add(mvo);
		}
		return marray;
	}
	
	//메뉴 일괄수정하기
	public void update(ArrayList<MenuVO> marray) throws SQLException {
		String sql ="update menuTable set menu=?, menudetail=?, price=? where mnum=?";
		try {
			pstmt = con.prepareStatement(sql);
			for (MenuVO tmp:marray) {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, tmp.getMenu());
				pstmt.setString(2, tmp.getMenudetail());
				pstmt.setInt(3, tmp.getPrice());
				pstmt.setInt(4, tmp.getMnum());
				pstmt.executeUpdate();
				con.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("update Exception");
		} finally {
			closeAll(rs,pstmt,con);
		}
	}
	
	//메뉴 추가하기
	
	public boolean insert_menu(String menu, String menudetail, int price) throws SQLException {
		String sql="insert into menuTable values(m_seq.nextval,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,menu);
			pstmt.setString(2, menudetail);
			pstmt.setInt(3, price);
			pstmt.executeUpdate();
			con.commit();
		} catch (SQLException e) {
			System.out.println("insert exception");
			e.printStackTrace();
			return false;
		} finally {
			closeAll(rs,pstmt,con);
		}
		return true;
		
	}
	
	//메뉴 삭제하기
		public boolean menudelete(String[] ckb) throws SQLException {
			String sql = "delete from menuTable where mnum = ?";		
			try {
				pstmt = con.prepareStatement(sql);
				
				for(int i=0;i<ckb.length;i++) {
					pstmt.setString(1, ckb[i]);
					
					//쿼리문 pstmt에 모두 쌓아 한꺼번에 처리. Batch에 담기
					pstmt.addBatch();
					
					//파라미터 Clear
					pstmt.clearParameters();
				}
				//Batch 실행
				pstmt.executeBatch();
				con.commit();
				
			} catch (SQLException e) {
				e.printStackTrace();
				try {
					con.rollback();
				} catch(SQLException e1) {
					e1.printStackTrace();
				}
				System.out.println("delete Exception");
				return false;
			} finally {
				closeAll(rs,pstmt,con);
			}
			return true;
		}
		
	//특정 메뉴 값 불러오기
	public ArrayList<MenuVO> menuVal() throws SQLException {
		ArrayList<MenuVO> mvarr = new ArrayList<MenuVO>();
		MenuVO mvo = null;
		String sql ="select mnum,price,menu,menudetail from menuTable";
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				mvo = new MenuVO();
				mvo.setMnum(rs.getInt("mnum"));
				mvo.setMenu(rs.getString("menu"));
				mvo.setPrice(rs.getInt("price"));
				mvo.setMenudetail(rs.getString("menudetail"));
				
				mvarr.add(mvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeAll(rs,pstmt,con);
		}
		return mvarr;
	}
	
	
	//객체닫기
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if( rs!= null) {
			rs.close(); //ResultSet 객체닫기
		}
		if(pstmt!=null) { 
			pstmt.close(); //PreparedStatement 객체닫기
		}
		if(con!=null) {
			con.close(); //데이터베이스 연결 종료
		}
	}
	// insert=====================================
	/*public boolean insert_reserve
	         (int id, String name, String tel, String sDate) {
		String sql="insert into teltable5 values(?,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, tel);
			
			pstmt.setString(4,sDate);////////占쏙옙占쌘그댐옙占� 占쌍깍옙 
			
			
			
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Insert Exception");
			return false;
		}
		return true;
	}
	
	public boolean update_all
	   (int id, String name, String tel, String d, String sname) {
	
		String sql="update teltable5 set id=?, name=?, tel=?,"
				       + " d=TO_DATE(?,'YYYY-MM-DD') where name=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(5, sname);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, tel);
			pstmt.setString(4, d);//占쏙옙占쌘넣깍옙占� 占쏙옙占쏙옙占쏙옙 to_date() 占쏙옙占�
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Update Exception");
			return false;
		}
		return true;
	}
	
	public boolean delete_reserve(String name) {
		String sql="delete from TelTable5 where name=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Delete Exception");
			return false;
		}
		return true;
	} 
		
	
	
	public ArrayList<ReserveVo> getAllInfo() throws SQLException{
		ArrayList<ReserveVo> tiarray=new ArrayList<ReserveVo>();
		String sql="select * from teltable5 order by id";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String tel=rs.getString("tel");
			Date d=rs.getDate("d");
			
			
			ReserveVo tv=new ReserveVo(id,name,tel,d);
			
		
			tiarray.add(tv);
			
		}//while-end
		return tiarray;
	}
	
	
	
	
	public ReserveVo getInfo(String oriName)			
			throws SQLException{
	ReserveVo tv=null;
	String sql = "SELECT * FROM TelTable5 where name=?";	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, oriName);
	rs = pstmt.executeQuery();
	if(rs.next()){	
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String tel=rs.getString("tel");
			Date d=rs.getDate("d");				
			tv=new ReserveVo(id,name,tel,d);	
			
	}else { 
		tv=null;	// null (return null) 
		}
	return tv;		
	}*/

	
} //TelInfoDAO  -end









