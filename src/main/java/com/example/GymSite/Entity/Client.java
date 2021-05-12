package com.example.GymSite.Entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "client")
public class Client {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="clientid")
    private int clientid;
    @Column(name="firstname",length = 45)
    private String firstname;
    @Column(name="lastname",length = 45)
    private String lastname;
    @Column(name="address",length = 45)
    private String address;
    @Column(name="email",length = 45)
    private String email;
    @Column(name="telephone",length = 45)
    private String telephone;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="userid")
    private User user;
    @OneToMany(fetch = FetchType.EAGER,mappedBy = "clientid")
    private transient Set<ClientMembership> clientMemberships = new HashSet<>();

    public Client(int clientid, String username, String lastname, String address, String telephone, User user, Set<ClientMembership> clientMemberships) {
        this.clientid = clientid;
        this.firstname = username;
        this.lastname = lastname;
        this.address = address;
        this.telephone = telephone;
        this.user = user;
        this.clientMemberships = clientMemberships;
    }

    public Client() {
    }

    public Client(String firstName, String lastName, String userPhone, String userAddress, String email) {
        this.firstname = firstName;
        this.lastname = lastName;
        this.address = userPhone;
        this.telephone = userAddress;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getClientid() {
        return clientid;
    }

    public void setClientid(int clientid) {
        this.clientid = clientid;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String username) {
        this.firstname = username;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<ClientMembership> getClientMemberships() {
        return clientMemberships;
    }

    public void setClientMemberships(Set<ClientMembership> clientMemberships) {
        this.clientMemberships = clientMemberships;
    }
}
