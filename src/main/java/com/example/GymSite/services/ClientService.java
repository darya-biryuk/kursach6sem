package com.example.GymSite.services;

import com.example.GymSite.DAO.ClientDAO;
import com.example.GymSite.DAO.UserDAO;
import com.example.GymSite.Entity.Client;
import com.example.GymSite.Entity.User;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Interface.Service;

import java.util.ArrayList;
import java.util.List;

public class ClientService implements Service<Client> {
    DAO daoService = new ClientDAO();
    @Override
    public Client findEntity(int id) {
        Client entity = (Client) daoService.findById(id);
        return entity;
    }

    @Override
    public void saveEntity(Client entity) {
        daoService.save(entity);
    }

    @Override
    public void deleteEntity(Client entity) {
        daoService.delete(entity);
    }

    @Override
    public void updateEntity(Client entity) {
        daoService.update(entity);
    }

    @Override
    public List<Client> findAllEntities() {
        List<Client> clients =  daoService.findAll();
        List<Client> tempClients = new ArrayList<>();
        ClientService clientService = new ClientService();
        for (Client tempClient : clients) {
            tempClient = clientService.findEntity(tempClient.getClientid());
            tempClients.add(tempClient);
        }
        return tempClients;
    }
}
