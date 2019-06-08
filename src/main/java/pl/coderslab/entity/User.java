package pl.coderslab.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.mindrot.jbcrypt.BCrypt;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name="pracownicy")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "To pole nie może być puste")
    private String firstName;
    @NotBlank(message = "To pole nie może być puste")
    private String lastName;
    @NotBlank(message = "To pole nie może być puste")
    @Column(unique = true)
    @Email
    private String email;
    @NotBlank(message = "To pole nie może być puste")
    private String password;

    @OneToMany(mappedBy = "sender")
    private List<Message> messagesSend = new ArrayList<>();

    @OneToMany(mappedBy = "receiver")
    private List<Message> messagesGet = new ArrayList<>();


    public User() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Message> getMessagesSend() {
        return messagesSend;
    }

    public void setMessagesSend(List<Message> messagesSend) {
        this.messagesSend = messagesSend;
    }

    public List<Message> getMessagesGet() {
        return messagesGet;
    }

    public void setMessagesGet(List<Message> messagesGet) {
        this.messagesGet = messagesGet;
    }
}
