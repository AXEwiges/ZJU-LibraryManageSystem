package test;
import Base.cone;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.book;
import model.user;
import Base.impl.bookimpl;
import Base.impl.userimpl;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.text.SimpleDateFormat;
public class test {
    public static void main(String[] args) {
//        Date date=new Date();//此时date为当前的时间System.out.println(date);
//        SimpleDateFormat day = new SimpleDateFormat ("yyyy");
//        String year = day.format(date);
//        int yy = Integer.valueOf(year).intValue();
//        System.out.println(yy);
//        bookimpl books = new bookimpl();
//        for(book bk : books.Mybook(319010999)){
//            System.out.println(bk.toSString());
//        }
        userimpl users = new userimpl();
        for(user us : users.selectalluser()){
            System.out.println(us.toSString());
        }

        ArrayList<String> arrayList = new ArrayList<String>();

        try{
            File file = new File("C:/Users/24954/Desktop/sql.txt");
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
        for(String str : arrayList){

        }


    }

    public void testconn(){
        cone b = new cone();

        Connection cn = null;

        try {
            cn = b.condb();
            if (cn != null) {
                System.out.println("yes");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            b.closeAll(cn, null, null);
        }
    }
}
