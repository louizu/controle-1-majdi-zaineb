package beans;

import Entity.Employee;
import Entity.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.Arrays;

public class CreateEmployee {

    public static void main(String[] args) {

        EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("Eclipselink_JPA");
        EntityManager entitymanager = emfactory.createEntityManager();
        entitymanager.getTransaction().begin();

        // Création d'employés
        Employee employee1 = new Employee();
        employee1.setId(1);
        employee1.setName("John Doe");
        employee1.setEmail("john@example.com");
        employee1.setPost(Post.DEV);

        Employee employee2 = new Employee();
        employee2.setId(2);
        employee2.setName("Jane Smith");
        employee2.setEmail("jane@example.com");
        employee2.setPost(Post.MANAGER);

        // Création de projets
        Project project1 = new Project();
        project1.setId(1);
        project1.setName("Project 1");
        project1.setBudget(10000);

        Project project2 = new Project();
        project2.setId(2);
        project2.setName("Project 2");
        project2.setBudget(20000);

        // Attribution des projets aux employés
        employee1.setProjects(Arrays.asList(project1, project2));
        employee2.setProjects(Arrays.asList(project1));

        // Persistez les employés et les projets
        entitymanager.persist(employee1);
        entitymanager.persist(employee2);

        entitymanager.getTransaction().commit();
        entitymanager.close();
        emfactory.close();
    }
}
