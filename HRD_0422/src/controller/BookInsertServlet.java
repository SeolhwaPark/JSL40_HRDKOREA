package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOimpl;
import model.VO;

@WebServlet("/book_insert")
public class BookInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookInsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("book_insert.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DAOimpl dao = new DAOimpl();
		VO vo = new VO();
		
		vo.setBookno(Integer.parseInt(request.getParameter("bookno")));
		vo.setBookname(request.getParameter("bookname"));
		vo.setAmount(Integer.parseInt(request.getParameter("amount")));
		
		int row = 0; 
		try {
			row = dao.bookInsert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("index");
	}

}
