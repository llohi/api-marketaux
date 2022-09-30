import 'package:flutter/cupertino.dart';

class HomeTab extends StatelessWidget {
  static const title = "Home";
  static const iosIcon = Icon(CupertinoIcons.home);

  const HomeTab({super.key});

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
