package com.example.GymSite.Entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "trainer")
public class Trainer {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="trainerid")
    private int userid;
    @Column(name="firstname",length = 45)
    private String firstname;
    @Column(name="lastname",length = 45)
    private String lastname;
    @Column(name="birthdate")
    private Date birthdate;
    @Column(name="salary")
    private int salary;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "trainer")
    private transient Set<TrainerDirection> trainerDirections = new HashSet<>();

    public Trainer(int userid, String firstname, String lastname, Date birthdate, int salary) {
        this.userid = userid;
        this.firstname = firstname;
        this.lastname = lastname;
        this.birthdate = birthdate;
        this.salary = salary;
    }

    public Trainer() {
    }

    public Set<TrainerDirection> getTrainerDirections() {
        return trainerDirections;
    }

    public void setTrainerDirections(Set<TrainerDirection> trainerDirections) {
        this.trainerDirections = trainerDirections;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }
}
