import 'package:OnigiriHardcore/themes/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/view/pages/animes&hq_page.dart';
import 'app/view/pages/home_page.dart';
import 'app/view/pages/intro_loading_page.dart';
import 'app/view/pages/noticias_page.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});
  static const appTitle = 'Onigiri Hardcore';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppTheme theme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: App.appTitle,
      debugShowCheckedModeBanner: false,
      theme: theme.darkTheme,
      darkTheme: theme.darkTheme,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const IntroLoadingPage(),
        '/home': (context) => const HomePage(),
        '/noticias': (context) => const NoticiasPage(),
        '/animes': (context) => const AnimesAndHQsPage(),
      },
    );
  }
}
