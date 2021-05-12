package com.example.GymSite.Entity;

import javax.persistence.*;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "clientmembership")
public class ClientMembership {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="cardid")
    private int cardid;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="clientid")
    private Client client;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="membershipid")
    private Membership membership;
    @Column(name="startdate")
    private Date startdate;
    @Column(name="enddate")
    private Date enddate;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "card")
    private Set<Visit> visits = new HashSet<>();

    public ClientMembership(int cardid, Client client, Membership membership, Date startdate, Date enddate, Set<Visit> visits) {
        this.cardid = cardid;
        this.client = client;
        this.membership = membership;
        this.startdate = startdate;
        this.enddate = enddate;
        this.visits = visits;
    }

    public ClientMembership() {
    }

    public int getCardid() {
        return cardid;
    }

    public void setCardid(int cardid) {
        this.cardid = cardid;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Membership getMembership() {
        return membership;
    }

    public void setMembership(Membership membership) {
        this.membership = membership;
    }

    public Set<Visit> getVisits() {
        return visits;
    }

    public void setVisits(Set<Visit> visits) {
        this.visits = visits;
    }

    public Date getStartdate() {
        return startdate;
    }

    public void setStartdate(Date startdate) {
        this.startdate = startdate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }
}
