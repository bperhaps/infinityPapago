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
@WebServlet("/JoinAction")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAction() {
        super();
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
		*/
	}


}
