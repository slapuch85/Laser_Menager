package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.entity.Message;
import pl.coderslab.service.MessageService;

@Controller
public class MessageController {

    private final MessageService messageService;

    @Autowired
    public MessageController(MessageService messageService) {
        this.messageService = messageService;
    }

    @PostMapping("/saveMessage")
    public String saveMessage(@ModelAttribute Message message){
        message.setNewMessage(1);
        messageService.saveMessage(message);
        System.out.println("wiadomosc zapisana");
        return "forward:/userPage";
    }

}
