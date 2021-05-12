package com.example.GymSite.helper;

import com.example.GymSite.Entity.TrainerDirection;
import com.example.GymSite.Entity.User;
import com.example.GymSite.services.TrainerDirectionService;
import com.example.GymSite.services.UserService;

import java.util.List;

public class TrainerHelper {
    public static boolean deleteSuccessful(TrainerDirection trainerDirection) {
        TrainerDirectionService trainerDirectionService = new TrainerDirectionService();
        List<TrainerDirection> trainerDirections = trainerDirectionService.findAllEntities();
        for(TrainerDirection db_trainerdirection : trainerDirections){
            if(db_trainerdirection.getUserid() == trainerDirection.getUserid()){
                trainerDirectionService.deleteEntity(trainerDirection);
                return true;
            }
        }
        return false;
    }
}
