import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// This class represents a news card shown in the home page
class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.url,
  });
  final String title;
  final String description;
  final String image;
  final String url;

  Widget _buildBody(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(
            image: NetworkImage(image),
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
          TextButton(
            onPressed: _launchUrl,
            child: const Text("Read article"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
