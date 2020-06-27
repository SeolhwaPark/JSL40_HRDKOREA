package model;

import java.sql.SQLException;
import java.util.List;

public interface SampDAO {
	
	//회원번호 최대값 구하기
	public int maxCustno() throws SQLException;
	
	//등록
	public int write(VO vo) throws SQLException;
	
	//검색
	public List<VO> list() throws SQLException;

	//회원별 매출 조회
	public List<VO> moneylist() throws SQLException;
	
	//수정
	public int modify(VO vo) throws SQLException;
	
	//한명 검색
	public VO search(int custno) throws SQLException;
	
	
	
}
