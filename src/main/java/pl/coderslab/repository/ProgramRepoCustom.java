package pl.coderslab.repository;

import pl.coderslab.entity.Program;

public interface ProgramRepoCustom {

    void editProgram(Long id, Program program);
}
