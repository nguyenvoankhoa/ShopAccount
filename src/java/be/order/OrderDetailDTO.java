/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package be.order;

public class OrderDetailDTO {
    private String name, email, phone, urlFB, note, accountName;
    private int orderID;
    private int accountID;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String name, String email, String phone, String urlFB, String note, String accountName, int orderID, int accountID) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.urlFB = urlFB;
        this.note = note;
        this.accountName = accountName;
        this.orderID = orderID;
        this.accountID = accountID;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUrlFB() {
        return urlFB;
    }

    public void setUrlFB(String urlFB) {
        this.urlFB = urlFB;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int OrderID) {
        this.orderID = OrderID;
    }
    
}
