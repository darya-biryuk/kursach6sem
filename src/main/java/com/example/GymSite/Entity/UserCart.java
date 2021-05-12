package com.example.GymSite.Entity;

public class UserCart {
    String membershipName;

    public UserCart(String membershipName) {
        this.membershipName = membershipName;
    }

    public String getMembershipName() {
        return membershipName;
    }

    public void setMembershipName(String membershipName) {
        this.membershipName = membershipName;
    }
}
