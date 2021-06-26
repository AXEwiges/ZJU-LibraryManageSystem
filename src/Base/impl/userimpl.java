package Base.impl;
import Base.cone;
import model.user;
import model.book;
import Base.bookcone;
import Base.usercone;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class userimpl extends cone implements usercone{
    @Override
    public List<user> selectalluser(){
        String sql = "select * from users;";
        ArrayList<user> userlist = new ArrayList<>();
        user us = null;

        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;

        try{
            cn = condb();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while(rs.next()){
                us = new user(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
                userlist.add(us);
            }
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }
        return userlist;
    }

    @Override
    public List<user> searchuser(String id, String name, String year) {
        if(id == null){
             id = "'%'" ;
        }else{
            id = "'"+"%"+id+"%"+"'";
        }
        if(name == null){
            name = "'%'" ;
        }else{
            name = "'"+"%"+name+"%"+"'";
        }
        if(year == null){
            year = "'%'" ;
        }else{
            year = "'"+"%"+year+"%"+"'";
        }
        String sql = "select * from users where userid like "+id+" and username like "+name+" and regiyear like "+year+";";
        System.out.println(sql);
        ArrayList<user> userlist = new ArrayList<>();
        user us = null;

        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;

        try{
            cn = condb();
            st = cn.createStatement();
            rs = st.executeQuery(sql);

            while(rs.next()){
                us = new user(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
                userlist.add(us);
            }
        }
        catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        finally {
            closeAll(cn, st, rs);
        }
        return userlist;
    }
}
