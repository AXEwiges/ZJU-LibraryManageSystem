package Base;
import model.book;
import java.util.List;
public interface bookcone {
    List<book> selectallbook();
    List<book> searchbook(String bname,String btype,String bauth);
    List<book> Mybook(int myid);
    boolean checkit(String name,String password);
    void goSQL(String sql);
}
