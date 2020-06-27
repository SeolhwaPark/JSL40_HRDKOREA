package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SampDAOImpl;
import model.VO;

@WebServlet("/insert")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//등록폼 
		SampDAOImpl dao = new SampDAOImpl();
		int custno = 0;
		try {
			//최대값
			custno = dao.maxCustno();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//날짜
		LocalDate date = LocalDate.now();
		String str = date.toString().replace("-", "");//하이픈빼버리기
		request.setAttribute("custno",custno);
		request.setAttribute("date",str);
		
		//데이터를 넘길 떄
		RequestDispatcher dis = request.getRequestDispatcher("insert.jsp");
		dis.forward(request, response);

		//response.sendRedirect("insert.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 등록처리
		request.setCharacterEncoding("utf-8");
		SampDAOImpl dao = new SampDAOImpl();
		VO vo = new VO();
		
		vo.setCustno(Integer.parseInt(request.getParameter("custno")));
		vo.setCustname(request.getParameter("custname"));
		vo.setPhone(request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3"));
		vo.setGender(request.getParameter("gender"));
		vo.setJoindate(request.getParameter("joindate"));
		vo.setGrade(request.getParameter("grade"));
		vo.setCity(request.getParameter("city"));
		
		int row = 0;
		try {
			row = dao.write(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("insert");
		
		//프로로 넘기려면 
		//request.setAttribute("row",row);
		//RequestDispatcher dis = request.getRequestDispatcher("insert_pro.jsp");
		//dis.forward(request, response);
		
	}

}
