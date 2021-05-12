package com.example.GymSite.Entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "direction")
public class Direction {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="directionid")
    private int directionid;
    @Column(name="name",length = 45)
    private String name;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "direction")
    private transient Set<TrainerDirection> trainerDirections = new HashSet<>();

    public Direction(int directionid, String name) {
        this.directionid = directionid;
        this.name = name;
    }

    public Direction() {
    }

    public Set<TrainerDirection> getTrainerDirections() {
        return trainerDirections;
    }

    public void setTrainerDirections(Set<TrainerDirection> trainerDirections) {
        this.trainerDirections = trainerDirections;
    }

    public int getDirectionid() {
        return directionid;
    }

    public void setDirectionid(int directionid) {
        this.directionid = directionid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
