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
	//DB연동
	public static Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","hrdkorea","1234");
		return con;
	}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//등록
	public int insert(VO vo) {
		String query="insert into tbl_artist_01(artist_id,artist_name,artist_gender,artist_birth,talent,agency) values(?,?,?,?,?,?)";
		int row =0;
		
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
	
	//참가자 목록조회
	public List<VO> list() {
		
		String query="select * from tbl_artist_01";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
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

	
	//멘토점수조회	
	public List<VO> mentoList() {
	
	String query="SELECT c.serial_no, a.artist_id, a.artist_name, a.artist_birth, c.point, b.mento_name "
			+ "FROM tbl_artist_01 a, tbl_mento_01 b, tbl_point_01 c WHERE a.artist_id = c.artist_id "
			+ "AND b.mento_id = c.mento_id ORDER BY c.serial_no";
	List<VO> list = new ArrayList<VO>();
	VO vo = null;
	try {
		con = getConnection();
		pstmt = con.prepareStatement(query);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			vo = new VO();
			vo.setSerial_no(rs.getInt("serial_no"));
			vo.setArtist_id(rs.getString("artist_id"));
			vo.setArtist_name(rs.getString("artist_name"));
			vo.setArtist_birth(rs.getString("artist_birth"));
			vo.setPoint(rs.getInt("point"));
			vo.setMento_name(rs.getString("mento_name"));
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

	//참가자조회
	public List<VO> artistList() {
		
		String query="SELECt a.artist_id, a.artist_name, a.artist_gender,SUM(b.point) as suma, to_char(avg(b.point),'FM90.00')as avg"
				+" FROM tbl_artist_01 a, tbl_point_01 b where a.artist_id = b.artist_id "
				+"group by a.artist_id, a.artist_name, a.artist_gender order by SUM(b.point) desc";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new VO();
				vo.setArtist_id(rs.getString("artist_id"));
				vo.setArtist_name(rs.getString("artist_name"));
				vo.setArtist_gender(rs.getString("artist_gender"));
				vo.setSum(rs.getInt(4));
				vo.setAvg(rs.getDouble(5));
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
