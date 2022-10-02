import 'dart:convert';

import 'package:app/news_article.dart';
import 'package:app/news_card.dart';
import 'package:app/server_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeTab extends StatefulWidget {
  static const title = "Home";
  static const iosIcon = Icon(CupertinoIcons.home);

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  var dummyData = [
    {
      "title":
          "Tesla Hosted Its Second A.I. Day. This Time, a Robot Really Danced.",
      "description":
          "Tesla provided investors with updates about its autonomous driving efforts and a labor-saving humanoid robot on Friday. Investors have other concerns.",
      "imageURL": "https://images.barrons.com/im-634613/social"
    },
    {
      "title":
          "Sawtooth Solutions LLC Increases Position in Stryker Co. (NYSE:SYK)",
      "description":
          "Read Sawtooth Solutions LLC Increases Position in Stryker Co. (NYSE:SYK) at ETF Daily News",
      "imageURL":
          "https://www.americanbankingnews.com/wp-content/timthumb/timthumb.php?src=https://www.marketbeat.com/logos/stryker-logo.png&w=240&h=240&zc=2"
    },
    {
      "title":
          "Money Concepts Capital Corp Sells 33,456 Shares of Innovator S&P 500 Ultra Buffer ETF – September (NYSEARCA:USEP)",
      "description":
          "Read Money Concepts Capital Corp Sells 33,456 Shares of Innovator S&P 500 Ultra Buffer ETF – September (NYSEARCA:USEP) at ETF Daily News",
      "imageURL":
          "https://www.americanbankingnews.com/wp-content/timthumb/timthumb.php?src=https://www.marketbeat.com/logos/generic-stocks8.jpg&w=240&h=240&zc=2"
    },
  ];

  late Future<Response> apiResponse;

  @override
  void initState() {
    super.initState();
    apiResponse = ServerRequest().fetchData();
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder<Response>(
      future: apiResponse,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.data.length,
            itemBuilder: (context, index) => NewsCard(
              title: snapshot.data!.data[index]['title'],
              description: snapshot.data!.data[index]['description'],
              imageURL: snapshot.data!.data[index]['image_url'],
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return const NewsCard(
            title: "Error",
            description: "The api request failed for some reason",
            imageURL: "https://images.barrons.com/im-634613/social",
          );
        }
        return const CircularProgressIndicator();
      }),
    );
    /*
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) => NewsCard(
          title: dummyData[index]["title"] as String,
          description: dummyData[index]["description"] as String,
          imageURL: dummyData[index]["imageURL"] as String),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: _buildBody(context),
    );
  }
}
