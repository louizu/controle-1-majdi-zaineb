package Entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

@Entity(name = "project")
public class Project implements Serializable {

    private long id;
    private String name;
    private long budget;
    private Collection<Employee> employees=new ArrayList<Employee>();

    public Project(){
        id=(long) System.nanoTime();
    }

    @Id

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getBudget() {
        return budget;
    }

    public void setBudget(long budget) {
        this.budget = budget;
    }

    @ManyToMany(cascade ={CascadeType.ALL},fetch = FetchType.EAGER)
    @JoinTable(name="AFFECTATION")

    public Collection<Employee> getEmployees() {
        return employees;
    }

    public void setEmployees(Collection<Employee> employees) {
        this.employees = employees;
    }
}
