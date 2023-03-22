
package be.shopping;

import java.io.Serializable;

public class AccountDTO implements Serializable{
    private int id;
    private String imageLink;
    private String accountName;
    private String rank;
    private String description;
    private int price;

    public AccountDTO(int id, String imageLink, String acccountName, String rank, String description, int price) {
        this.id = id;
        this.imageLink = imageLink;
        this.accountName = acccountName;
        this.rank = rank;
        this.description = description;
        this.price = price;
    }

    public AccountDTO(String imageLink, String acccountName, String rank, String description, int price) {
        this.imageLink = imageLink;
        this.accountName = acccountName;
        this.rank = rank;
        this.description = description;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAcccountName(String accountName) {
        this.accountName = accountName;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
   
    
    
    
}
