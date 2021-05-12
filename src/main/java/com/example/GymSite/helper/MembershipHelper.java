package com.example.GymSite.helper;

import com.example.GymSite.Entity.Membership;
import com.example.GymSite.services.MembershipService;

import java.util.List;

public class MembershipHelper {
    public static boolean deleteSuccessful(Membership Membership) {
        MembershipService MembershipService = new MembershipService();
        List<Membership> Memberships = MembershipService.findAllEntities();
        for(Membership db_Membership : Memberships){
            if(db_Membership.getMembershipid() == Membership.getMembershipid()){
                MembershipService.deleteEntity(Membership);
                return true;
            }
        }
        return false;
    }

    public static boolean successfulAdd(Membership membership) {
        MembershipService MembershipService = new MembershipService();
        if (MembershipService.findAllEntities().stream().noneMatch(x -> x.getName().equalsIgnoreCase(membership.getName()))) {
            MembershipService.saveEntity(membership);
        }
        return false;
    }
}
