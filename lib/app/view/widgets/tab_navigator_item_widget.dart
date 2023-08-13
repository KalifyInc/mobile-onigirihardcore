import 'package:flutter/material.dart';

import '../pages/information_app_page.dart';
import '../pages/home_page.dart';

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
          page: const InformationAppPage(),
          icon: const Icon(Icons.info_outline),
        ),
      ];
}
