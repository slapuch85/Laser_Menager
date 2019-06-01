package pl.coderslab.repository;

import org.springframework.stereotype.Repository;
import pl.coderslab.entity.Program;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Repository
@Transactional
public class ProgramRepositoryImpl implements ProgramRepoCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void editProgram(Long id, Program program){
        program.setId(id);
        program.setCreated();
        entityManager.merge(program);
    }
}
