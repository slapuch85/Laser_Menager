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
    private String userEmail;
    private String programName;
    @Column(name = "data_wyciecia")
    private LocalDateTime deleted;

    public History() {
    }

    public History(String userEmail, String programName) {
        this.userEmail = userEmail;
        this.programName = programName;
    }

    public Long getId() {
        return id;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public String getProgramName() {
        return programName;
    }

    public LocalDateTime getDeleted() {
        return deleted;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public void setProgramName(String programName) {
        this.programName = programName;
    }

    @PrePersist
    public void setDeleted() {
        this.deleted = LocalDateTime.now();
    }
}
