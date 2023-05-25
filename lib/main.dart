import 'package:OnigiriHardcore/themes/app_theme.dart';
import 'package:flutter/material.dart';

import 'app/view/home_page.dart';

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
      home: HomePage(title: appTitle),
    );
  }
}

