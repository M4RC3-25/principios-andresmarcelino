import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/tweet.dart';
import '../models/tweet_response.dart';

// Singleton service for managing REST API calls to the tweets endpoint
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

  // ✅ GET tweets
  Future<List<Tweet>> fetchTweets() async {
    try {
      final response = await _httpClient.get(
        Uri.parse('$baseUrl/tweets')
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        final tweetResponse = TweetResponse.fromJson(jsonData);
        return tweetResponse.content;
      } else {
        throw Exception('Failed to load tweets. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching tweets: $e');
    }
  }

  // ✅ POST tweet
  Future<void> createTweet(String content) async {
    try {
      final response = await _httpClient.post(
        Uri.parse('$baseUrl/tweets'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"tweet": content}),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to create tweet. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating tweet: $e');
    }
  }

  // ✅ DELETE tweet
  Future<void> deleteTweet(int id) async {
    try {
      final response = await _httpClient.delete(
        Uri.parse('$baseUrl/tweets/$id'),
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete tweet. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting tweet: $e');
    }
  }

  // Cleanup
  void dispose() {
    _httpClient.close();
  }
}
