package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SampDAOImpl extends DAOBase implements SampDAO {

	@Override
	public int maxCustno() throws SQLException {
		// 최대값 구하기
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select max(custno) from tbl_member_0420";
		int row = 0;

		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			row = rs.getInt(1);
		}

		closeDBResources(rs, pstmt, conn);
		return row;
	}

	@Override
	public int write(VO vo) throws SQLException {
		// 등록
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "insert into tbl_member_0420"
				+ "(custno,custname,phone,gender,joindate,grade,city)"
				+ " values(?,?,?,?,?,?,?)";
		int row = 0;

		conn = getConnection();
		pstmt = conn.prepareStatement(query);

		pstmt.setInt(1, vo.getCustno());
		pstmt.setString(2, vo.getCustname());
		pstmt.setString(3, vo.getPhone());
		pstmt.setString(4, vo.getGender());
		pstmt.setString(5, vo.getJoindate());
		pstmt.setString(6, vo.getGrade());
		pstmt.setString(7, vo.getCity());
		// 물음표인 애들
		row = pstmt.executeUpdate();

		closeDBResources(rs, pstmt, conn);
		return row;
	}

	// 컨트롤+스페이스바 ㅎㅎ
	@Override
	public List<VO> list() throws SQLException {
		// 조회
		List<VO> list = new ArrayList<VO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from tbl_member_0420 A, tbl_city_0420 B where A.city = B.city";

		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		VO vo = null;

		while (rs.next()) {
			vo = new VO();
			vo.setCustno(rs.getInt("custno"));
			vo.setCustname(rs.getString("custname"));
			vo.setPhone(rs.getString("phone"));
			vo.setGender(rs.getString("gender"));
			vo.setJoindate(rs.getString("joindate"));
			vo.setGrade(rs.getString("grade"));
			vo.setCity(rs.getString("city"));
			vo.setCityname(rs.getString("cityname"));
			list.add(vo);
		}
		closeDBResources(rs, pstmt, conn);
		return list;
	}

	@Override
	public List<VO> moneylist() throws SQLException {
		// 매출조회
		List<VO> list = new ArrayList<VO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select custno, custname, phone, grade, sum(price) as money from "
				+ "(select M.custno, M.custname, M.phone, M.grade, T.price from "
				+ "tbl_member_0420 M, tbl_money_0420 T where M.custno = T.custno) "
				+ "group by custno, custname, phone, grade order by sum(price) desc";

		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		VO vo = null;

		while (rs.next()) {
			vo = new VO();
			vo.setCustno(rs.getInt("custno"));
			vo.setCustname(rs.getString("custname"));
			vo.setPhone(rs.getString("phone"));
			vo.setGrade(rs.getString("grade"));
			vo.setMoney(rs.getInt("money"));
			list.add(vo);
		}
		closeDBResources(rs, pstmt, conn);
		return list;
	}
	
	
	@Override
	public int modify(VO vo) throws SQLException {
		//수정
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "update tbl_member_0420 set phone=?, gender=?, grade=?, city=? where custno=?";
		int row = 0;

		conn = getConnection();
		pstmt = conn.prepareStatement(query);

		pstmt.setString(1, vo.getPhone());
		pstmt.setString(2, vo.getGender());
		pstmt.setString(3, vo.getGrade());
		pstmt.setString(4, vo.getCity());
		pstmt.setInt(5, vo.getCustno());
		// 물음표인 애들
		row = pstmt.executeUpdate();

		
		closeDBResources(rs, pstmt, conn);
		return row;
		
	}
	
	@Override
	public VO search(int custno) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		VO vo = new VO();
		String query = "select * from tbl_member_0420 where custno=?";
		
		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, custno);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			vo.setCustno(rs.getInt("custno"));
			vo.setCustname(rs.getString("custname"));
			vo.setPhone(rs.getString("phone"));
			vo.setGender(rs.getString("gender"));
			vo.setJoindate(rs.getString("joindate"));
			vo.setGrade(rs.getString("grade"));
			vo.setCity(rs.getString("city"));
		}
		
		return vo;
	}

}
