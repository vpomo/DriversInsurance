package com.vpomo.driversinsurance.model;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
/**
 *
 * @author Pomogalov V.A.
 */

@XmlRootElement

public class Drivers implements Serializable{
    private static final long serialVersionUID = 6603477834338392140L;
    
    private String fio;
    
    private String birthDay;

    private Integer age;
    
    private String sex;
    
    private String classDriver;

    public String getFio() {
        return fio;
    }

    public void setFio(String fio) {
        this.fio = fio;
    }

    public String getBirthDay() {
        return this.birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age + 20;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getClassDriver() {
        return classDriver;
    }

    public void setClassDriver(String classDriver) {
        this.classDriver = classDriver;
    }
 
    public Drivers(String fio, String birthDay, Integer age, String sex, String classDriver) {
    this.fio = fio;
    this.birthDay = birthDay;
    this.age = age;
    this.sex = sex;
    this.classDriver = classDriver;

    }

    @Override
    public String toString() {
        return "Drivers{" + "fio=" + fio + ", birthDay=" + birthDay + ", age=" + age + ", sex=" + sex + ", classDriver=" + classDriver + '}';
    }
 
    public Drivers() {
    }
 
}
