
package be.order;

public class OrderDTO {
    private String name, email, phone, urlFB, note;

    public OrderDTO() {
    }

    public OrderDTO(String name, String email, String phone, String urlFB, String note) {
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.urlFB = urlFB;
        this.note = note;
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
    
}
