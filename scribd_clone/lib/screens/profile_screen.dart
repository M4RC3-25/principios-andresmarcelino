import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Mi Perfil', style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold)),
          actions: [
            IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {}),
          ],
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Avatar
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF1565C0),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text('Usuario Demo',
                    style: GoogleFonts.playfairDisplay(fontSize: 22, fontWeight: FontWeight.bold)),
                Text('usuario@email.com',
                    style: GoogleFonts.lato(color: Colors.grey, fontSize: 14)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1565C0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Scribd Premium',
                      style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 24),
                // Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _statItem('12', 'Libros leídos'),
                    _statItem('5', 'Guardados'),
                    _statItem('3', 'Reseñas'),
                  ],
                ),
                const SizedBox(height: 28),
                const Divider(),
                // Menu items
                ...[
                  {'icon': Icons.library_books_outlined, 'label': 'Mi Biblioteca'},
                  {'icon': Icons.history, 'label': 'Historial de lectura'},
                  {'icon': Icons.download_outlined, 'label': 'Descargas'},
                  {'icon': Icons.notifications_outlined, 'label': 'Notificaciones'},
                  {'icon': Icons.help_outline, 'label': 'Ayuda'},
                ].map((item) => ListTile(
                      leading: Icon(item['icon'] as IconData, color: const Color(0xFF1565C0)),
                      title: Text(item['label'] as String, style: GoogleFonts.lato()),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    )),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: Text('Cerrar sesión',
                      style: GoogleFonts.lato(color: Colors.red, fontWeight: FontWeight.w600)),
                  onTap: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (_) => false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _statItem(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: GoogleFonts.playfairDisplay(fontSize: 24, fontWeight: FontWeight.bold, color: const Color(0xFF1565C0))),
        Text(label, style: GoogleFonts.lato(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
