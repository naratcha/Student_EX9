/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package StudentEX8DB;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author naratcha.s
 */
public class StudentTable {
    public static void insertStudent(Student stu) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Student_EX8PU");
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        try {
            em.persist(stu);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }
    public static void updateStudent(Student stu) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Student_EX8PU");
        EntityManager em = emf.createEntityManager();
        Student fromDb = em.find(Student.class, stu.getId());
        fromDb.setName(stu.getName());
        fromDb.setGpa(stu.getGpa());
        em.getTransaction().begin();
        try {
            em.persist(fromDb);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }
    public static Student findStudentById(int id) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Student_EX8PU");
        EntityManager em = emf.createEntityManager();
        Student stu = em.find(Student.class, id);
        em.close();
        return stu;
    }
    public static List<Student> findAllStudent() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Student_EX8PU");
        EntityManager em = emf.createEntityManager();
        List<Student> stuList = (List<Student>) em.createNamedQuery("Student.findAll").getResultList();
        em.close();
        return stuList;
    }
    public static List<Student> findStudentByName(String name) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Student_EX8PU");
        EntityManager em = emf.createEntityManager();
        Query query = em.createNamedQuery("Student.findByName");
        query.setParameter("name", name);
        List<Student> stuList = (List<Student>) query.getResultList();
        em.close();
        return stuList;
    }
    public static void removeStudent(Student stu) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("Student_EX8PU");
        EntityManager em = emf.createEntityManager();
        Student fromDb = em.find(Student.class, stu.getId());
        em.getTransaction().begin();
        try {
            em.remove(fromDb);
            em.getTransaction().commit();
        } catch (Exception e) {
            e.printStackTrace();
            em.getTransaction().rollback();
        } finally {
            em.close();
        }
                
    }
}
