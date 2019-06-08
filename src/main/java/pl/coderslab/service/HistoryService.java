package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.entity.History;
import pl.coderslab.repository.HistoryRepository;

import java.util.List;

@Service
public class HistoryService {

    private final HistoryRepository historyRepository;

    @Autowired
    public HistoryService(HistoryRepository historyRepository) {
        this.historyRepository = historyRepository;
    }

    public void addToHistory(History history){
        historyRepository.save(history);
    }

    public List<History> lastDeleted(){
        return historyRepository.lastTen();
    }
}
