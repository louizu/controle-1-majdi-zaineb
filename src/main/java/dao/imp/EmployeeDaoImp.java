package dao.imp;

import dao.EmployeeDao;
import jakarta.annotation.PreDestroy;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;
import Entity.Employee;

import java.util.ArrayList;
import java.util.List;

@Stateless
public class EmployeeDaoImp implements EmployeeDao {

    EntityManagerFactory emfactory = Persistence.createEntityManagerFactory( "Eclipselink_JPA" );

    EntityManager entitymanager = emfactory.createEntityManager( );

    @Override
    public int addEmployee(Employee employee) {
//        returns >0 if added successfully
//        0 if something went wrong
//        -1 if email already exists

        int rowsAffected = 0;
        try {
            boolean findEmail = findEmail(employee.getEmail());

            if (findEmail) {
//                L'email fourni est déjà utilisé
                rowsAffected = -1;
            } else {
                entitymanager.getTransaction( ).begin( );
                entitymanager.persist( employee );
                entitymanager.getTransaction( ).commit( );
                rowsAffected=1;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rowsAffected;
    }

    @Override
    public boolean deleteEmployee(int id) {
//        returns true if deleted successfully
        int resultSet = 0;

        try {
            entitymanager.getTransaction( ).begin( );

            Employee employee = entitymanager.find( Employee.class, id );
            entitymanager.remove( employee );
            entitymanager.getTransaction( ).commit( );
            resultSet=1;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultSet > 0;
    }

//    @Override
//    public int editEmployee(Employee employee) {
////        returns -1 if new email already in database
////        returns 1 if the update was successful
////        returns 0 if the update failed
//        int rowsAffected = 0;
//        try {
//            entitymanager.getTransaction().begin();
//            Employee employee1 = entitymanager.createQuery("SELECT u FROM employee u WHERE u.email = :email AND u.id = :id", Employee.class)
//                    .setParameter("email", employee.getEmail())
//                    .setParameter("id", employee.getId())
//                    .getSingleResult();
//
//            if (employee1 != null) {
//                // Update database if the email didn't change
//                employee1.setNom(employee.getNom());
//                employee1.setPrenom(employee.getPrenom());
//                employee1.setEmail(employee.getEmail());
//                employee1.setSal(employee.getSal());
//                entitymanager.getTransaction().commit();
//                rowsAffected = 1;
//            } else {
//                // Test if the new email already exists in the database
//                boolean emailExists = findEmail(employee.getEmail());
//                if (emailExists) {
//                    rowsAffected = -1;
//                } else {
//                    // Update employee if the new email doesn't exist in the database
//                    entitymanager.persist(employee);
//                    entitymanager.getTransaction().commit();
//                    rowsAffected = 1;
//                }
//            }
//        } catch (Exception e) {
//            if (entitymanager.getTransaction().isActive()) {
//                entitymanager.getTransaction().rollback();
//            }
//            e.printStackTrace();
//        }
//        return rowsAffected;
//
//    }

    @Override
    public boolean findEmail(String email) {
        boolean isUnique = false;

        try {
            Query query = entitymanager.createQuery("SELECT COUNT(e) FROM employee e WHERE e.email LIKE :email");
            query.setParameter("email", email);
            int count = ((Number) query.getSingleResult()).intValue();
            System.out.println(count);

            isUnique = count != 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUnique;
    }

    @Override
    public List<Employee> selectAllEmployee() {

        List<Employee> employees = new ArrayList<>();


        try {
            Query q= entitymanager.createQuery("select u from employee u", Employee.class);
            employees=q.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return employees;
    }

    @PreDestroy
    public void cleanUp() {
        if (entitymanager != null && entitymanager.isOpen()) {
            entitymanager.close();
        }
        if (emfactory != null && emfactory.isOpen()) {
            emfactory.close();
        }
    }
}
