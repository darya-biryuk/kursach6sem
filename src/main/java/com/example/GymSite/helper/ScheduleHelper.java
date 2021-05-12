package com.example.GymSite.helper;

import com.example.GymSite.Entity.Schedule;
import com.example.GymSite.services.ScheduleService;

import java.util.List;

public class ScheduleHelper {
    public static boolean deleteSuccessful(Schedule Schedule) {
        ScheduleService ScheduleService = new ScheduleService();
        List<Schedule> Schedules = ScheduleService.findAllEntities();
        for(Schedule db_Schedule : Schedules){
            if(db_Schedule.getScheduleid() == Schedule.getScheduleid()){
                ScheduleService.deleteEntity(Schedule);
                return true;
            }
        }
        return false;
    }
}
