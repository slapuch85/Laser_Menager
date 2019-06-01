package pl.coderslab.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class History {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToMany
    private List<User> users = new ArrayList<>();
    @OneToMany
    private List<Program> programs = new ArrayList<>();
    private LocalDateTime deleted;

    public History() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Program> getPrograms() {
        return programs;
    }

    public void setPrograms(List<Program> programs) {
        this.programs = programs;
    }

    public LocalDateTime getDeleted() {
        return deleted;
    }

    @PrePersist
    public void setDeleted() {
        this.deleted = LocalDateTime.now();
    }
}
