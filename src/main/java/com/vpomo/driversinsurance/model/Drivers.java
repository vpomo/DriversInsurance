package com.vpomo.driversinsurance.model;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
 
import javax.xml.bind.annotation.XmlRootElement;
/**
 *
 * @author Pomogalov V.A.
 */

@XmlRootElement

public class Drivers implements Serializable{
    private static final long serialVersionUID = 6603477834338392140L;
    
    private String fio;
    
    //@XmlAttribute(name = "birthday")
    private String birthday;

    //@XmlAttribute(name = "age")
    private Integer age;
    
    //@XmlAttribute(name = "sex")
    private String sex;
    
    //@XmlAttribute(name = "classdriver")
    private String classdriver;

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getBirthday() {
        return this.birthday;         
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getClassdriver() {
        return classdriver;
    }

    public void setClassdriver(String classDriver) {
        this.classdriver = classDriver;
    }
 
    public Drivers(String fio, String birthDay, Integer age, String sex, String classDriver) {
    this.fio = fio;
    this.birthday = birthDay;
    this.age = age;
    this.sex = sex;
    this.classdriver = classDriver;

    }

    @Override
    public String toString() {
        return "Drivers{" + "fio=" + fio + ", birthday=" + birthday + ", age=" + age + ", sex=" + sex + ", classdriver=" + classdriver + '}';
    }
 
    public Drivers() {
    }
 
}
