package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.User;

public interface UserRepo extends JpaRepository<User, Long> {

    User findByEmail(String email);
}
