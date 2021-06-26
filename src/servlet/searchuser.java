package servlet;
import Base.impl.bookimpl;
import Base.impl.userimpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/searchuser")
public class searchuser extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String bid = new String(request.getParameter("lid"));
        String bname = new String(request.getParameter("lname"));
        String byear = new String(request.getParameter("lyear"));
        System.out.println(bname);
        request.getSession().setAttribute("list",new userimpl().searchuser(bid,bname,byear));
        resp.sendRedirect("msuser.jsp");
    }
}
