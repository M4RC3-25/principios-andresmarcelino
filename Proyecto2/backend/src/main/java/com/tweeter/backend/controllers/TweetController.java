package com.tweeter.backend.controllers;

import com.tweeter.backend.models.Tweet;
import com.tweeter.backend.repository.TweetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/tweets")
@CrossOrigin(origins = "*")
public class TweetController {

    @Autowired
    private TweetRepository repo;

    @GetMapping
    public List<Tweet> getAll() {
        return repo.findAll();
    }

    @PostMapping
    public Tweet create(@RequestBody Tweet t) {
        if (t.getReacciones() == null) t.setReacciones(0);
        return repo.save(t);
    }

    // POST /tweets/{id}/reaccionar
    @PostMapping("/{id}/reaccionar")
    public ResponseEntity<?> reaccionar(@PathVariable Long id) {
        Optional<Tweet> tweet = repo.findById(id);
        if (tweet.isEmpty()) return ResponseEntity.notFound().build();
        Tweet t = tweet.get();
        t.setReacciones(t.getReacciones() + 1);
        repo.save(t);
        return ResponseEntity.ok(Map.of("reacciones", t.getReacciones()));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id, @RequestParam String autor) {
        Optional<Tweet> tweet = repo.findById(id);
        if (tweet.isEmpty()) return ResponseEntity.notFound().build();
        if (!tweet.get().getAutor().equals(autor)) {
            return ResponseEntity.status(403).body(Map.of("error", "No puedes borrar tweets de otros"));
        }
        repo.deleteById(id);
        return ResponseEntity.ok(Map.of("mensaje", "Eliminado correctamente"));
    }
}
