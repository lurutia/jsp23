package ch18;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerUsingFile extends HttpServlet {
	private Map<String, CommandHandler> commandHandlerMap = new HashMap<>();
	
	public void init() throws ServletException {
		String configFile = getInitParameter("configFile");
		Properties properties = new Properties();
		String configFilePath = getServletContext().getRealPath(configFile);
		System.out.println(configFilePath);
		try(FileReader fis = new FileReader(configFilePath)) {
			properties.load(fis);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		Iterator<?> keyIterator = properties.keySet().iterator();
		while(keyIterator.hasNext()) {
			String command = (String) keyIterator.next();
			String handlerClassName = properties.getProperty(command);
			try {
				Class<?> handlerClass = Class.forName(handlerClassName);
				CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();
				commandHandlerMap.put(command, handlerInstance);
			} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		process(req, res);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String command = req.getParameter("cmd");
		CommandHandler commandHandler = commandHandlerMap.get(command);
		if(commandHandler == null) {
//			commandHandler = new NullHandler();
		}
		
		String viewPage = null;
		try {
			viewPage = commandHandler.process(req, res);	
		} catch (Exception e) {
			throw new ServletException(e);
		}
		
		if(viewPage != null) {
			RequestDispatcher dispatcher = req.getRequestDispatcher(viewPage);
			dispatcher.forward(req, res);
		}
	} 
}
