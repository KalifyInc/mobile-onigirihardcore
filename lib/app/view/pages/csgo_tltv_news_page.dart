import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class CSGOHLTVNewsPage extends StatefulWidget {
  const CSGOHLTVNewsPage({super.key});

  @override
  State<CSGOHLTVNewsPage> createState() => _CSGOHLTVNewsPageState();
}

class _CSGOHLTVNewsPageState extends State<CSGOHLTVNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onigiri Hardcore'), centerTitle: true),
      drawer: const DrawerWidget(),
      body: const Center(
        child: Text('My CSGO Page!'),
      ),
    );
  }
}
