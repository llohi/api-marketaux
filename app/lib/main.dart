import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'home_tab.dart';
import 'saved_tab.dart';
import 'profile_tab.dart';

Future<void> main() async {
  runApp(const App());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
