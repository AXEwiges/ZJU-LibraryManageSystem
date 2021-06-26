package model;
import java.util.Date;
import java.text.*;
import java.io.Serializable;
import java.util.Objects;
public class user  implements Serializable{
    public int userid;
    public String username;
    public String passwords;
    public int regiyear;
    public user(){}
    public user(int userid,String username,String passwords,int regiyear){
        this.userid = userid;
        this.username = username;
        this.passwords = passwords;
        this.regiyear = regiyear;
    }

    public int getUserid() {
        return userid;
    }

    public String getUsername() {
        return username;
    }

    public String getPasswords() {
        return passwords;
    }

    public int getRegiyear() {
        return regiyear;
    }

    public user setUserid(int userid) {
        this.userid = userid;
        return this;
    }

    public user setUsername(String username) {
        this.username = username;
        return this;
    }

    public user setPasswords(String passwords) {
        this.passwords = passwords;
        return this;
    }

    public user setRegiyear(int regiyear) {
        this.regiyear = regiyear;
        return this;
    }
    public String toSString() {
        return "<tr><td>" + userid +
                "</td><td>" + username +
                "</td><td>" + regiyear +
                "</td></tr>";
    }
    public String toSSString() {
        return "<td>" + userid +
                "</td><td>" + username +
                "</td><td>" + regiyear +
                "</td>";
    }
}
