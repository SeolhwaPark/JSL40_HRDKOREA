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

@WebServlet("/modify")
public class ModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SampDAOImpl dao = new SampDAOImpl();
		VO vo = new VO();

		int custno = Integer.parseInt(request.getParameter("custno"));
		try {
			vo = dao.search(custno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String tel[]= vo.getPhone().split("-");
		request.setAttribute("tel1",tel[0]);
		request.setAttribute("tel2",tel[1]);
		request.setAttribute("tel3",tel[2]);
		
		request.setAttribute(vo.getGender(), "checked");
		request.setAttribute(vo.getGrade(), "selected");
		request.setAttribute(vo.getCity(), "selected");
		request.setAttribute("vo", vo);

		RequestDispatcher dis = request.getRequestDispatcher("modify.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		SampDAOImpl dao = new SampDAOImpl();
		VO vo = new VO();
		vo.setCustno(Integer.parseInt(request.getParameter("custno")));
		vo.setPhone(
				request.getParameter("tel1") + "-"+request.getParameter("tel2") +"-"+ request.getParameter("tel3"));
		vo.setGender(request.getParameter("gender"));
		vo.setGrade(request.getParameter("grade"));
		vo.setCity(request.getParameter("city"));

		int row = 0;
		try {
			row = dao.modify(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("list");

	}

}
