package com.vpomo.driversinsurance.model;

import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 * @author Pomogalov V.A.
 */

@XmlRootElement

public class Drivers implements Serializable {
    private static final long serialVersionUID = 6603477834338392140L;

    private Integer id;

    private String fio;

    private String birthDay;

    private Integer age;

    private String sex;

    private Integer classDriver;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getClassDriver() {
        return classDriver;
    }

    public void setClassDriver(Integer classDriver) {
        this.classDriver = classDriver;
    }

    public Drivers(Integer id, String fio, String birthDay, Integer age, String sex, Integer classDriver) {
        this.id = id;
        this.fio = fio;
        this.birthDay = birthDay;
        this.age = age;
        this.sex = sex;
        this.classDriver = classDriver;

    }

    @Override
    public String toString() {
        return "Drivers{" + "id=" + id + ", fio=" + fio + ", birthDay=" + birthDay + ", age=" + age + ", sex=" + sex + ", classDriver=" + classDriver + '}';
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Drivers)) {
            return false;
        }
        Drivers other = (Drivers) object;
        if ((this.fio == null && other.fio != null) || (this.fio != null && !this.fio.equals(other.fio))) {
            return false;
        }
        if ((this.birthDay == null && other.birthDay != null) || (this.birthDay != null && !this.birthDay.equals(other.birthDay))) {
            return false;
        }

/*
        if ((this.age == null && other.age != null) || (this.age != null && !this.age.equals(other.age))) {
            return false;
        }
        if ((this.sex == null && other.sex != null) || (this.sex != null && !this.sex.equals(other.sex))) {
            return false;
        }

        if ((this.classDriver == null && other.classDriver != null) || (this.classDriver != null && !this.classDriver.equals(other.classDriver))) {
            return false;
        }
*/

        return true;
    }

    public Drivers() {
    }

}
