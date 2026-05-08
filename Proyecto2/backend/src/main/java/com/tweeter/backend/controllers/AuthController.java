package com.tweeter.backend.controllers;

import com.tweeter.backend.models.Usuario;
import com.tweeter.backend.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired
    private UsuarioRepository repo;

    // POST /auth/register
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody Usuario u) {
        if (repo.findByUsername(u.getUsername()).isPresent()) {
            return ResponseEntity.badRequest().body(Map.of("error", "El usuario ya existe"));
        }
        repo.save(u);
        return ResponseEntity.ok(Map.of("mensaje", "Usuario creado correctamente"));
    }

    // POST /auth/login
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody Usuario u) {
        Optional<Usuario> encontrado = repo.findByUsername(u.getUsername());
        if (encontrado.isEmpty() || !encontrado.get().getPassword().equals(u.getPassword())) {
            return ResponseEntity.status(401).body(Map.of("error", "Credenciales incorrectas"));
        }
        return ResponseEntity.ok(Map.of(
            "mensaje", "Login exitoso",
            "username", encontrado.get().getUsername(),
            "id", encontrado.get().getId()
        ));
    }
}
