package ch19;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter {

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)req;
		HttpSession session = httpRequest.getSession(false);
		
		boolean login = false;
		if (session != null) {
			if(session.getAttribute("MEMBER") != null) {
				login = true;
			}
		}
		
		if(login) {
			chain.doFilter(req, res);
		} else {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/ch19/loginForm.jsp");
			dispatcher.forward(req, res);
		}
	}
	
	@Override
	public void destroy() {
		
	}
	
}
