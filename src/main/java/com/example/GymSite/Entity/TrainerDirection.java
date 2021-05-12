package com.example.GymSite.Entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "trainerdirection")
public class TrainerDirection {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="trainerdirectionid")
    private int userid;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="trainerid")
    private Trainer trainer;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="directionid")
    private Direction direction;
    @Column(name="note")
    private String note;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "trainerdirection")
    private transient Set<Schedule> schedules = new HashSet<>();

    public TrainerDirection(int userid, Trainer trainer, Direction direction, String note, Set<Schedule> schedules) {
        this.userid = userid;
        this.trainer = trainer;
        this.direction = direction;
        this.note = note;
        this.schedules = schedules;
    }

    public TrainerDirection() {
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public Trainer getTrainer() {
        return trainer;
    }

    public void setTrainer(Trainer trainer) {
        this.trainer = trainer;
    }

    public Direction getDirection() {
        return direction;
    }

    public void setDirection(Direction direction) {
        this.direction = direction;
    }

    public Set<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(Set<Schedule> schedules) {
        this.schedules = schedules;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
