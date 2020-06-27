package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOimpl;
import model.VO;

@WebServlet("/book_list")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOimpl dao = new DAOimpl();
		List<VO> list = null;
		
		try {
			list = dao.bookList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("book_list.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
