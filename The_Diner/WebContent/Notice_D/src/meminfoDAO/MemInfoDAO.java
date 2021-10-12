package meminfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import meminfoDBConn.MemInfoDBConn;
import meminfoVO.MemInfoVo;

//DAO 

public class MemInfoDAO {

	private Connection con;			
	
	PreparedStatement pstmt=null;
	ResultSet rs=null;				
	
	
	public MemInfoDAO() throws ClassNotFoundException, SQLException {
		con=new MemInfoDBConn().getConnection(); 
											  	 
												
	} 
	
	public void pstmtClose() throws SQLException {
		if(pstmt != null) 
			pstmt.close();
	}
	
	public void getAllInfoClose()
			throws SQLException {
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(con != null)
			con.close();
	}
	// 비번변경 아이디 체크
		public MemInfoVo mempwck(String id, String tel)			
				throws SQLException{
		MemInfoVo tv=null;
		
		String sql = "select * from memtable where id=?";	
		
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String id1=rs.getString("id");
			String password1=rs.getString("password");
			String name=rs.getString("name");
			String tel1=rs.getString("tel");
			String email=rs.getString("email");
			String knum=rs.getString("knum");
			String rnum=rs.getString("rnum");
		
			
			tv=new MemInfoVo(id1,password1,name, tel1,email, knum,rnum);
			
			if(!tel.equals(tel1)) {
				tv=null;
			}
			
				
		}else { 
			tv=null;	// null (return null) 
			
			}

		
		return tv;		
		}
		
	// ȸ������
	public boolean join_member
					(String id, String password, String name, String tel, String email, String knum, String rnum) {
		String sql = " insert into memtable values(?,?,?,?,?,?,?)";
		
		try {
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2,  password);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);
			pstmt.setString(5, email);
			pstmt.setString(6, knum);
			pstmt.setString(7, rnum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("join Exception");
			return false;
		}
		return true;
	}
	
	// ���̵� �ߺ�üũ
	public boolean checkid(String id) {
		String sql="select id from memtable where id =?";
		boolean x=false;
		

			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) x=true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return x;
		
	}
	
	
	// ȸ�� ���� ����
	public ArrayList<MemInfoVo> getAllInfo() throws SQLException{
		ArrayList<MemInfoVo> tiarray=new ArrayList<MemInfoVo>();
		String sql="select * from memtable order by name";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			
			
			String id=rs.getString("id");
			String password=rs.getString("password");
			String name=rs.getString("name");
			String tel=rs.getString("tel");
			String email=rs.getString("email");
			String knum=rs.getString("knum");
			String rnum=rs.getString("rnum");
			

			
			
			MemInfoVo tv=new MemInfoVo(id, password, name, tel, email, knum, rnum);
			
		
			tiarray.add(tv);
			
		}//while-end
		return tiarray;
	}
	
	// �α���
	public MemInfoVo login(String id, String password)			
			throws SQLException{
	MemInfoVo tv=null;
	
	String sql = "select * from memtable where id=? and password=?";	
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, password);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		String id1=rs.getString("id");
		String password1=rs.getString("password");
		String name=rs.getString("name");
		String tel=rs.getString("tel");
		String email=rs.getString("email");
		String knum=rs.getString("knum");
		String rnum=rs.getString("rnum");
	
		
		tv=new MemInfoVo(id1,password1,name, tel,email, knum,rnum);
		
			
	}else { 
		tv=null;	// null (return null) 
		
		}
	return tv;
	}
	
	// ȸ����ü ����� ����
	public MemInfoVo inforcv(String id)			
			throws SQLException{
	MemInfoVo tv=null;
	
	String sql = "select * from memtable where id=?";	
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, id);
	
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		String id1=rs.getString("id");
		String password1=rs.getString("password");
		String name=rs.getString("name");
		String tel=rs.getString("tel");
		String email=rs.getString("email");
		String knum=rs.getString("knum");
		String rnum=rs.getString("rnum");
	
		
		tv=new MemInfoVo(id1,password1,name, tel,email, knum,rnum);
		
			
	}else { 
		tv=null;	// null (return null) 
		
		}

	
	return tv;		
	}
	
	// ��������
	public boolean memupdate(String name, String email, String tel, String id) {
		String sql="update memtable set name=?, email=?, tel=? where id=?";
						
		

		try {
			pstmt=con.prepareStatement(sql);
			
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			pstmt.setString(4, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Update Exception");
			return false;
		}
		
		return true;
	}
	
	// 패스워드변경								//바뀔비번 			//기존비번
		public boolean pwupdate(String id, String password) {
			String sql="update memtable set password=? where id=?";
							
			

			try {
				pstmt=con.prepareStatement(sql);
				
				
				pstmt.setString(2, id);
				pstmt.setString(1, password);
				
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("Update Exception");
				return false;
			}
			
			return true;
		}
	
	// ȸ����������
	public boolean delete_mem(String id) {
		String sql="delete from memtable where id=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Delete Exception");
			return false;
		}
		return true;
	} 
	


	
} //TelInfoDAO  -end









