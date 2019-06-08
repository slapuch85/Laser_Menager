package pl.coderslab.controller;

import org.hibernate.validator.constraints.EAN;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.entity.History;
import pl.coderslab.service.HistoryService;

import javax.transaction.Transactional;
import java.util.List;

@Controller
@Transactional
public class HistoryController {

    private final HistoryService historyService;

    @Autowired
    public HistoryController(HistoryService historyService) {
        this.historyService = historyService;
    }

    @GetMapping("/history")
    public String showHistory(Model model){
        List<History> history = historyService.lastDeleted();
        model.addAttribute("history", history);
        return "history";
    }
}
