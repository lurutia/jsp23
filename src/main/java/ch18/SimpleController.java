package ch18;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SimpleController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRequest(req, res);
	}
	
	private void processRequest(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		String type = req.getParameter("type");
		
		Object resultObject = null;
		if(type == null || type.equals("greeting")) {
			resultObject = "안녕하세요";
		} else if(type.equals("date")) {
			resultObject = new Date();
		} else {
			resultObject = "Invalid Type";
		}
		
		req.setAttribute("result", resultObject);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/ch18/simpleView.jsp");
		dispatcher.forward(req, res);
	}
}
