package be.user;

public class UserDTO {

    private int id;
    private String username;
    private String password;
    private String name;
    private String phone;
    private int role;

    public UserDTO() {
    }

    public UserDTO(int id, String name, String phone, int role) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.role = role;
    }

    public UserDTO(String username, String password, String name, String phone) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.phone = phone;
    }
    

    public UserDTO(String username, String password, String name, String phone, int role, int id) {
        this.username = username;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.role = role;
        this.id = id;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
