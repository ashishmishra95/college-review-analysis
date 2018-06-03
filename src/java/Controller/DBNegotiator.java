/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GHANSHYAM
 */
@WebServlet(name = "DBNegotiator", urlPatterns = {"/DBNegotiator"})
public class DBNegotiator extends HttpServlet {

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
        ResultSet rs = null;
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                if (request.getParameter((String)LoginCheck.session.getAttribute("user")) != null) {
                    LoginCheck.session.removeAttribute("user");
                    //LoginCheck.session.invalidate();
                    String msg = "<div class=\"alert alert-success role=\"alert\">\n" +
                                "<strong>Logout Successful ! </strong>" +
                                "</div>"; 
                    request.setAttribute("status", msg);
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                    return;
                }
                String TABLE_NAME = "CollegeDetails";
                String COLUMN_NAME = "CollegeName";
                StringBuffer sb = new StringBuffer();
                String query = "SELECT `" + COLUMN_NAME + "` FROM `" + TABLE_NAME + "` WHERE `CollegeName` LIKE '";
                String collegeName = request.getParameter("cName");
                //System.out.println(name);
                rs = DbConnect.selectQuery(query + collegeName + "%'");
                if (rs.next()) {
                    do {            
                        sb = sb.append("<li>"
                                + "<a href=\"#\" class='hideMe' onclick=\"getCollegeDetails(this.text)\">" + rs.getString(COLUMN_NAME) + "</a>"
                                + "</li>" + "\n");
                        //request.getRequestDispatcher("/HomePage.jsp").forward(request, response);

                    } while (rs.next());
                    /*
                    request.setAttribute("val", sb.toString());
                    request.setAttribute("txt", collegeName);
                    request.getRequestDispatcher("HomePage.jsp").forward(request, response);
                    */
                    out.write(sb.toString());
                }
                //System.out.println(sb);
            } catch (SQLException ex) {
                //DbConnect.closeConnection();
                System.err.println("Error occurred..");
            }
            DbConnect.closeConnection(rs);
        }
    }

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
