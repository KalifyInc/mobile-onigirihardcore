import 'package:OnigiriHardcore/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'app/view/pages/animes&hq_page.dart';
import 'app/view/pages/home_page.dart';
import 'app/view/pages/noticias_page.dart';
import 'app/view/pages/csgo_tltv_news_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({super.key});

  static const appTitle = 'Onigiri Hardcore';
  AppTheme theme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: theme.darkTheme,
      darkTheme: theme.darkTheme,
      initialRoute: '/home',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => const HomePage(),
        '/noticias': (context) => const NoticiasPage(),
        '/animes': (context) => const AnimesAndHQsPage(),
        '/csgo': (context) => const CSGOHLTVNewsPage(),
      },
      home: const HomePage(),
    );
  }
}
