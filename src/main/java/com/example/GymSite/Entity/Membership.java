package com.example.GymSite.Entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "membership")
public class Membership {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="membershipid")
    private int membershipid;
    @Column(name="name",length = 45)
    private String name;
    @Column(name="price")
    private double price;
    @Column(name="visits")
    private int visits;
    @Column(name="days")
    private int days;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "membership")
    private transient Set<ClientMembership> clientMemberships = new HashSet<>();

    public Membership(int membershipid, String name, double price, int visits, int days, Set<ClientMembership> clientMemberships) {
        this.membershipid = membershipid;
        this.name = name;
        this.price = price;
        this.visits = visits;
        this.days = days;
        this.clientMemberships = clientMemberships;
    }

    public Membership() {
    }

    public Membership(String name, Double price, int visits, int days) {
        this.name = name;
        this.price = price;
        this.visits = visits;
        this.days = days;
    }

    public int getMembershipid() {
        return membershipid;
    }

    public void setMembershipid(int userid) {
        this.membershipid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Set<ClientMembership> getClientMemberships() {
        return clientMemberships;
    }

    public void setClientMemberships(Set<ClientMembership> clientMemberships) {
        this.clientMemberships = clientMemberships;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getVisits() {
        return visits;
    }

    public void setVisits(int visits) {
        this.visits = visits;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }
}
