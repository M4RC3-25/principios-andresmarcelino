package com.tweeter.backend.controllers;

import com.tweeter.backend.models.Comentario;
import com.tweeter.backend.repository.ComentarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/comentarios")
@CrossOrigin(origins = "*")
public class ComentarioController {

    @Autowired
    private ComentarioRepository repo;

    // GET /comentarios/{tweetId}
    @GetMapping("/{tweetId}")
    public List<Comentario> getByTweet(@PathVariable Long tweetId) {
        return repo.findByTweetId(tweetId);
    }

    // POST /comentarios
    @PostMapping
    public Comentario crear(@RequestBody Comentario c) {
        return repo.save(c);
    }

    // DELETE /comentarios/{id}?autor=xxx
    @DeleteMapping("/{id}")
    public ResponseEntity<?> borrar(@PathVariable Long id, @RequestParam String autor) {
        Optional<Comentario> c = repo.findById(id);
        if (c.isEmpty()) return ResponseEntity.notFound().build();
        if (!c.get().getAutor().equals(autor)) {
            return ResponseEntity.status(403).body(Map.of("error", "No puedes borrar este comentario"));
        }
        repo.deleteById(id);
        return ResponseEntity.ok(Map.of("mensaje", "Comentario eliminado"));
    }
}
