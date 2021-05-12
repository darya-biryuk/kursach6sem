package com.example.GymSite.DAO;

import com.example.GymSite.Entity.Visit;
import com.example.GymSite.Interface.DAO;
import com.example.GymSite.Utility.HibernateSessionFactory;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public class VisitDAO implements DAO {
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
        Visit visit = session.get(Visit.class, id);
        session.close();
        return visit;
    }
    @Override
    public List findAll() {
        Session session =   HibernateSessionFactory.getSessionFactory().openSession();
        List<Object> visits = (List<Object>)session.createQuery("From Visit ").list();
        session.close();
        return visits;
    }

    @Override
    public Object findByName(String name) {
        return null;
    }
}
