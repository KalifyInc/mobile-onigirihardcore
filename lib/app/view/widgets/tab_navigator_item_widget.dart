import 'package:OnigiriHardcore/app/view/pages/movies_page.dart';
import 'package:flutter/material.dart';

import '../pages/animes&hq_page.dart';
import '../pages/games_page.dart';
import '../pages/information_app_page.dart';
import '../pages/home_page.dart';
import '../pages/technologies_page.dart';

class TabNavigationItem {
  final Widget page;
  final Widget? title;
  final Icon icon;

  TabNavigationItem({required this.page, this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const HomePage(),
          icon: const Icon(Icons.home),
        ),
        TabNavigationItem(
          page: const AnimesAndHQsPage(),
          icon: const Icon(Icons.auto_stories_rounded),
        ),
        TabNavigationItem(
          page: const MoviesPage(),
          icon: const Icon(Icons.local_movies),
        ),
        TabNavigationItem(
          page: const GamesPage(),
          icon: const Icon(Icons.games),
        ),
        TabNavigationItem(
          page: const TechnologiesPage(),
          icon: const Icon(Icons.smart_toy),
        ),
        TabNavigationItem(
          page: const InformationAppPage(),
          icon: const Icon(Icons.info_outline),
        ),
      ];
}
