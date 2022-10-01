import 'package:flutter/cupertino.dart';

class StatTab extends StatelessWidget {
  static const title = "Saved Articles";
  static const iosIcon = Icon(CupertinoIcons.download_circle);

  const StatTab({super.key});

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
