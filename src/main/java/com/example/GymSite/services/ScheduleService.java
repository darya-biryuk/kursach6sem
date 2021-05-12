package com.example.GymSite.services;

import com.example.GymSite.DAO.ScheduleDAO;
import com.example.GymSite.Entity.Schedule;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Interface.Service;

import java.util.ArrayList;
import java.util.List;

public class ScheduleService implements Service<Schedule> {
    DAO daoService = new ScheduleDAO();
    @Override
    public Schedule findEntity(int id) {
        Schedule entity = (Schedule) daoService.findById(id);
        return entity;
    }

    @Override
    public void saveEntity(Schedule entity) {
        daoService.save(entity);
    }

    @Override
    public void deleteEntity(Schedule entity) {
        daoService.delete(entity);
    }

    @Override
    public void updateEntity(Schedule entity) {
        daoService.update(entity);
    }

    @Override
    public List<Schedule> findAllEntities() {
        List<Schedule> Schedules =  daoService.findAll();
        List<Schedule> tempSchedules = new ArrayList<>();
        ScheduleService ScheduleService = new ScheduleService();
        for (Schedule tempSchedule : Schedules) {
            tempSchedule = ScheduleService.findEntity(tempSchedule.getScheduleid());
            tempSchedules.add(tempSchedule);
        }
        return tempSchedules;
    }
}
