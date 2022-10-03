import 'package:app/news_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This class represents the saved tab, which shows the articles the user has saved.
class SavedTab extends StatelessWidget {
  static const title = "Saved";
  static const iosIcon = Icon(CupertinoIcons.download_circle);

  static const sampleArticles = [
    {
      'title':
          'Tyler Reddick Leads NASCAR Reactions as His Future Boss Denny Hamlin Drinks Chase Elliott’s Victory Champagne From Pocono',
      'description':
          'Denny Hamlin went from sailing on top of the skies to crashing down directly on the seabed within hours after the NASCAR Cup Series race at Pocono. The Joe Gibbs Racing driver, despite taking the checkered flag, despite taking the trophy and champagne home from the victory lane, wasn&#8217;t the actual winner. This was because&#8230;The post Tyler Reddick Leads NASCAR Reactions as His Future Boss Denny Hamlin Drinks Chase Elliott’s Victory Champagne From Pocono appeared first on EssentiallySports.',
      'image':
          'https://image-cdn.essentiallysports.com/wp-content/uploads/GettyImages-1343066270-473x315.jpg',
      'url':
          'https://www.essentiallysports.com/nascar-news-tyler-reddick-leads-nascar-reactions-as-his-future-boss-denny-hamlin-drinks-chase-elliotts-victory-champagne-from-pocono/'
    },
  ];

  const SavedTab({super.key});

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: sampleArticles.length,
        itemBuilder: (context, index) => NewsCard(
          title: sampleArticles[index]['title'] as String,
          description: sampleArticles[index]['description'] as String,
          image: sampleArticles[index]['image'] as String,
          url: sampleArticles[index]['url'] as String,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildBody(context),
    );
  }
}
