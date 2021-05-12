package com.example.GymSite.DAO;

import com.example.GymSite.Entity.ClientMembership;
import com.example.GymSite.Entity.Membership;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Utility.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class MembershipDAO implements DAO {
    @Override
    public void save(Object obj) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.save(obj);
        tx1.commit();
        session.close();
    }

    @Override
    public void update(Object obj) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.saveOrUpdate(obj);
        tx1.commit();
        session.close();
    }

    @Override
    public void delete(Object obj) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Transaction tx1 = session.beginTransaction();
        session.delete(obj);
        tx1.commit();
        session.close();
    }

    @Override
    public Object findById(int id) {
        Session session = HibernateSessionFactory.getSessionFactory().openSession();
        Membership membership = session.get(Membership.class, id);
        session.close();
        return membership;
    }
    @Override
    public List findAll() {
        Session session =   HibernateSessionFactory.getSessionFactory().openSession();
        List<Object> memberships = (List<Object>)session.createQuery("From Membership").list();
        session.close();
        return memberships;
    }

    @Override
    public Object findByName(String name) {
        return null;
    }
}
