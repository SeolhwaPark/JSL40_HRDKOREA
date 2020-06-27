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
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","hrdkorea","1234");
		return con;
	}
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//자동번호
	public int max() {
		String query="select id from personnel order by id desc";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				row = (Integer.parseInt(rs.getString("id")));
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
		
		return row ;
		
	}
	
	//등록
	public int insert(VO vo) {
		String query="INSERT INTO personnel(ID, NAME, DEPT, POSITION, DUTY, PHONE) VALUES (?, ?, ?, ?, ?, ?)";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getDept());
			pstmt.setString(4, vo.getPosition());
			pstmt.setString(5, vo.getDuty());
			pstmt.setString(6, vo.getPhone());
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
		
		return row ;
		
	}
	//사원번호조회
	public VO idSearch(String id) {
		String query="select * from personnel where id=?";
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new VO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setDept(rs.getString("dept"));
				vo.setPosition(rs.getString("position"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
				
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
		
		return vo ;
		
	}
	
	//부서
		public VO dept(String dept) {
			String query="select * from personnel where dept=?";
			VO vo = null;
			try {
				con = getConnection();
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, dept);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo = new VO();
					vo.setId(rs.getString("id"));
					vo.setName(rs.getString("name"));
					vo.setDept(rs.getString("dept"));
					vo.setPosition(rs.getString("position"));
					vo.setDuty(rs.getString("duty"));
					vo.setPhone(rs.getString("phone"));
					
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
			
			return vo ;
			
		}
	
	//부서명조회
	public List<VO> deptSearch(String dept) {
		String query="select * from personnel where dept=?";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, dept);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new VO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setDept(rs.getString("dept"));
				vo.setPosition(rs.getString("position"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
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
	//아뒤 이름
	public VO search(String id, String name) {
		String query="select * from personnel where id=? and name=?";
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new VO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				vo.setDept(rs.getString("dept"));
				vo.setPosition(rs.getString("position"));
				vo.setDuty(rs.getString("duty"));
				vo.setPhone(rs.getString("phone"));
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
		
		return vo ;
		
	}
	//퇴사
	public int delete(String id,String name) {
		String query="delete from personnel where id=? and name=?";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
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
		
		return row ;
		
	}
}
