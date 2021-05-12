package com.example.GymSite.services;

import com.example.GymSite.DAO.UserDAO;
import com.example.GymSite.Entity.User;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Interface.Service;

import java.util.ArrayList;
import java.util.List;

public class UserService implements Service<User> {
    DAO daoService = new UserDAO();
    @Override
    public User findEntity(int id) {
        User entity = (User) daoService.findById(id);
        return entity;
    }

    public User findEntityByName(String name) {
        User entity = (User) daoService.findByName(name);
        return entity;
    }

    @Override
    public void saveEntity(User entity) {
        daoService.save(entity);
    }

    @Override
    public void deleteEntity(User entity) {
        daoService.delete(entity);
    }

    @Override
    public void updateEntity(User entity) {
        daoService.update(entity);
    }

    @Override
    public List<User> findAllEntities() {
        List<User> users =  daoService.findAll();
        List<User> tempUsers = new ArrayList<>();
        UserService userService = new UserService();
        for (User tempUser : users) {
            tempUser = userService.findEntity(tempUser.getUserid());
            tempUsers.add(tempUser);
        }
        return tempUsers;
    }
}
