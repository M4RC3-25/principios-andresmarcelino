import 'dart:convert';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://plantapp-api.onrender.com';

Future<Map<String, dynamic>> login(String username, String password) async {
  final response = await http.post(Uri.parse('$baseUrl/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}));
  return jsonDecode(response.body);
}

Future<Map<String, dynamic>> register(String username, String password) async {
  final response = await http.post(Uri.parse('$baseUrl/auth/register'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}));
  return jsonDecode(response.body);
}

Future<List<dynamic>> getTweets() async {
  final response = await http.get(Uri.parse('$baseUrl/tweets'));
  if (response.statusCode == 200) return jsonDecode(response.body);
  throw Exception('Error al cargar');
}

Future<void> createTweet(Map<String, dynamic> data) async {
  await http.post(Uri.parse('$baseUrl/tweets'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(data));
}

Future<void> deleteTweet(int id, String autor) async {
  await http.delete(Uri.parse('$baseUrl/tweets/$id?autor=$autor'));
}

Future<List<dynamic>> getReacciones(int tweetId) async {
  final response = await http.get(Uri.parse('$baseUrl/reacciones/$tweetId'));
  if (response.statusCode == 200) return jsonDecode(response.body);
  return [];
}

Future<void> reaccionar(int tweetId, String autor, String tipo) async {
  await http.post(Uri.parse('$baseUrl/reacciones'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'tweetId': tweetId, 'autor': autor, 'tipo': tipo}));
}

Future<List<dynamic>> getComentarios(int tweetId) async {
  final response = await http.get(Uri.parse('$baseUrl/comentarios/$tweetId'));
  if (response.statusCode == 200) return jsonDecode(response.body);
  return [];
}

Future<void> crearComentario(int tweetId, String autor, String contenido) async {
  await http.post(Uri.parse('$baseUrl/comentarios'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'tweetId': tweetId, 'autor': autor, 'contenido': contenido}));
}

Future<void> borrarComentario(int id, String autor) async {
  await http.delete(Uri.parse('$baseUrl/comentarios/$id?autor=$autor'));
}
