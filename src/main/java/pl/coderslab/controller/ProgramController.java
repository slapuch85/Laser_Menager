package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.History;
import pl.coderslab.entity.Program;
import pl.coderslab.entity.User;
import pl.coderslab.service.HistoryService;
import pl.coderslab.service.ProgramService;
import pl.coderslab.service.UserService;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;

@Controller
@Transactional
public class ProgramController {

    private final ProgramService programService;
    private final UserService userService;
    private final HistoryService historyService;

    @Autowired
    public ProgramController(ProgramService programService, UserService userService, HistoryService historyService) {
        this.programService = programService;
        this.userService = userService;
        this.historyService = historyService;
    }

    @GetMapping("/allProgramList")
    public String showProgramList(Model model) {
        model.addAttribute("program", new Program());
        return "displayAllPrograms";
    }

    @PostMapping("/addProgram")
    public String saveProgram(@ModelAttribute @Valid Program program, BindingResult result) {
        if (result.hasErrors()) {
            return "displayAllPrograms";
        }
        programService.saveProgram(program);
        return "redirect:allProgramList";
    }

    @PostMapping("/program/remove")
    public String removeProgram(@RequestParam(name = "programId") Long programId,
                                @RequestParam(name = "userId") Long userId){
        Program program = programService.findProgramById(programId);
        User user = userService.findById(userId);
        historyService.addToHistory(new History(user.getEmail(), program.getTitle()));
        programService.deleteProgram(program);
        return "redirect:/allProgramList";
    }



    @PostMapping("/program/edit")
    public String editProgram(@RequestParam(name="id") Long id, Model model){
        Program programToEdit = programService.findProgramById(id);
        model.addAttribute("programToEdit", programToEdit );
        model.addAttribute("idEditedProgram", id);
        return "editProgram";
    }

    @PostMapping("/program/merge")
    public String mergeProgram(@ModelAttribute @Valid Program program, Long id, BindingResult result){
        if(result.hasErrors()){
            return "editProgram";
        }
        System.out.println(id+" "+program.getComment());
        programService.editProgram(id, program);
        return "redirect:/allProgramList";
    }

    @ModelAttribute("allPrograms")
    public List<Program> allPrograms() {
        return programService.allProgramList();
    }


}
