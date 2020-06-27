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
	public static DAO getInstance() {
		return instance;
	}
	
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521/xe","hrdkorea","1234");
		return con;
	}
	
	Connection con= null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	
	public int insert(VO vo) {
		String query="insert into tbl_product(code,pname,cost,pnum,jnum,sale,gcode) values(?,?,?,?,?,?,?)";
		int row = 0;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getCode());
			pstmt.setString(2, vo.getPname());
			pstmt.setInt(3, vo.getCost());
			pstmt.setInt(4, vo.getPnum());
			pstmt.setInt(5, vo.getJnum());
			pstmt.setInt(6, vo.getSale());
			pstmt.setString(7, vo.getGcode());
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
	public VO view(String code) {
		String query="select * from tbl_product where code=?";
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, code);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new VO();
				vo.setCode(rs.getString("code"));
				vo.setPname(rs.getString("pname"));
				vo.setCost(rs.getInt("cost"));
				vo.setPnum(rs.getInt("pnum"));
				vo.setJnum(rs.getInt("jnum"));
				vo.setSale(rs.getInt("sale"));
				vo.setGcode(rs.getString("gcode"));
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
	
	public int modify(VO vo) {
		String query="update tbl_product set cost=?,pnum=?,jnum=?,sale=?,gcode=? where code=?";
		int row = 0;
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, vo.getCost());
			pstmt.setInt(2, vo.getPnum());
			pstmt.setInt(3, vo.getJnum());
			pstmt.setInt(4, vo.getSale());
			pstmt.setString(5, vo.getGcode());
			pstmt.setString(6, vo.getCode());
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
	
	public int delete(String code) {
		String query="delete from tbl_product where code=?";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, code);
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
	
	public List<VO> list() {
		String query="select code, pname, pnum, jnum, pnum*2-jnum as product from tbl_product "
				+ "where pnum>jnum group by code, pname, pnum, jnum order by code";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new VO();
				vo.setCode(rs.getString("code"));
				vo.setPname(rs.getString("pname"));
				vo.setPnum(rs.getInt("pnum"));
				vo.setJnum(rs.getInt("jnum"));
				vo.setProduct(rs.getInt("product"));
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
	public List<VO> rankList() {
		String query="select code, pname, cost, jnum, sale, (sale-cost)*jnum as money from tbl_product "
				+ "group by code, pname, cost, jnum, sale order by money desc";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new VO();
				vo.setCode(rs.getString("code"));
				vo.setPname(rs.getString("pname"));
				vo.setCost(rs.getInt("cost"));
				vo.setJnum(rs.getInt("jnum"));
				vo.setSale(rs.getInt("sale"));
				vo.setMoney(rs.getInt("money"));
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
	public List<VO> grouplist() {
		String query="select b.gname, a.code, a.pname, sum(a.jnum) from tbl_product a, tbl_group b "
				+ "where a.gcode = b.gcode group by b.gname, a.code, a.pname order by sum(a.jnum) desc";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new VO();
				vo.setGname(rs.getString("gname"));
				vo.setCode(rs.getString("code"));
				vo.setPname(rs.getString("pname"));
				vo.setJnum(rs.getInt(4));
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
}
