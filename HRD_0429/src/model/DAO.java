package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	private DAO() {}
	private static DAO instance = new DAO();
	public static DAO getInstance() throws Exception{
		return instance;
	}
	
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","hrdkorea","1234");
		return con;
	}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int max() {
		String query="select sawon from tbl_person order by sawon desc";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				row = rs.getInt("sawon");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	public int insert(VO vo) {
		String query="insert into tbl_person(sawon,name,duty,phone,indate,dcode) values(?,?,?,?,?,?)";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, vo.getSawon());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getDuty());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getIndate());
			pstmt.setString(6, vo.getDcode());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	public VO sawonList(int sawon) {
		String query="select * from tbl_person where sawon=?";
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sawon);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new VO();
				vo.setSawon(rs.getInt("sawon"));
				vo.setName(rs.getString("name"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
				vo.setIndate(rs.getString("indate"));
				vo.setOutdate(rs.getString("outdate"));
				vo.setDcode(rs.getString("dcode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	public List<VO> dnameList(String dname) {
		String query="select a.sawon,a.name,a.duty,a.phone,a.indate,a.outdate,b.dcode "
				+ "from tbl_person a, tbl_dept b where a.dcode = b.dcode and b.dname=?";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo =new VO();
				vo.setSawon(rs.getInt("sawon"));
				vo.setName(rs.getString("name"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
				vo.setIndate(rs.getString("indate"));
				vo.setOutdate(rs.getString("outdate"));
				vo.setDcode(rs.getString("dcode"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public List<VO> dnameList() {
		String query="select b.dcode,b.dname,b.inwon,count(a.dcode) as cnt from tbl_person a, tbl_dept b "
				+ "where a.dcode = b.dcode group by b.dcode,b.inwon,b.dname order by count(a.dcode) desc";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo =new VO();
				vo.setDcode(rs.getString("dcode"));
				vo.setDname(rs.getString("dname"));
				vo.setInwon(rs.getInt("inwon"));
				vo.setCnt(rs.getInt("cnt"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	public int delete(int sawon, String name) {
		String query="delete from tbl_person where sawon=? and name=?";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sawon);
			pstmt.setString(2, name);
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	public VO sawonList(int sawon,String name) {
		String query="select * from tbl_person where sawon=? and name=?";
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, sawon);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new VO();
				vo.setSawon(rs.getInt("sawon"));
				vo.setName(rs.getString("name"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
				vo.setIndate(rs.getString("indate"));
				vo.setOutdate(rs.getString("outdate"));
				vo.setDcode(rs.getString("dcode"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(con!=null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return vo;
	}
	
}