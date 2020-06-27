package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAOimpl extends DBDAObase implements DAO {
	@Override
	public int insert(VO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "INSERT INTO TBL_BOOKLENT_002 " + "(LENTNO, CUSTNAME, PHONE, GENDER, BOOKNO, OUTDATE) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		int row = 0;

		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, vo.getLentno());
		pstmt.setString(2, vo.getCustname());
		pstmt.setString(3, vo.getPhone());
		pstmt.setString(4, vo.getGender());
		pstmt.setInt(5, vo.getBookno());
		pstmt.setString(6, vo.getOutdate());
		row = pstmt.executeUpdate();

		closeDBResources(rs, pstmt, conn);
		return row;
	}

	@Override
	public List<VO> list() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from tbl_booklent_002 A, tbl_bookcode_002 B where A.bookno = B.bookno";
		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			vo = new VO();
			vo.setLentno(rs.getInt("lentno"));
			vo.setCustname(rs.getString("custname"));
			vo.setPhone(rs.getString("phone"));
			vo.setGender(rs.getString("gender"));
			vo.setBookno(rs.getInt("bookno"));
			vo.setBookname(rs.getString("bookname"));
			vo.setOutdate(rs.getString("outdate"));
			vo.setIndate(rs.getString("indate"));
			list.add(vo);
		}

		closeDBResources(rs, pstmt, conn);
		return list;

	}

	@Override
	public int bookReturn(VO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "update TBL_BOOKLENT_002 set inDATE=? where lentno=?";
		int row = 0;

		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, vo.getIndate());
		pstmt.setInt(2, vo.getLentno());
		row = pstmt.executeUpdate();

		closeDBResources(rs, pstmt, conn);
		return row;
	}

	@Override
	public VO search(int lentno) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select * from tbl_booklent_002 where lentno=?";
		VO vo = null;
		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, lentno);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			vo = new VO();
			vo.setLentno(rs.getInt("lentno"));
			vo.setCustname(rs.getString("custname"));
			vo.setPhone(rs.getString("phone"));
			vo.setGender(rs.getString("gender"));
			vo.setBookno(rs.getInt("bookno"));
			vo.setIndate(rs.getString("indate"));
		}

		closeDBResources(rs, pstmt, conn);
		return vo;
	}

	@Override
	public int bookInsert(VO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "INSERT INTO TBL_BOOKCODE_002 (BOOKNO, BOOKNAME, AMOUNT) VALUES (?, ?, ?)";

		int row = 0;

		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, vo.getBookno());
		pstmt.setString(2, vo.getBookname());
		pstmt.setInt(3, vo.getAmount());
		row = pstmt.executeUpdate();

		closeDBResources(rs, pstmt, conn);
		return row;
	}

	@Override
	public List<VO> bookList() throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "select bookname, count(a.outdate) 대출, count(a.indate) 반납, "
				+ "b.amount - count(a.outdate) + count(a.indate) 대출가능 from tbl_booklent_002 a, tbl_bookcode_002 b "
				+ "where a.bookno = b.bookno group by b.bookname, b.amount order by bookname";

		List<VO> list = new ArrayList<VO>();
		VO vo = null;
		
		conn = getConnection();
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			vo = new VO();
			vo.setBookname(rs.getString(1));
			vo.setOutdate(rs.getString(2));
			vo.setIndate(rs.getString(3));
			vo.setAmount(rs.getInt(4));
			list.add(vo);
		}

		closeDBResources(rs, pstmt, conn);
		return list;
	}

}
