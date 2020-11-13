package view.jb.section1;
import java.sql.*;

public class RegisterBean {
    private String enter_name;
    private String enter_email;
    private Timestamp reg_Date;
    private String enter_gender;
    private String enter_local;

    public String getEnter_name() {
        return enter_name;
    }

    public void setEnter_name(String enter_name) {
        this.enter_name = enter_name;
    }

    public String getEnter_email() {
        return enter_email;
    }

    public void setEnter_email(String enter_email) {
        this.enter_email = enter_email;
    }

    public Timestamp getReg_Date() {
        return reg_Date;
    }

    public void setReg_Date(Timestamp reg_Date) {
        this.reg_Date = reg_Date;
    }

    public String getEnter_gender() {
        return enter_gender;
    }

    public void setEnter_gender(String enter_gender) {
        this.enter_gender = enter_gender;
    }

    public String getEnter_local() {
        return enter_local;
    }

    public void setEnter_local(String enter_local) {
        this.enter_local = enter_local;
    }
}
