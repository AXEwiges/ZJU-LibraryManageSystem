package servlet;
import Base.impl.bookimpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/backbook")
public class backbook extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        int bid = Integer.parseInt(req.getParameter("id"));
        req.getSession().setAttribute("list",new bookimpl().Mybook(bid));
        resp.sendRedirect("smybook.jsp");
    }
}