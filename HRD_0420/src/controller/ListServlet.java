package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SampDAOImpl;
import model.VO;

@WebServlet("/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SampDAOImpl dao = new SampDAOImpl();
		List<VO> list = null;

		try {
			list = dao.list();
		} catch (Exception e) {
			e.printStackTrace();
		}

		String str;
		String joindate;
		String grade = null;
		for (int x = 0; x < list.size(); x++) {
			str = list.get(x).getJoindate();
			joindate = str.substring(0, 4) + "년" + str.substring(4, 6) + "월" + str.substring(6) + "일";
			list.get(x).setJoindate(joindate);
			
//			if (list.get(x).getGrade().equalsIgnoreCase("A")) {
//				grade = "VIP";
//			} else if (list.get(x).getGrade().equalsIgnoreCase("B")) {
//				grade = "일반";
//			}else if (list.get(x).getGrade().equalsIgnoreCase("c")) {
//				grade = "직원";
//			}
//			
			switch (list.get(x).getGrade()) { //실수는 안대,객체(object) 안대
			case "A" : 
				grade = "VIP";
				break;
			case "B" : 
				grade = "일반";
				break;
			case "C" : 
				grade = "직원";
				break;
			}
			
			list.get(x).setGrade(grade);
		}

		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
