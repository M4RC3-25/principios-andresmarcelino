package com.tweeter.backend.repository;

import com.tweeter.backend.models.Reaccion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface ReaccionRepository extends JpaRepository<Reaccion, Long> {
    List<Reaccion> findByTweetId(Long tweetId);
    Optional<Reaccion> findByTweetIdAndAutor(Long tweetId, String autor);
}
