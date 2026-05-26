import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav_bar.dart';
import 'explore_screen.dart';
import 'profile_screen.dart';
import 'document_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> _featuredBooks = [
    {'title': 'Atomic Habits', 'author': 'James Clear', 'category': 'Autoayuda', 'color': '0xFF1565C0'},
    {'title': 'Dune', 'author': 'Frank Herbert', 'category': 'Ciencia Ficción', 'color': '0xFFB8860B'},
    {'title': 'El Poder del Ahora', 'author': 'Eckhart Tolle', 'category': 'Espiritualidad', 'color': '0xFF2E7D32'},
    {'title': 'Sapiens', 'author': 'Yuval Noah Harari', 'category': 'Historia', 'color': '0xFF6A1B9A'},
  ];

  final List<Map<String, String>> _trending = [
    {'title': 'Clean Code', 'author': 'Robert C. Martin', 'type': 'Libro'},
    {'title': 'The Design of Everyday Things', 'author': 'Don Norman', 'type': 'Libro'},
    {'title': 'Deep Work', 'author': 'Cal Newport', 'type': 'Audiolibro'},
    {'title': 'Zero to One', 'author': 'Peter Thiel', 'type': 'Libro'},
    {'title': 'Thinking Fast and Slow', 'author': 'Daniel Kahneman', 'type': 'Audiolibro'},
  ];

  @override
  Widget build(BuildContext context) {
    Widget body;
    switch (_currentIndex) {
      case 1:
        body = const ExploreScreen();
        break;
      case 3:
        body = const ProfileScreen();
        break;
      default:
        body = _buildHome();
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: ScribdBottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }

  Widget _buildHome() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          title: Text(
            'scribd',
            style: GoogleFonts.playfairDisplay(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1565C0),
            ),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome banner
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1565C0), Color(0xFF0D47A1)],
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('¡Bienvenido de vuelta!',
                          style: GoogleFonts.lato(color: Colors.white70, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text('¿Qué leerás hoy?',
                          style: GoogleFonts.playfairDisplay(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF1565C0),
                        ),
                        child: const Text('Explorar catálogo'),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Featured
                Text('Destacados', style: GoogleFonts.playfairDisplay(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _featuredBooks.length,
                    itemBuilder: (ctx, i) {
                      final book = _featuredBooks[i];
                      return GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => DocumentDetailScreen(title: book['title']!, author: book['author']!))),
                        child: Container(
                          width: 130,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: Color(int.parse(book['color']!)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.menu_book, color: Colors.white54, size: 32),
                              const Spacer(),
                              Text(book['title']!,
                                  style: GoogleFonts.lato(
                                      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                              Text(book['author']!,
                                  style: GoogleFonts.lato(color: Colors.white70, fontSize: 11)),
                              const SizedBox(height: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(book['category']!,
                                    style: GoogleFonts.lato(color: Colors.white, fontSize: 10)),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 28),

                // Trending
                Text('Tendencias', style: GoogleFonts.playfairDisplay(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                ..._trending.asMap().entries.map((entry) {
                  final i = entry.key;
                  final item = entry.value;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFF1565C0).withOpacity(0.1),
                      child: Text('${i + 1}',
                          style: const TextStyle(color: Color(0xFF1565C0), fontWeight: FontWeight.bold)),
                    ),
                    title: Text(item['title']!, style: GoogleFonts.lato(fontWeight: FontWeight.w600)),
                    subtitle: Text(item['author']!, style: GoogleFonts.lato(fontSize: 12, color: Colors.grey)),
                    trailing: Chip(
                      label: Text(item['type']!, style: const TextStyle(fontSize: 11)),
                      backgroundColor: const Color(0xFF1565C0).withOpacity(0.1),
                    ),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DocumentDetailScreen(title: item['title']!, author: item['author']!))),
                  );
                }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
