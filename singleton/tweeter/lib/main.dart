import 'package:flutter/material.dart';
import 'services/tweet_service.dart';
import 'models/tweet.dart';
import 'models/tweet_response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tweeter - Singleton Pattern',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tweeter - REST API Integration'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late TweetService _tweetService;
  late Future<TweetResponse> _tweetsFuture;

  @override
  void initState() {
    super.initState();
    _tweetService = TweetService();
    _tweetsFuture = _tweetService.fetchTweets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        elevation: 2,
      ),
      body: FutureBuilder<TweetResponse>(
        future: _tweetsFuture,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 64,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),

                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _tweetsFuture = _tweetService.fetchTweets();
                      });
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          else if (!snapshot.hasData || snapshot.data!.tweets.isEmpty) {
            return const Center(
              child: Text('No tweets available'),
            );
          }

          else {

            final List<Tweet> tweets = snapshot.data!.tweets;

            return ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (context, index) {

                final tweet = tweets[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          tweet.tweet,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),

                        const SizedBox(height: 12),

                        Text(
                          'ID: ${tweet.id}',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),

                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _tweetsFuture = _tweetService.fetchTweets();
          });
        },
        tooltip: 'Refresh',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
