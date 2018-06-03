package Controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author GHANSHYAM
 */
@WebServlet(name = "CollegeDetails", urlPatterns = {"/CollegeDetails"})
public class CollegeDetails extends HttpServlet {
    static String collegeName = null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ResultSet rs = null;
        ResultSet rset = null;
        ResultSet rsetR = null;
        response.setContentType("text/xml;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                //String collegeName = "";
                collegeName = request.getParameter("collegeName");
                //System.out.println(collegeName + "\n" + request.getParameter("collegeName"));
                if (collegeName.indexOf("'") != -1) {
                    String[] temp = collegeName.split("'");
                    collegeName = temp[0];
                    collegeName += "''" + temp[1];
                }
                
                String TABLE_NAME = "CollegeDetails";
                String COLUMN_NAME = "CollegeName";
                String query = "select * from " + TABLE_NAME + " where " + COLUMN_NAME + " like '%" + collegeName + "%'";
                rs = DbConnect.selectQuery(query);
                rset = DbConnect.selectQuery("select Courses from CollegeCourses where " + COLUMN_NAME + " like '%" + collegeName + "%'");
                rsetR = DbConnect.selectQuery("select Reviews, User from CollegeReviews where " + COLUMN_NAME + " like '%" + collegeName + "%'");
                StringBuffer strBuffer = new StringBuffer();
                if (rs.next()) {
                    strBuffer = strBuffer.append("<college>\n<name>" + rs.getString(COLUMN_NAME) + "</name>\n" +
                                    "<saddr>" + rs.getString("ShortAddress") + "</saddr>\n" +
                                    "<addr>" + rs.getString("Address") + "</addr>\n" + 
                                    "<web>" + rs.getString("Website") + "</web>\n" + 
                                    "<contact>" + rs.getString("Contact") + "</contact>\n" +
                                    "<neg>" + rs.getInt("Negative") + "</neg>\n" +
                                    "<pos>" + rs.getInt("Positive") + "</pos>\n"
                                );
                    /*strBuffer = strBuffer.append("<h1>" + rs.getString(COLUMN_NAME) + "</h1>" + "<br />" + rs.getString("ShortAddress") + "<br />" + rs.getString("Address") + "<br />" + rs.getString("Website")
                                + "<br />" + rs.getString("Contact"));
                    */
                }
                while (rset.next()) {
                    strBuffer = strBuffer.append("<course>" + rset.getString("Courses") + "</course>\n");
                }
                
                //request.setAttribute("cdetail", strBuffer.toString());
                while (rsetR.next()) {
                    strBuffer = strBuffer.append("<review>" + rsetR.getString("Reviews") + "</review>\n" +
                            "<user>" + rsetR.getString("User") + "</user>");
                }
                strBuffer.append("</college>");
                out.write(strBuffer.toString());
                //request.getRequestDispatcher("HomePage.jsp").forward(request, response);
            } catch(Exception e) {
                System.err.println("Error occurred..");
            }
            DbConnect.closeConnection(rset);
            DbConnect.closeConnection(rs);
            DbConnect.closeConnection(rsetR);
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
