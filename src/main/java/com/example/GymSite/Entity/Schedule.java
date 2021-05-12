package com.example.GymSite.Entity;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "schedule")
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="scheduleid")
    private int scheduleid;
    @Column(name="date",length = 45)
    private Date date;
    @Column(name="starttime",length = 45)
    private Time starttime;
    @Column(name="endtime",length = 45)
    private Time endtime;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="roomid")
    private Room roomid;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="trainerdirectionid")
    private TrainerDirection trainerdirectionid;
    @Column(name="note")
    private String note;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "schedule")
    private transient Set<Visit>  visits = new HashSet<>();

    public Schedule(int scheduleid, Date date, Time starttime, Time endtime, Room roomid, TrainerDirection trainerdirectionid, String note, Set<Visit> visits) {
        this.scheduleid = scheduleid;
        this.date = date;
        this.starttime = starttime;
        this.endtime = endtime;
        this.roomid = roomid;
        this.trainerdirectionid = trainerdirectionid;
        this.note = note;
        this.visits = visits;
    }

    public Schedule() {
    }

    public int getScheduleid() {
        return scheduleid;
    }

    public void setScheduleid(int scheduleid) {
        this.scheduleid = scheduleid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStarttime() {
        return starttime;
    }

    public void setStarttime(Time starttime) {
        this.starttime = starttime;
    }

    public Time getEndtime() {
        return endtime;
    }

    public void setEndtime(Time endtime) {
        this.endtime = endtime;
    }

    public Room getRoomid() {
        return roomid;
    }

    public void setRoomid(Room roomid) {
        this.roomid = roomid;
    }

    public TrainerDirection getTrainerdirectionid() {
        return trainerdirectionid;
    }

    public void setTrainerdirectionid(TrainerDirection trainerdirectionid) {
        this.trainerdirectionid = trainerdirectionid;
    }

    public Set<Visit> getVisits() {
        return visits;
    }

    public void setVisits(Set<Visit> visits) {
        this.visits = visits;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
