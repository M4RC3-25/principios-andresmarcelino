import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'document_detail_screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedCategory = 0;

  final List<String> _categories = [
    'Todos', 'Libros', 'Audiolibros', 'Revistas', 'Documentos', 'Podcasts'
  ];

  final List<Map<String, String>> _documents = [
    {'title': 'Cien Años de Soledad', 'author': 'Gabriel García Márquez', 'type': 'Libro', 'pages': '432'},
    {'title': 'National Geographic', 'author': 'Edición Mayo 2024', 'type': 'Revista', 'pages': '120'},
    {'title': 'El Arte de la Guerra', 'author': 'Sun Tzu', 'type': 'Libro', 'pages': '68'},
    {'title': 'Inteligencia Artificial', 'author': 'Stuart Russell', 'type': 'Documento', 'pages': '89'},
    {'title': 'Breve Historia del Tiempo', 'author': 'Stephen Hawking', 'type': 'Audiolibro', 'pages': '212'},
    {'title': 'The New Yorker', 'author': 'Edición Junio 2024', 'type': 'Revista', 'pages': '96'},
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: Text('Explorar', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: _categories.length,
                itemBuilder: (ctx, i) => GestureDetector(
                  onTap: () => setState(() => _selectedCategory = i),
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: _selectedCategory == i ? const Color(0xFF1565C0) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _categories[i],
                      style: TextStyle(
                        color: _selectedCategory == i ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (ctx, i) {
                final doc = _documents[i];
                return GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DocumentDetailScreen(title: doc['title']!, author: doc['author']!))),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.primaries[i % Colors.primaries.length].withOpacity(0.2),
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                            child: Center(
                              child: Icon(
                                doc['type'] == 'Audiolibro' ? Icons.headphones : Icons.menu_book,
                                size: 40,
                                color: Colors.primaries[i % Colors.primaries.length],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(doc['title']!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 12)),
                              Text(doc['author']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 4),
                              Text('${doc['pages']} págs',
                                  style: GoogleFonts.lato(fontSize: 10, color: Colors.blue)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: _documents.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
          ),
        ),
      ],
    );
  }
}
