import 'tweet.dart';

class TweetResponse {

  final List<Tweet> tweets;

  TweetResponse({required this.tweets});

  factory TweetResponse.fromJson(Map<String, dynamic> json) {

    var list = json['tweets'] as List;

    List<Tweet> tweetsList =
    list.map((i) => Tweet.fromJson(i)).toList();

    return TweetResponse(
      tweets: tweetsList,
    );
  }
}
