package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.Message;
import pl.coderslab.entity.User;
import pl.coderslab.repository.MessageRepository;

import javax.validation.constraints.Max;
import java.util.List;

@Service
public class MessageService {

    private final MessageRepository messageRepository;

    @Autowired
    public MessageService(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    public void saveMessage(Message message){
        messageRepository.save(message);
    }

    public List<Message> findByReceiver(User user){
        List<Message> userMessages = messageRepository.findAllByReceiver(user);
        return userMessages;
    }

    public Message findById(Long id){
        return messageRepository.findById(id);
    }
}
