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
  Widget _buildBody(BuildContext context) {
    return ListView(
      children: const [
        NewsCard(
          title: "Title 1",
          description:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          imageURL:
              "https://www.americanbankingnews.com/wp-content/timthumb/timthumb.php?src=https://www.marketbeat.com/logos/microsoft-corporation-logo.png&w=240&h=240&zc=2",
        ),
        NewsCard(
          title: "Title 2",
          description:
              "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
          imageURL:
              "https://www.americanbankingnews.com/wp-content/timthumb/timthumb.php?src=https://www.marketbeat.com/logos/amazoncom-inc-logo.jpg&w=240&h=240&zc=2",
        ),
        NewsCard(
          title: "Title 3",
          description:
              "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          imageURL:
              "https://cdn.benzinga.com/files/imagecache/og_image_social_share_1200x630/images/story/2012/investing.jpg",
        ),
      ],
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
