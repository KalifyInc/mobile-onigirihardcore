import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class AnimesAndHQsPage extends StatefulWidget {
  const AnimesAndHQsPage({super.key});

  @override
  State<AnimesAndHQsPage> createState() => _AnimesAndHQsPageState();
}

class _AnimesAndHQsPageState extends State<AnimesAndHQsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onigiri Hardcore'), centerTitle: true),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text('My Animes Page!'),
      ),
    );
  }
}
