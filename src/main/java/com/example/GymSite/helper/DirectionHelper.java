package com.example.GymSite.helper;

import com.example.GymSite.Entity.Direction;
import com.example.GymSite.Entity.Direction;
import com.example.GymSite.services.ClientService;
import com.example.GymSite.services.DirectionService;
import com.example.GymSite.services.DirectionService;

import java.util.List;

public class DirectionHelper {
    public static boolean deleteSuccessful(Direction Direction) {
        DirectionService DirectionService = new DirectionService();
        List<Direction> Directions = DirectionService.findAllEntities();
        for(Direction db_Direction : Directions){
            if(db_Direction.getDirectionid() == Direction.getDirectionid()){
                DirectionService.deleteEntity(Direction);
                return true;
            }
        }
        return false;
    }

    public static boolean successfulAdd(Direction direction) {
        DirectionService DirectionService = new DirectionService();
        if (DirectionService.findAllEntities().stream().noneMatch(x -> x.getName().equalsIgnoreCase(direction.getName()))) {
            DirectionService.saveEntity(direction);
        }
        return false;
    }
}
