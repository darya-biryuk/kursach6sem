package com.example.GymSite.helper;

import com.example.GymSite.Entity.Client;
import com.example.GymSite.Entity.User;
import com.example.GymSite.services.ClientService;

import java.util.List;

public class ClientHelper {
    public static Client getUserClient(User user){
        ClientService clientService = new ClientService();
        List<Client> clientList = clientService.findAllEntities();
        for(Client client : clientList){
            if(client.getUser().getUserid() == user.getUserid()){
                return client;
            }
        }
        return null;
    }
}
