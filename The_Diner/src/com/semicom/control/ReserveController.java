package com.semicom.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import meminfoVO.MemInfoVo;
import meminfoVO.MenuVO;
import meminfoVO.ReserveVO;
import meminfoDAO.MemInfoDAO;
import meminfoDAO.ReserveDAO;

/**
 * Servlet implementation class ReserveController
 */
@WebServlet("*.do")
public class ReserveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReserveController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String c = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(request.getRequestURI()); // /ServletProject2/getAllInfo.do 
        //프로젝트명/.do 

		System.out.println(request.getContextPath());
		String str = null;
		ReserveDAO rsdao = null;
		//HttpSession 媛앹껜 �뼸湲� �쐞�븯�뿬 request.getSession() �븿�닔瑜� �씠�슜
		HttpSession session = request.getSession(); 
		
		switch(c) {
		
		//예약리스트 출력
		case "/reservation/reservelist.do": 
			/*ReserveDAO rsdao1 = null;*/
			try {
				rsdao = new ReserveDAO();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ArrayList<ReserveVO> rslist = null;
			try {
				rslist = rsdao.reserveList();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("rslist", rslist);
			str = "reservationlist.jsp"; //예약리스트
			break;
			
		//예약하기	
		case "/reservation/reserve.do":
			String rdate = request.getParameter("rdate"); //날짜
			String rtime = request.getParameter("rtime"); //시간
			
			String Asetcnt = request.getParameter("Aset");  //a세트 개수
			String Bsetcnt = request.getParameter("Bset"); //b세트 개수
			String Csetcnt = request.getParameter("Cset"); //c세트 개수
			String noset = request.getParameter("noset"); //세트 선택 안함
			
			String rname = request.getParameter("rname"); //예약자 이름
			String rtel = request.getParameter("rtel"); //예약자 전화번호
			String require = request.getParameter("require"); //요청사항
			int people = Integer.parseInt(request.getParameter("people"));  //인원수
			
			//결제
			int totalprice = Integer.parseInt(request.getParameter("price"));
			
			
			//db에 넣을 세트메뉴란
			String menu = null;
			if(noset==null) {
				menu = "A세트: "+Asetcnt+"개, "+"B세트: "+Bsetcnt+"개, "+"C세트: "+Csetcnt+"개";
			} else {
				menu = "세트메뉴 선택안함";
			}
			
			//db에 입력하기
			ReserveDAO rsdao2 = null;
			try {
				rsdao = new ReserveDAO();
				rsdao.insert_reserve(rdate, rtime, rname, rtel, menu, people, require, totalprice);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			
			//request 담기
			session.setAttribute("rdate", rdate); //날짜담기
			session.setAttribute("rtime", rtime); //시간담기
			session.setAttribute("menu", menu);  //세트메뉴 담기
			session.setAttribute("rname", rname); //예약자성함 담기
			session.setAttribute("rtel", rtel);//예약자 전화번호 담기
			session.setAttribute("require", require); //요청사항 담기
			session.setAttribute("people", people);   //인원수 담기
			
			   //결제 속성
			session.setAttribute("price", totalprice);
			
			str = "user_rs.jsp";
			break;
			
		//예약리스트 여러 개 삭제	
		case "/reservation/rsDelete.do":
			String[] ckb = request.getParameterValues("ckbox");
			if(ckb==null) {
				str="reservationlist.jsp";
				break;
			} else {}
			
			try {
				rsdao = new ReserveDAO();
				rsdao.Muldelete_reserve(ckb);
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			str = "reservationlist.jsp";
			break;
						
		//메뉴전체리스트 출력
		case "/reservation/menulist.do":
			ArrayList<MenuVO> marray = null;
			try {
				rsdao = new ReserveDAO();
				marray = rsdao.menuAll();
			} catch (ClassNotFoundException e1) {
				e1.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			request.setAttribute("marray", marray);
			
			str = "menulist.jsp";
			break;
			
		//메뉴 일괄 수정
		case "/menu/menuUpdate.do":
			String[] marr = request.getParameterValues("mnum");
			String[] u_menu = request.getParameterValues("u_menu");
			String[] menudetail = request.getParameterValues("menudetail");
			String[] parr = request.getParameterValues("u_price");
			
			//가격 int 배열로 받기
			int[] priceArr = new int[parr.length];
			for(int i=0;i<parr.length;i++) {
				priceArr[i]=Integer.parseInt(parr[i]);
			}
			
			//메뉴번호 int 배열로 받기
			int[] mnumArr = new int[marr.length];
			for(int i=0;i<marr.length;i++) {
				mnumArr[i]=Integer.parseInt(marr[i]);
			}
						
			MenuVO mvo;
			ArrayList <MenuVO> marray2 = new ArrayList<>();
			for(int i=0;i<u_menu.length;i++) {
				mvo=new MenuVO();
				mvo.setMnum(mnumArr[i]);
				mvo.setMenu(u_menu[i]);
				mvo.setMenudetail(menudetail[i]);
				mvo.setPrice(priceArr[i]);
				marray2.add(mvo);
			}
			try {
				rsdao = new ReserveDAO();
				rsdao.update(marray2);
			} catch (ClassNotFoundException |SQLException e) {
				e.printStackTrace();
				System.out.println("controller exception");
			} 
			str = "menulist.jsp";
			break;
			
		//메뉴 삽입
		case "/menu/menuinsert.do":
			String in_menu = request.getParameter("insertmenu");
			String in_menudetail = request.getParameter("insertdetail");
			int in_price = Integer.parseInt(request.getParameter("insertprice"));
			try {
				rsdao= new ReserveDAO();
				rsdao.insert_menu(in_menu, in_menudetail, in_price);
			} catch (ClassNotFoundException |SQLException e) {
				e.printStackTrace();
			}
			
			
			request.setAttribute("in_menu", in_menu);
			request.setAttribute("in_menudetail",in_menudetail);
			request.setAttribute("in_price", in_price);
			
			str = "menulist.jsp";
			break;
		
		//메뉴 삭제하기
		case "/menu/menudelete.do":
			String[] ckb2 = request.getParameterValues("ckbox");
			if(ckb2==null) {
				str="menulist.jsp";
				break;
			} else {
				
			}
			try {
				rsdao = new ReserveDAO();
				rsdao.menudelete(ckb2);
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			str = "menulist.jsp";
			break;
		
			
			// �쉶�썝媛��엯
		case "/memberjoinForm.do":		
			String id1=request.getParameter("id");
			String password1=request.getParameter("password");
			String name1=request.getParameter("name");
			String tel1=request.getParameter("tel");
			String email1=request.getParameter("email");
			String knum2=request.getParameter("knum");
			String knum3=request.getParameter("knum2");
			String knum1=knum2+knum3;
			String rnum1 = "0";
			String password2=request.getParameter("passwordck");
		
			if(password1.compareTo(password2) != 0) {
				str= "pwfault.jsp";
				
				break;
			}
			
			
			
			MemInfoDAO tidao2 = null;
			try {
				tidao2 = new MemInfoDAO();
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			if(tidao2.checkid(id1)) {
				str = "idfault.jsp";
				
				break;
			}
			
			tidao2.join_member(id1, password1, name1, tel1, email1, knum1, rnum1); //�씠嫄몃줈 dao�뿉�꽌 db�뿉�떎 ���옣
			
			str = "login.jsp";	
									
			break;
			
			// 濡쒓렇�씤 
		case "/loginForm.do" :
			String id3=request.getParameter("id");
			String password3=request.getParameter("password");
			
			MemInfoDAO tidao3=null;
			MemInfoVo tv1 = null;
			
			try {
				tidao3 = new MemInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				tv1=tidao3.login(id3, password3);

				if(tv1 == null) {
					str = "loginfail.jsp";
					
					break;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			session.setAttribute("mname", id3);
			session.setAttribute("stv", tv1);
			
			/*if(id3.equals("manager")) {
				str = "managerpage.jsp";
				
				break;
			}*/
			
			str = "index.jsp";
			
			break;
		
			
			// �쉶�썝�궘�젣
		case "/memdelete.do":
			MemInfoDAO tidao8 = null;
			MemInfoVo tv8 = null;
			String id8=request.getParameter("id");///////
			String pw5=request.getParameter("password");
			String pw7=request.getParameter("pw");
			if(pw5.compareTo(pw7) != 0) {
				str="pwfault.jsp";
				break;
			}
	
			try {
				tidao8=new MemInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			tidao8.delete_mem(id8);////////////////
			str="getAllinfo.jsp";
			break;
					 
		case "/pwupdate.do" :
			MemInfoDAO tidao6 = null;
			
			String id6 = request.getParameter("id");
			String npw = request.getParameter("password1");
			String npwck = request.getParameter("password2");
			
			if(!npw.equals(npwck)) {
				str= "pwfault.jsp";
				
				break;
			}
			
			try {
				tidao6 = new MemInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			tidao6.pwupdate(id6,npw);
			

			str="login.jsp";
			break;
			
		case "/pwupdate0.do" :
			
			MemInfoDAO tidao9 = null;
			MemInfoVo tv9 = null;
			String id9=request.getParameter("id");
			String tel9=request.getParameter("tel");
			
			try {
				tidao9=new MemInfoDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} 
			
			try {
				tv9=tidao9.mempwck(id9, tel9);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(tv9 == null) {
				
				str="pwchange_fault.jsp"; 
				break;
			}
				
			request.setAttribute("stv", tv9);
			str="pwchange.jsp";
			
			break;
		}
		
	
		
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
	}

}
