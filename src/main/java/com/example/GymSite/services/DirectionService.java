package com.example.GymSite.services;

import com.example.GymSite.DAO.DirectionDAO;
import com.example.GymSite.Entity.Direction;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Interface.Service;

import java.util.ArrayList;
import java.util.List;

public class DirectionService implements Service<Direction> {
    DAO daoService = new DirectionDAO();
    @Override
    public Direction findEntity(int id) {
        Direction entity = (Direction) daoService.findById(id);
        return entity;
    }

    @Override
    public void saveEntity(Direction entity) {
        daoService.save(entity);
    }

    @Override
    public void deleteEntity(Direction entity) {
        daoService.delete(entity);
    }

    @Override
    public void updateEntity(Direction entity) {
        daoService.update(entity);
    }

    @Override
    public List<Direction> findAllEntities() {
        List<Direction> Directions =  daoService.findAll();
        List<Direction> tempDirections = new ArrayList<>();
        DirectionService DirectionService = new DirectionService();
        for (Direction tempDirection : Directions) {
            tempDirection = DirectionService.findEntity(tempDirection.getDirectionid());
            tempDirections.add(tempDirection);
        }
        return tempDirections;
    }
}
