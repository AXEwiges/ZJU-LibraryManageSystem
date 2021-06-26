package Base;
import model.book;
import model.user;
import java.util.List;
public interface usercone {
    List<user> selectalluser();
    List<user> searchuser(String id, String name, String year);

}
