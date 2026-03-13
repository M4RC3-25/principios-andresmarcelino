import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/tweet_response.dart';

class TweetService {

  static final TweetService _instance = TweetService._internal();

  final String baseUrl = 'http://localhost:8080/api';
  late http.Client _httpClient;

  TweetService._internal() {
    _httpClient = http.Client();
  }

  factory TweetService() {
    return _instance;
  }

  static TweetService getInstance() {
    return _instance;
  }

  Future<TweetResponse> fetchTweets() async {

    try {

      final response = await _httpClient.get(
        Uri.parse('$baseUrl/tweets'),
      );

      if (response.statusCode == 200) {

        final Map<String, dynamic> jsonData =
        jsonDecode(response.body);

        return TweetResponse.fromJson(jsonData);

      } else {

        throw Exception(
          'Failed to load tweets. Status code: ${response.statusCode}');
      }

    } catch (e) {

      throw Exception('Error fetching tweets: $e');

    }

  }

  void dispose() {
    _httpClient.close();
  }
}
