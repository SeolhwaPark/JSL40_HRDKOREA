package controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOimpl;
import model.VO;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOimpl dao = new DAOimpl();
		int lentno = Integer.parseInt(request.getParameter("lentno"));
		VO vo = null;
		try {
			vo = dao.search(lentno);	
		} catch (Exception e) {
			e.printStackTrace();
		}
		LocalDate date = LocalDate.now();
		String str = date.toString().replace("-", "");
		request.setAttribute("vo", vo);
		request.setAttribute("date", str);
		request.setAttribute("row", 1);
		
		RequestDispatcher dis = request.getRequestDispatcher("return.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
