package Base.impl;
import Base.cone;
import model.book;
import Base.bookcone;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class bookimpl extends cone implements bookcone{
    @Override
    public List<book> selectallbook() {
        String sql = "select * from book;";
        ArrayList<book> booklist = new ArrayList<>();
        book bk = null;

        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;

        try{
            cn = condb();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while(rs.next()){
                bk = new book(rs.getString(1),rs.getString(2)
                        ,rs.getString(3),rs.getString(4)
                        , rs.getDate(5),rs.getString(6),rs.getFloat(7),rs.getInt(8));
                booklist.add(bk);
            }
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }
        return booklist;
    }

    @Override
    public List<book> searchbook(String bname,String btype,String bauth) {
        if(bname==null || bname=="-1") {
            bname = "'%'" ;
        }else{
            bname = "'"+"%"+bname+"%"+"'";
        }
        if(btype==null || btype=="-1") {
            btype = "'%'";
        }else{
            btype = "'"+"%"+btype+"%"+"'";
        }
        if(bauth==null || bauth=="-1") {
            bauth = "'%'";
        }else{
            bauth = "'"+"%"+bauth+"%"+"'";
        }
        String sql = "select * from book where bookname like"+bname+" and booktype like "+btype+" and author like "+bauth+";";
        System.out.println(sql);
        ArrayList<book> booklist = new ArrayList<>();
        book bk = null;

        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;

        try{
            cn = condb();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while(rs.next()){
                bk = new book(rs.getString(1),rs.getString(2)
                        ,rs.getString(3),rs.getString(4)
                        , rs.getDate(5),rs.getString(6),rs.getFloat(7),rs.getInt(8));
                booklist.add(bk);
            }
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }
        return booklist;
    }

    @Override
    public List<book> Mybook(int myid) {
        String sql = "select * from borrow;";
        ArrayList<Integer> books = new ArrayList<Integer>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try{
            cn = condb();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            int u,n;
            Date k;
            while(rs.next()){
                u = rs.getInt("userid");
                n = rs.getInt("bookid");
                k = rs.getDate("backtime");
                if(u==myid && (k==null)){
                    books.add(n);
                }
            }
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }

        sql = "select * from book;";
        ArrayList<book> booklist = new ArrayList<>();
        book bk = null;
        int flag = 0;

        try{
            cn = condb();
            st = cn.createStatement();
            rs = st.executeQuery(sql);
            int n;
            int u;
            while(rs.next()){
                flag = 0;
                n = rs.getInt("bookid");
                for(int i = 0;i < books.size();i++){
                    u = books.get(i);
                    if(u==n){
                        flag = 1;
                        break;
                    }
                }
                if(flag == 1){
                    bk = new book(rs.getString(1),rs.getString(2)
                            ,rs.getString(3),rs.getString(4)
                            , rs.getDate(5),rs.getString(6),rs.getFloat(7),rs.getInt(8));
                    booklist.add(bk);
                }
            }
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }
        return booklist;
    }

    @Override
    public boolean checkit(String name,String password) {
        String sql = "select * from users;";
        book bk = null;
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        String Name = null;
        String Password = null;
        int k = 0;
        try{
            cn = condb();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while(rs.next()){
                Name = rs.getString("username");
                Password = rs.getString("passwords");
                if(Name==name && Password==password){
                    k = 1;
                    break;
                }
            }
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }
        if(k == 1)
            return true;
        else
            return false;
    }

    @Override
    public void goSQL(String sql) {
        ArrayList<book> booklist = new ArrayList<>();
        book bk = null;

        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;

        try{
            cn = condb();
            st = cn.createStatement();
            st.executeUpdate(sql);
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }
    }
}
