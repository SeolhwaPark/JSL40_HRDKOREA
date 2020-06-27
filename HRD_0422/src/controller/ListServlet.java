package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DAOimpl;
import model.VO;

@WebServlet("/list")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DAOimpl dao = new DAOimpl();
		List<VO> list = null;
		
		try {
			list = dao.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String gender = null;
		String str;
		String indate;
		
		VO vo = null;
		for(int x=0; x<list.size(); x++) {
			vo = list.get(x);
			switch(vo.getGender()) {
			case "M" : 
				gender = "남"; 
				break;
			case "F" : 
				gender = "여"; 
				break;
			}
			vo.setGender(gender);
			
			str = vo.getIndate();
			if(str!=null) {
				indate = str.substring(0,4)+ "년" + str.substring(5,7)+ "월" + str.substring(8,10)+ "일";
				vo.setIndate(indate);
			}else{
				vo.setIndate("");
			}
		}
		request.setAttribute("list", list);
		RequestDispatcher dis = request.getRequestDispatcher("list.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
