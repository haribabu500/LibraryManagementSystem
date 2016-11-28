package com.prasan.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class LibraryManagementServiceManager {
	public static EntityManager entityManager = createEntityManager();
	public static EntityManager createEntityManager(){
		try{
			return Persistence
			.createEntityManagerFactory("LIBRARY_MANAGEMENT")
			.createEntityManager();
		}
		catch(Exception e){
			System.out.println(e);
			return null;
		}
	}
	public static void save(Object object) {
		entityManager.getTransaction().begin();
		entityManager.persist(object);
		entityManager.getTransaction().commit();
		System.out.println("Object ==>"+object+" saved");
	}
	
	public static void update(Object object) {
		entityManager.getTransaction().begin();
		entityManager.merge(object);
		entityManager.getTransaction().commit();
		System.out.println("Object ==>"+object+" updated");
	}
	public static List<Object> select(String query, Class clasz) {
		return entityManager.createQuery(query, clasz).getResultList();
	}
	public static Object find(int id,Class class1){
		return entityManager.find(class1, id);
	}
	public static void remove(int id,Class classz){
		Object object=find(id, classz);
		entityManager.getTransaction().begin();
			entityManager.remove(object);
		entityManager.getTransaction().commit();
		System.out.println("Object ==>"+object+" removed");
	}

}
