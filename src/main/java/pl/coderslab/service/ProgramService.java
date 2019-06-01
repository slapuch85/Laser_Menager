package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.coderslab.entity.Program;
import pl.coderslab.repository.ProgramRepository;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;

@Service
@Transactional
public class ProgramService {

    private final ProgramRepository programRepository;

    @Autowired
    public ProgramService(ProgramRepository programRepository) {
        this.programRepository = programRepository;
    }

    public void saveProgram(Program program) {
        programRepository.save(program);
    }

    public void deleteProgram(Program program) {
        programRepository.delete(program.getId());
    }

    public void editProgram(Long id, Program program){
            programRepository.editProgram(id, program);
        }


    public List<Program> allProgramList() {
        return programRepository.findAll();
    }

    public Program findProgramById(Long id){
        return programRepository.findById(id);
    }
}

