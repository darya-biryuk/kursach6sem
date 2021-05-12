package com.example.GymSite.services;

import com.example.GymSite.DAO.MembershipDAO;
import com.example.GymSite.Entity.Membership;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Interface.Service;

import java.util.ArrayList;
import java.util.List;

public class MembershipService implements Service<Membership> {
    DAO daoService = new MembershipDAO();
    @Override
    public Membership findEntity(int id) {
        Membership entity = (Membership) daoService.findById(id);
        return entity;
    }

    @Override
    public void saveEntity(Membership entity) {
        daoService.save(entity);
    }

    @Override
    public void deleteEntity(Membership entity) {
        daoService.delete(entity);
    }

    @Override
    public void updateEntity(Membership entity) {
        daoService.update(entity);
    }

    @Override
    public List<Membership> findAllEntities() {
        List<Membership> memberships =  daoService.findAll();
        List<Membership> tempMemberships = new ArrayList<>();
        MembershipService membershipService = new MembershipService();
        for (Membership tempMembership : memberships) {
            tempMembership = membershipService.findEntity(tempMembership.getMembershipid());
            tempMemberships.add(tempMembership);
        }
        return tempMemberships;
    }
}
