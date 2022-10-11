import 'package:app/news_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// This class represents the saved tab, which shows the articles the user has saved.
class SavedTab extends StatelessWidget {
  static const title = "Saved";
  static const iosIcon = Icon(CupertinoIcons.download_circle);

  const SavedTab({super.key});

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("articles").snapshots(),
      builder: ((context, snapshot) {
        if (snapshot.data == null) {
          return const Text("False");
        } else {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) => NewsCard(
                title: snapshot.data!.docs[index]['title'] as String,
                description:
                    snapshot.data!.docs[index]['description'] as String,
                image: snapshot.data!.docs[index]['image'] as String,
                url: snapshot.data!.docs[index]['url'] as String,
              ),
            ),
          );
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: _buildBody(context),
    );
  }
}
