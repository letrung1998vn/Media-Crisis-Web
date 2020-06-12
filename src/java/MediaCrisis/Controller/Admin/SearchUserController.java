/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MediaCrisis.Controller.Admin;

import MediaCrisis.APIConnection.APIConnection;
import MediaCrisis.Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "SearchUserController", urlPatterns = {"/SearchUserController"})
public class SearchUserController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final String error = "error.html";
    private final String userPage = "User_JSP.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String pageNum = request.getParameter("page");
            String searchValue = request.getParameter("searchUser");
            String nextPage = "";
            int maxPage = 0;
            int thisPage = 0;
            String listJson = "";
            String urlSearchUser = "http://localhost:8181/user/findAllUser/?";
            
            List<String> params = new ArrayList<>();
            List<String> value = new ArrayList<>();

            params.add("username");
            params.add("page");
            value.add(searchValue);
            value.add(pageNum);
            
            APIConnection ac = new APIConnection(urlSearchUser, params, value);
            listJson = ac.connect();
            System.out.println(listJson);

            try {
                JSONObject jobj = new JSONObject(listJson);
                thisPage = jobj.getInt("number") + 1;
                maxPage = jobj.getInt("totalPages");
                listJson = jobj.get("content").toString();
                listJson = listJson.substring(1, listJson.length() - 1);
                listJson = listJson.replace("},{", "}&nbsp;{");
                String[] users = listJson.split("&nbsp;");
                List<User> listUser = new ArrayList<User>();
                for (int i = 0; i < users.length; i++) {
                    JSONObject obj = new JSONObject(users[i]);
                    User userObj = new User();
                    userObj.setUsername(obj.getString("userName"));
                    userObj.setRole(obj.getString("role"));
                    userObj.setIsAvailable(obj.getBoolean("available"));
                    JSONObject obj1 = new JSONObject(obj.get("user").toString());
                    userObj.setName(obj1.getString("name"));
                    userObj.setEmail(obj1.getString("email"));
                    listUser.add(userObj);
                }

                nextPage = userPage;
                HttpSession session = request.getSession();
                session.setAttribute("LISTUSER", listUser);
                session.setAttribute("COUNT", listUser.size());
                session.setAttribute("USERADMINTHISPAGE", thisPage);
                session.setAttribute("USERADMINMAXPAGE", maxPage);
                session.setAttribute("SEARCHINGUSER", searchValue);
            } catch (JSONException e) {
                System.out.println("Ko parse dc ve jsonobj");
                nextPage = error;
            }
            RequestDispatcher rd = request.getRequestDispatcher(nextPage);
            rd.forward(request, response);
        } catch (Exception e) {
            HttpSession session = request.getSession();
            e.printStackTrace();
            session.setAttribute("CREATE_MESSAGE", "Unexpected error, please try login again!");
            session.setAttribute("RESULT", 3);
            session.setAttribute("SEND", true);
            RequestDispatcher rd = request.getRequestDispatcher("login_JSP.jsp");
            rd.forward(request, response);
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
