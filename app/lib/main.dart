import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            label: "Title",
            icon: Icon(CupertinoIcons.check_mark),
          ),
          BottomNavigationBarItem(
            label: "Title",
            icon: Icon(CupertinoIcons.check_mark),
          ),
          BottomNavigationBarItem(
            label: "Title",
            icon: Icon(CupertinoIcons.check_mark),
          ),
        ],
      ),
      // TODO : add create tabs
      tabBuilder: ((context, index) {
        switch (index) {
          case 0:
            return const CupertinoTabView(
              defaultTitle: "First",
            );

          case 1:
            return const CupertinoTabView(
              defaultTitle: "Second",
            );

          case 2:
            return const CupertinoTabView(
              defaultTitle: "Third",
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
