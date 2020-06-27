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

@WebServlet("/return")
public class ReturnServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReturnServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDate date = LocalDate.now();
		String str = date.toString().replace("-", "");
		request.setAttribute("date", str);
		
		RequestDispatcher dis = request.getRequestDispatcher("return.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		DAOimpl dao = new DAOimpl();
		VO vo = new VO();
		
		vo.setLentno(Integer.parseInt(request.getParameter("lentno")));
		vo.setIndate(request.getParameter("indate"));
		
		int row = 0;
		try {
			row = dao.bookReturn(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("index");
	}

}
