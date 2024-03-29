package Entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Entity(name = "employee")
public class Employee implements Serializable {
    private long id;
    private String name,email;
    private List skills=new ArrayList<String>();
    private Collection<Project> projects=new ArrayList<Project>();
    private Post post;

    public Employee(){
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    @ElementCollection
    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }

    @Enumerated(EnumType.STRING)
    public Post getPost() {
        return post;
    }

    public void setPost(Post post) {
        this.post = post;
    }
    @ManyToMany(cascade = CascadeType.PERSIST)
    public Collection<Project> getProjects() {
        return projects;
    }

    public void setProjects(Collection<Project> projects) {
        this.projects = projects;
    }
}
