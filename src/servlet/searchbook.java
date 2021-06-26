package servlet;
import Base.impl.bookimpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/searchbook")
public class searchbook extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String bname = new String(request.getParameter("lname"));
        String btype = new String(request.getParameter("ltype"));
        String bauth = new String(request.getParameter("lauth"));
        System.out.println(bname);
        request.getSession().setAttribute("books",new bookimpl().searchbook(bname,btype,bauth));
        resp.sendRedirect("sbook.jsp");
    }
}
