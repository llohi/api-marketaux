import 'package:flutter/cupertino.dart';

class ProfileTab extends StatelessWidget {
  static const title = "Profile";
  static const iosIcon = Icon(CupertinoIcons.person);

  const ProfileTab({super.key});

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
