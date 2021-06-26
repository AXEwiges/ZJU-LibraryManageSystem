package model;

import java.util.Date;
import java.text.*;
import java.io.Serializable;
import java.util.Objects;
public class book implements Serializable{
    public String bookid,bookname,booktype,author,publisher;
    public float price;
    public Date pubtime;
    public int storge;
    SimpleDateFormat day = new SimpleDateFormat ("yyyy-MM-dd");
    public book(){}
    public book(String bookid,String bookname,String booktype,String author,Date pubtime,String publisher,float price,int storge){
        this.bookid = bookid;
        this.bookname = bookname;
        this.booktype = booktype;
        this.author = author;
        this.pubtime = pubtime;
        this.publisher = publisher;
        this.price = price;
        this.storge =storge;
    }
    public String getBookid(){
        return bookid;
    }
    public book setBookid(String bookid) {
        this.bookid = bookid;
        return this;
    }
    public String getBookname(){
        return bookname;
    }
    public book setBookname(String bookname){
        this.bookname = bookname;
        return this;
    }
    public String getBooktype(){
        return booktype;
    }
    public book setBooktype(String Booktype){
        this.booktype = Booktype;
        return this;
    }
    public String getAuthor(){
        return author;
    }
    public book setAuthor(String Author){
        this.author = Author;
        return this;
    }
    public Date getPubtime(){
        return pubtime;
    }
    public book setPubtime(Date Time){
        this.pubtime = Time;
        return this;
    }
    public String getPublisher(){
        return publisher;
    }
    public book setPublisher(String Publisher){
        this.publisher = Publisher;
        return this;
    }
    public float getPrice(){
        return price;
    }
    public book setPrice(float Price){
        this.price = Price;
        return this;
    }
    public int getStorge(){
        return storge;
    }
    public book setStorge(int storge) {
        this.storge = storge;
        return this;
    }
    public String toSString() {
        return "<tr><td>" + bookid +
                "</td><td>" + bookname +
                "</td><td>" + booktype +
                "</td><td>" + author +
                "</td><td>" + day.format(pubtime) +
                "</td><td>" + publisher +
                "</td><td>" + price +
                "</td><td>" + storge +
                "</td></tr>";
    }
    public String toSSString() {
        return "<td>" + bookid +
                "</td><td>" + bookname +
                "</td><td>" + booktype +
                "</td><td>" + author +
                "</td><td>" + day.format(pubtime) +
                "</td><td>" + publisher +
                "</td><td>" + price +
                "</td><td>" + storge +
                "</td>";
    }
}
