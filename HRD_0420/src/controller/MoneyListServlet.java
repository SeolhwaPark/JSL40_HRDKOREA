package controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SampDAOImpl;
import model.VO;

@WebServlet("/money")
public class MoneyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MoneyListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SampDAOImpl dao = new SampDAOImpl();
		List<VO> list = null;
		DecimalFormat df = new DecimalFormat("#,###");
		try {
			list = dao.moneylist();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("list", list);
		request.setAttribute("df", df);
		
		RequestDispatcher dis = request.getRequestDispatcher("money_list.jsp");
		dis.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
