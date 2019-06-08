package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.entity.History;

import java.util.List;

@Repository
public interface HistoryRepository extends JpaRepository<History, Long > {

    @Query(value = "SELECT * FROM History LIMIT 10", nativeQuery = true)
    List<History> lastTen();
}
