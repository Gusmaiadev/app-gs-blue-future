package com.fiap.blueFuture.services;

import com.fiap.blueFuture.DTO.FeedbackDTO;
import com.fiap.blueFuture.DTO.ReporteDTO;
import com.fiap.blueFuture.model.Feedback;
import com.fiap.blueFuture.model.Reporte;
import com.fiap.blueFuture.repositories.FeedbackRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class FeedbackService {

    @Autowired
    private FeedbackRepository feedbackRepository;

    @Transactional
    public FeedbackDTO insert(FeedbackDTO feedbackDTO, Reporte reporte) {
        Feedback feedback = new Feedback(feedbackDTO);
        feedback.setData(LocalDateTime.now());
        feedback.setReporte(reporte);
        feedback = feedbackRepository.save(feedback);
        return new FeedbackDTO(feedback);
    }

}
