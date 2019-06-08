package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.entity.Message;
import pl.coderslab.service.MessageService;


public class MessageConverter implements Converter<String, Message> {

    @Autowired
    MessageService messageService;

    public MessageConverter() {
    }

    @Override
    public Message convert(String s){
        return messageService.findById(Long.parseLong(s));
    }
}
