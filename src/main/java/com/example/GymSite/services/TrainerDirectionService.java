package com.example.GymSite.services;

import com.example.GymSite.DAO.MembershipDAO;
import com.example.GymSite.DAO.TrainerDirectionDAO;
import com.example.GymSite.Entity.Membership;
import com.example.GymSite.Entity.TrainerDirection;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Interface.Service;

import java.util.ArrayList;
import java.util.List;

public class TrainerDirectionService implements Service<TrainerDirection> {
    DAO daoService = new TrainerDirectionDAO();
    @Override
    public TrainerDirection findEntity(int id) {
        TrainerDirection entity = (TrainerDirection) daoService.findById(id);
        return entity;
    }

    @Override
    public void saveEntity(TrainerDirection entity) {
        daoService.save(entity);
    }

    @Override
    public void deleteEntity(TrainerDirection entity) {
        daoService.delete(entity);
    }

    @Override
    public void updateEntity(TrainerDirection entity) {
        daoService.update(entity);
    }

    @Override
    public List<TrainerDirection> findAllEntities() {
        List<TrainerDirection> trainerdirections =  daoService.findAll();
        List<TrainerDirection> tempTrainerDirections = new ArrayList<>();
        TrainerDirectionService trainerDirectionService = new TrainerDirectionService();
        for (TrainerDirection trainerDirection : trainerdirections) {
            trainerDirection = trainerDirectionService.findEntity(trainerDirection.getUserid());
            tempTrainerDirections.add(trainerDirection);
        }
        return tempTrainerDirections;
    }
}
