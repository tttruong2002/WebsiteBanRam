/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Category;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ManagerControl", urlPatterns = { "/manager" })
public class ManagerControl extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		Account a = (Account) session.getAttribute("acc");
		if (a == null) {
			response.sendRedirect("login");
			return;
		}

		int uID;
		DAO dao = new DAO();
		uID = a.getId();
		int checkIsSell = dao.checkAccountSell(uID);
		int checkIsAdmin = dao.checkAccountAdmin(uID);

		if ((checkIsSell != 1) & (checkIsAdmin != 1)) {
			response.sendRedirect("login");
			return;
		}

		int id = a.getId();
		String index = request.getParameter("index");
		if (index == null) {
			index = "1";
		}

		int indexPage = Integer.parseInt(index);
		int allProductBySellID;
		List<Product> list;
		if (checkIsAdmin == 1) {
			list = dao.getAllProductAndIndex(indexPage);
			allProductBySellID = dao.countAllProduct();
		} else {
			list = dao.getProductBySellIDAndIndex(id, indexPage);
			allProductBySellID = dao.countAllProductBySellID(id);
		}

		List<Category> listC = dao.getAllCategory();

		int endPage = allProductBySellID / 5;
		if (allProductBySellID % 5 != 0) {
			endPage++;
		}

		request.setAttribute("tag", indexPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("listCC", listC);
		request.setAttribute("listP", list);

		request.getRequestDispatcher("QuanLySanPham.jsp").forward(request, response);
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}