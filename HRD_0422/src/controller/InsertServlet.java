package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOimpl;
import model.VO;

@WebServlet("/insert")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("insert.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DAOimpl dao = new DAOimpl();
		VO vo = new VO();
		
		vo.setLentno(Integer.parseInt(request.getParameter("lentno")));
		vo.setCustname(request.getParameter("custname"));
		vo.setPhone(request.getParameter("phone"));
		vo.setGender(request.getParameter("gender"));
		vo.setBookno(Integer.parseInt(request.getParameter("bookno")));
		vo.setOutdate(request.getParameter("outdate").replace("-", ""));///
		
		int row = 0;
		try {
			row = dao.insert(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("index");
		
	}

}
