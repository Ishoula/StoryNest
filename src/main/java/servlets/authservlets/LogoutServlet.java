package servlets.authservlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session=req.getSession(false);
        if(session !=null){
            session.invalidate();
        }
        res.sendRedirect(req.getContextPath() + "/");
    }
}
