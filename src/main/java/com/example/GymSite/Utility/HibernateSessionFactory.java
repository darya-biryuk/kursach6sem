package com.example.GymSite.Utility;

import com.example.GymSite.Entity.*;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

public class HibernateSessionFactory {
    private static SessionFactory sessionFactory;
    private static String configFileName = "hibernate.cfg.xml";

    private HibernateSessionFactory() {}

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                Configuration configuration = new Configuration().configure();
                configuration.addAnnotatedClass(Client.class);
                configuration.addAnnotatedClass(ClientMembership.class);
                configuration.addAnnotatedClass(Direction.class);
                configuration.addAnnotatedClass(Membership.class);
                configuration.addAnnotatedClass(Room.class);
                configuration.addAnnotatedClass(Schedule.class);
                configuration.addAnnotatedClass(Trainer.class);
                configuration.addAnnotatedClass(TrainerDirection.class);
                configuration.addAnnotatedClass(User.class);
                configuration.addAnnotatedClass(Visit.class);
                StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().configure(configFileName);
                sessionFactory = configuration.buildSessionFactory(builder.build());

            } catch (Exception e) {
                System.out.println("Исключение!" + e);
            }
        }
        return sessionFactory;
    }
}
