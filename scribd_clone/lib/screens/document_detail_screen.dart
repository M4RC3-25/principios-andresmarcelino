import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentDetailScreen extends StatelessWidget {
  final String title;
  final String author;

  const DocumentDetailScreen({super.key, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Container(
                        width: 100, height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.menu_book, size: 60, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.playfairDisplay(fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(author, style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[600])),
                  const SizedBox(height: 12),
                  // Rating
                  Row(children: [
                    ...List.generate(5, (i) => Icon(Icons.star, color: Colors.amber[600], size: 20)),
                    const SizedBox(width: 8),
                    Text('4.8 (2,341 reseñas)',
                        style: GoogleFonts.lato(color: Colors.grey, fontSize: 13)),
                  ]),
                  const SizedBox(height: 20),
                  // Action buttons
                  Row(children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('¡Leyendo documento...')),
                        ),
                        icon: const Icon(Icons.menu_book),
                        label: const Text('Leer'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1565C0),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Guardado en tu biblioteca')),
                        ),
                        icon: const Icon(Icons.bookmark_outline),
                        label: const Text('Guardar'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 24),
                  Text('Acerca de este libro',
                      style: GoogleFonts.playfairDisplay(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                    'Este es un resumen de demostración. En la versión completa podrías leer el contenido completo de "$title" de $author. Scribd ofrece acceso ilimitado a millones de libros, audiolibros, revistas y documentos.',
                    style: GoogleFonts.lato(fontSize: 14, height: 1.7, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 24),
                  // Details chips
                  Wrap(
                    spacing: 8, runSpacing: 8,
                    children: ['432 páginas', 'Inglés', 'Publicado 2018', 'No ficción']
                        .map((tag) => Chip(
                              label: Text(tag, style: const TextStyle(fontSize: 12)),
                              backgroundColor: Colors.grey[100],
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


