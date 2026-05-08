package com.tweeter.backend.repository;

import com.tweeter.backend.models.Tweet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TweetRepository extends JpaRepository<Tweet, Long> {
    // No necesitas escribir nada aquí
    // JpaRepository ya te da: findAll(), save(), deleteById(), etc.
}
