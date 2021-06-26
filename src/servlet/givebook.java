package servlet;
import Base.impl.bookimpl;
import model.book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/givebook")
public class givebook extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        ArrayList<book> bk = (ArrayList<book>) new bookimpl().selectallbook();
        req.getSession().setAttribute("listu",new bookimpl().selectallbook());
        for(book s:bk){
            System.out.println(s.toSSString());
        }
        resp.sendRedirect("managebook.jsp");
    }
}