package com.example.GymSite.helper;

import com.example.GymSite.Entity.Client;
import com.example.GymSite.Entity.User;
import com.example.GymSite.services.ClientService;
import com.example.GymSite.services.UserService;

import java.util.List;

public class UserHelper {
    public static boolean successfulRegistration(User user, Client client){
        UserService userService = new UserService();
        ClientService clientService = new ClientService();
        if (userService.findAllEntities().stream().noneMatch(x -> x.getUsername().equalsIgnoreCase(user.getUsername()))) {
            userService.saveEntity(user);
            List<User> users = userService.findAllEntities();
            for(User db_user : users){
                if(db_user.getUsername().equals(user.getUsername())){
                    user.setUserid(db_user.getUserid());
                    client.setUser(user);
                    clientService.saveEntity(client);
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean successfulEdit(User user, Client client){
        UserService userService = new UserService();
        List<User> users = userService.findAllEntities();
        ClientService clientService = new ClientService();
        List<Client> clients = clientService.findAllEntities();
        /*List<User> users = userService.findAllEntities();*/
            for(User db_user : users){
                if(db_user.getUsername().equals(user.getUsername())){
                    user.setUserid(db_user.getUserid());
                    userService.updateEntity(user);
                }
            }
        for(Client db_client : clients){
            if(db_client.getEmail().equals(client.getEmail())){
                client.setClientid(db_client.getClientid());
                client.setUser(user);
                clientService.updateEntity(client);
            }
        }
        return true;
    }

    public static User successfulLogin(User user) {
        UserService userService = new UserService();
        if (userService.findAllEntities().stream().anyMatch(x -> x.getUsername().equalsIgnoreCase(user.getUsername()))) {
            List<User> users = userService.findAllEntities();
            for(User db_user : users){
                if(db_user.getUsername().equals(user.getUsername())){
                    user.setUserid(db_user.getUserid());
                    user.setRole(db_user.getRole());
                    return user;
                }
            }
        }
        return null;
    }
    public static boolean deleteSuccessful(User user) {
        UserService userService = new UserService();
            List<User> users = userService.findAllEntities();
            for(User db_user : users){
                if(db_user.getUsername().equals(user.getUsername())){
                    user.setUserid(db_user.getUserid());
                    userService.deleteEntity(user);
                    return true;
                }
            }
       return false;
    }
}

