package pl.coderslab.repository;

import org.hibernate.validator.constraints.EAN;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {

    List<Message> findAllByReceiver(User user);
    Message findById(Long id);
}
