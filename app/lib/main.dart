import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_tab.dart';
import 'stat_tab.dart';
import 'profile_tab.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'api-marketaux',
      theme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildBody(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: HomeTab.title,
            icon: HomeTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: StatTab.title,
            icon: StatTab.iosIcon,
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
              defaultTitle: StatTab.title,
              builder: (context) => const StatTab(),
            );

          case 2:
            return CupertinoTabView(
              defaultTitle: ProfileTab.title,
              builder: (context) => const ProfileTab(),
            );

          // todo: Cleanup this default statement
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
    return _buildBody(context);
  }
}
