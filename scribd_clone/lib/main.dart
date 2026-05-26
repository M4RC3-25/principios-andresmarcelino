import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ScribdApp());
}

class ScribdApp extends StatelessWidget {
  const ScribdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scribd Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1565C0),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
