package pl.coderslab.controller;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import pl.coderslab.entity.User;
import pl.coderslab.service.UserService;

@Controller
@SessionAttributes("userSession")
public class LoginController {

    private final UserService userService;
    @Autowired
    public LoginController(UserService userService) {
        this.userService = userService;
    }

    @PostMapping("/login")
    public String findUser(@RequestParam String email, @RequestParam String password, Model model) {
        User user = userService.findByEmail(email);
        if (user == null) {
            return "loginPage";
        } else if (BCrypt.checkpw(password, user.getPassword())) {
            model.addAttribute("userSession", user);
            return "redirect:/allProgramList";
        }
        return "loginPage";
    }
}
