package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepo;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {

    private final UserRepo userRepo;

    @Autowired
    public UserService(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    public void createUser(User user){
        userRepo.save(user);
    }

    public User findByEmail(String email){
        return userRepo.findByEmail(email);
    }

    public User findById(Long id){
        return userRepo.findOne(id);
    }

    public List<User> findAllUsers(){
        return userRepo.findAll();
    }
}
