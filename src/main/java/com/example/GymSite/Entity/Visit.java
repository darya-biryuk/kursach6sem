package com.example.GymSite.Entity;

import javax.persistence.*;

@Entity
@Table(name = "visit")
public class Visit {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="visitid")
    private int visitid;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="cardid")
    private ClientMembership card;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="scheduleid")
    private Schedule schedule;

    public Visit(int visitid, ClientMembership card, Schedule scheduleid) {
        this.visitid = visitid;
        this.card = card;
        this.schedule = scheduleid;
    }

    public Visit() {
    }

    public int getVisitid() {
        return visitid;
    }

    public void setVisitid(int visitid) {
        this.visitid = visitid;
    }

    public ClientMembership getCard() {
        return card;
    }

    public void setCard(ClientMembership card) {
        this.card = card;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
}
