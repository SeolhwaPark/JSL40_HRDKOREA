package model;

import java.sql.SQLException;
import java.util.List;

public interface DAO {
	//등록
	public int insert(VO vo) throws SQLException;
	//조회
	public List<VO> list() throws SQLException;
	//반납등록
	public int bookReturn(VO vo) throws SQLException;
	//한사람 조회
	public VO search(int lentno) throws SQLException;
	//책등록
	public int bookInsert(VO vo) throws SQLException;
	//도서별 조회
	public List<VO> bookList() throws SQLException;
}
