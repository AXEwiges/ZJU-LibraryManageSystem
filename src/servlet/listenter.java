package servlet;
import Base.impl.bookimpl;
import model.book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.util.ArrayList;

@WebServlet("/listenter")
public class listenter extends HttpServlet{
    ArrayList<String> arrayList = new ArrayList<String>();
    public void getarray(){
        try{
            File file = new File("C:\\Users\\24954\\Desktop\\sql.txt");
            FileReader fr = null;
            try {
                fr = new FileReader(file);
            } catch (FileNotFoundException fileNotFoundException) {
                fileNotFoundException.printStackTrace();
            }
            BufferedReader br = new BufferedReader(fr);
            String str = null;

            while (true) {
                try {
                    if (!((str = br.readLine())!=null)) break;
                } catch (IOException ioException) {
                    ioException.printStackTrace();
                }
                arrayList.add(str);
            }
            try {
                br.close();
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
            try {
                fr.close();
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getarray();
        bookimpl bk = new bookimpl();
        for(String str : arrayList){
            bk.goSQL(str);
        }
        resp.sendRedirect("mjump2.jsp");
    }
}