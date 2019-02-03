package user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class JoinAction
 */
@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO = new UserDAO();
    /**
     * Default constructor. 
     */
    public LoginAction() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String address = null;
		HttpSession session = request.getSession();
		UserBean user = (UserBean)session.getAttribute("user");
		
		/*
		if(user == null){
			user = new UserBean();
			session.setAttribute("user", user);
		} else if(user.getLogin()) {
			address = "/webService/login_fail.jsp";
			user.setError("이미 로그인 되어 있습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher(address);
			dispatcher.forward(request,  response);
		}
		
		String userId = request.getParameter("userID");  
		String userPw = request.getParameter("userPassword");
		
		if(userId == null || userPw == null){
			address = "/webService/login_fail.jsp";
			user.setError("데이터 엄섬");
			RequestDispatcher dispatcher = request.getRequestDispatcher(address);
			dispatcher.forward(request,  response);
		}
		
		user.setUserID(userId);
		user.setUserPassword(userPw);
		/*
		switch(userDAO.login(user)){
			case 1:
				user.setLogin(true);
				address = "login_success.jsp";
				break;
			case 0:
			case -1:
				address = "login_fail.jsp";
				user.setError("아이디 또는 비밀번호를 확인하여 주세요.");
				break;
			case -2:
				address = "login_fail.jsp";
				user.setError("database error.");
				break;
			default :
				address = "login_fail.jsp";
				user.setError("unknown error.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request,  response);
		*/
		
	}

}
