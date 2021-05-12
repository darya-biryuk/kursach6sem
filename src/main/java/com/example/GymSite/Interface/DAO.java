package com.example.GymSite.Interface;

import java.util.List;

public interface DAO<T> {
    void save(T obj);
    void update(T obj);
    void delete(T obj);
    T findById(int id);
    List<T> findAll();
    T findByName(String name);
}
