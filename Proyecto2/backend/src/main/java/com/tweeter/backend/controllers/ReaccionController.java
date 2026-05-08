package com.tweeter.backend.controllers;

import com.tweeter.backend.models.Reaccion;
import com.tweeter.backend.repository.ReaccionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/reacciones")
@CrossOrigin(origins = "*")
public class ReaccionController {

    @Autowired
    private ReaccionRepository repo;

    // GET /reacciones/{tweetId} → todas las reacciones de un tweet
    @GetMapping("/{tweetId}")
    public List<Reaccion> getByTweet(@PathVariable Long tweetId) {
        return repo.findByTweetId(tweetId);
    }

    // POST /reacciones → reaccionar (si ya reaccionó, cambia o quita)
    @PostMapping
    public ResponseEntity<?> reaccionar(@RequestBody Reaccion r) {
        Optional<Reaccion> existente = repo.findByTweetIdAndAutor(r.getTweetId(), r.getAutor());
        if (existente.isPresent()) {
            Reaccion re = existente.get();
            if (re.getTipo().equals(r.getTipo())) {
                // misma reacción → quitar
                repo.delete(re);
                return ResponseEntity.ok(Map.of("accion", "eliminada"));
            } else {
                // diferente → cambiar
                re.setTipo(r.getTipo());
                repo.save(re);
                return ResponseEntity.ok(Map.of("accion", "cambiada", "tipo", re.getTipo()));
            }
        }
        repo.save(r);
        return ResponseEntity.ok(Map.of("accion", "agregada", "tipo", r.getTipo()));
    }
}
