/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sendEmail;

/**
 *
 * @author Admin
 */
public class UserSendMailDTO {

    private String email;
    private String fullName;
    private String password;
    private String address;
    private String birthday;
    private int phone;
    private String role;
    private String code;

    public UserSendMailDTO() {
        this.email = "";
        this.fullName = "";
        this.password = "";
        this.address = "";
        this.birthday = "";
        this.phone = 0;
        this.role = "";
        this.code = "";
    }

    public UserSendMailDTO(String email, String fullName, String password, String address, String birthday, int phone, String role, String code) {
        this.email = email;
        this.fullName = fullName;
        this.password = password;
        this.address = address;
        this.birthday = birthday;
        this.phone = phone;
        this.role = role;
        this.code = code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

}
