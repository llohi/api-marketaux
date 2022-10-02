import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard(
      {super.key,
      required this.title,
      required this.description,
      required this.imageURL});
  final String title;
  final String description;
  final String imageURL;

  Widget _buildBody(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image(
            image: NetworkImage(imageURL),
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
