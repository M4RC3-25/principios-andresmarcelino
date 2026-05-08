package com.tweeter.backend.models;

import jakarta.persistence.*;

@Entity
@Table(name = "tweets")
public class Tweet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;
    private String imagenUrl;
    private String descripcion;
    private String ataque;
    private String biografia;
    private Double precio;
    private String recarga;
    private String autor;
    private Integer reacciones = 0;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getImagenUrl() { return imagenUrl; }
    public void setImagenUrl(String imagenUrl) { this.imagenUrl = imagenUrl; }

    public String getDescripcion() { return descripcion; }
    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public String getAtaque() { return ataque; }
    public void setAtaque(String ataque) { this.ataque = ataque; }

    public String getBiografia() { return biografia; }
    public void setBiografia(String biografia) { this.biografia = biografia; }

    public Double getPrecio() { return precio; }
    public void setPrecio(Double precio) { this.precio = precio; }

    public String getRecarga() { return recarga; }
    public void setRecarga(String recarga) { this.recarga = recarga; }

    public String getAutor() { return autor; }
    public void setAutor(String autor) { this.autor = autor; }

    public Integer getReacciones() { return reacciones; }
    public void setReacciones(Integer reacciones) { this.reacciones = reacciones; }
}
