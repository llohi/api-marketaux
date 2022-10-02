import 'package:app/news_card.dart';
import 'package:app/server_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  static const title = "Home";
  static const iosIcon = Icon(CupertinoIcons.home);

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<Response> apiResponse;

  @override
  void initState() {
    super.initState();
    apiResponse = ServerRequest().fetchData();
  }

  /// Build a ListView based on the response from the API.
  Widget _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: apiResponse,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<NewsCard> articles = [];

          // Sort out news articles without image covers
          for (int i = 0; i < snapshot.data!.data.length; i++) {
            Map entry = snapshot.data!.data[i];
            if (entry['image'] != null) {
              articles.add(NewsCard(
                title: entry['title'],
                description: entry['description'],
                image: entry['image'],
                url: entry['url'],
              ));
            }
          }
          // Build the ListView
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) => articles[index],
          );
        } else if (snapshot.hasError) {
          return const NewsCard(
            title: "Error",
            description: "The api request failed for some reason",
            image: "https://images.barrons.com/im-634613/social",
            url: "",
          );
        }
        return const CircularProgressIndicator();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      //navigationBar: const CupertinoNavigationBar(),
      child: _buildBody(context),
    );
  }
}
