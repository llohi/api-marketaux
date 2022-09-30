import 'package:flutter/cupertino.dart';

class SavedTab extends StatelessWidget {
  static const title = "Saved Articles";
  static const iosIcon = Icon(CupertinoIcons.download_circle);

  const SavedTab({super.key});

  Widget _buildBody(BuildContext context) {
    return Column();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(),
      child: _buildBody(context),
    );
  }
}
