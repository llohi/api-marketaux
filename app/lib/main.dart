import 'package:app/profile_tab.dart';
import 'package:app/saved_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_tab.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'api-marketaux',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        return CupertinoTheme(
          data: const CupertinoThemeData(),
          child: Material(child: child),
        );
      },
      home: const HomePage(title: 'api-marketaux'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: HomeTab.title,
            icon: HomeTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: SavedTab.title,
            icon: SavedTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: ProfileTab.title,
            icon: ProfileTab.iosIcon,
          ),
        ],
      ),
      tabBuilder: ((context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              defaultTitle: HomeTab.title,
              builder: (context) => const HomeTab(),
            );

          case 1:
            return CupertinoTabView(
              defaultTitle: SavedTab.title,
              builder: (context) => const SavedTab(),
            );

          case 2:
            return CupertinoTabView(
              defaultTitle: ProfileTab.title,
              builder: (context) => const ProfileTab(),
            );

          default:
            return const CupertinoTabView(
              defaultTitle: "Default!! FIX THIS",
            );
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildIosHomePage(context);
  }
}
