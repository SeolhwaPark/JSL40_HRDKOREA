package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	private DAO () {}
	private static DAO instance = new DAO();
	public static DAO getInstance() {
		return instance;
	}
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin@:localhost:1521/xe","hrdkora","1234");
		return con;
	}
	
	Connection con =null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	public int insert(VO vo) {
		String query="insert into tbl_insert into tbl_artist_01(artist_id,artist_name,artist_gender,artist_birth,talent,agency) values(?,?,?,?,?,?)";
		int row = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, vo.getArtist_id());
			pstmt.setString(2, vo.getArtist_name());
			pstmt.setString(3, vo.getArtist_gender());
			pstmt.setString(4, vo.getArtist_birth());
			pstmt.setString(5, vo.getTalent());
			pstmt.setString(6, vo.getAgency());
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
		String query="select * from tbl_artist_01";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			while(rs.next()) {
				vo = new VO();
				vo.setArtist_id(rs.getString("artist_id"));
				vo.setArtist_name(rs.getString("artist_name"));
				vo.setArtist_gender(rs.getString("artist_gender"));
				vo.setArtist_birth(rs.getString("artist_birth"));
				vo.setTalent(rs.getString("talent"));
				vo.setAgency(rs.getString("agency"));
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
