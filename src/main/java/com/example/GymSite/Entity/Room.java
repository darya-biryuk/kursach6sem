package com.example.GymSite.Entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "room")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="roomid")
    private int roomid;
    @Column(name="name",length = 45)
    private String name;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "room")
    private transient Set<Schedule> schedules = new HashSet<>();

    public Room(int roomid, String name, Set<Schedule> schedules) {
        this.roomid = roomid;
        this.name = name;
        this.schedules = schedules;
    }

    public Room() {
    }

    public Set<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(Set<Schedule> schedules) {
        this.schedules = schedules;
    }

    public int getRoomid() {
        return roomid;
    }

    public void setRoomid(int roomid) {
        this.roomid = roomid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
