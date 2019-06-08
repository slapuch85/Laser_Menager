package pl.coderslab.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.Program;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepo;
import pl.coderslab.service.MessageService;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
@Transactional

public class UserController {

    private final UserService userService;
    private final MessageService messageService;

    @Autowired
    public UserController(UserService userService, MessageService messageService) {
        this.userService = userService;
        this.messageService = messageService;
    }


    @GetMapping("/addUser")
    public String userForm(Model model) {
        model.addAttribute("user", new User());
        return "userForm";
    }

    @PostMapping("/addUser")
    public String addUser(@ModelAttribute @Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "userForm";
        }
        String pass = user.getPassword();
        user.setPassword(BCrypt.hashpw(pass, BCrypt.gensalt(5)));
        userService.createUser(user);
        return "loginPage";
    }

    @PostMapping("/userPage")
    public String dispUserPage(HttpSession ses, Model model) {
        User sesUser = (User)ses.getAttribute("userSession");
        //User user = userService.findById(id);
        List<Message> messages = messageService.findByReceiver(sesUser);
        System.out.println(messages.toString());
        model.addAttribute("currentUser", sesUser);
        model.addAttribute("newMessage", new Message());
        model.addAttribute("usersMessages", messages);
        model.addAttribute("program", new Program());
        return "userPage";
    }

    @ModelAttribute("allUsers")
    public List<User> getAllUsers() {
        List<User> allUsers = userService.findAllUsers();
        return allUsers;
    }

}
