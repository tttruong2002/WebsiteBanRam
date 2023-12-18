/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// .java này để sửa thử button Mua ngay
package control;

import dao.DAO;
import entity.Account;
import entity.Cart;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SellCartControl", urlPatterns = {"/sellCart"})
public class SellCartControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8"); 
        int productID = Integer.parseInt(request.getParameter("pid"));
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("acc");
        if(a == null) {
        	response.sendRedirect("login");
        	return;
        }
        int accountID = a.getId();
        int amount = Integer.parseInt(request.getParameter("quantity"));
        String made_in = request.getParameter("made_in");
        
        DAO dao = new DAO();
        Cart cartExisted = dao.checkCartExist(accountID, productID);
        int amountExisted;
        String made_inExisted;
        
        if(cartExisted != null) {
        	 amountExisted = cartExisted.getAmount();
        	 dao.editAmountAndMadeInCart(accountID, productID, (amountExisted + amount), made_in);
        	 request.setAttribute("mess", "Đã tăng số lượng sản phẩm!");
        	 request.getRequestDispatcher("managerCart").forward(request, response);
        }
        else {
        	  dao.insertCart(accountID, productID, amount, made_in);
        	  request.setAttribute("mess", "Đã thêm sản phẩm vào giỏ hàng!");
        	  request.getRequestDispatcher("managerCart").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
