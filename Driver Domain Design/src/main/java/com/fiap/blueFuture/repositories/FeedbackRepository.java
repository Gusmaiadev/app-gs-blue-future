package com.fiap.blueFuture.repositories;

import com.fiap.blueFuture.model.Feedback;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
}
