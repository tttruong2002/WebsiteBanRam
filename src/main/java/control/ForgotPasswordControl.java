package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;

import entity.Account;
import entity.Email;
import entity.EmailUtils;

/**
 * Servlet implementation class ForgotPasswordControl
 */
@WebServlet(name = "ForgotPasswordControl", urlPatterns = { "/forgotPassword" })
public class ForgotPasswordControl extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		try {
			String emailAddress = request.getParameter("email");
			String username = request.getParameter("username");

			DAO dao = new DAO();
			Account account = dao.checkAccountExistByUsernameAndEmail(username, emailAddress);
			if (account == null) {
				request.setAttribute("error", "Email hoặc username sai!");
			}
			if (account != null) {
				Email email = new Email();
				email.setFrom("websitebanr");
				email.setFromPassword("quuzazonmnzntald");
				email.setTo(emailAddress);
				email.setSubject("Quên Mật Khẩu Shop Ram Tun");
				StringBuilder sb = new StringBuilder();
				sb.append("Gửi ").append(username).append(",").append("<br>");
				sb.append("Bạn đã sử dụng chức năng quên mật khẩu. <br> ");
				sb.append("Mật khẩu của bạn là: <b>").append(account.getPass()).append(" </b> <br>");
				sb.append("Cám ơn bạn đã đến với cửa hàng của chúng tôi!<br>");
				sb.append("Ram TUN");

				email.setContent(sb.toString());
				EmailUtils.send(email);

				request.setAttribute("mess", "Mật khẩu đã được gửi đến email của bạn!");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
	}

}
