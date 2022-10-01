import 'package:app/news_card.dart';
import 'package:flutter/cupertino.dart';

class HomeTab extends StatefulWidget {
  static const title = "Home";
  static const iosIcon = Icon(CupertinoIcons.home);

  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  static const dummyData = [
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

  Widget _buildBody(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) => NewsCard(
          title: dummyData[index]["title"] as String,
          description: dummyData[index]["description"] as String,
          imageURL: dummyData[index]["imageURL"] as String),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: _buildBody(context),
    );
  }
}
