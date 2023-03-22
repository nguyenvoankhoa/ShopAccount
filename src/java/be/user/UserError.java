/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package be.user;

/**
 *
 * @author ADMIN
 */
public class UserError {

    private String usernameE;
    private String passwordE;
    private String nameE;

    public UserError() {
        this.usernameE = "";
        this.passwordE = "";
        this.nameE = "";
    }

    public String getUsernameE() {
        return usernameE;
    }

    public void setUsernameE(String usernameE) {
        this.usernameE = usernameE;
    }

    public String getPasswordE() {
        return passwordE;
    }

    public void setPasswordE(String passwordE) {
        this.passwordE = passwordE;
    }

    public String getNameE() {
        return nameE;
    }

    public void setNameE(String nameE) {
        this.nameE = nameE;
    }


    
    
}
