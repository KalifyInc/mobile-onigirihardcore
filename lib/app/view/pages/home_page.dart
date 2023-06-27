import 'package:OnigiriHardcore/app/view/pages/loading_page.dart';
import 'package:OnigiriHardcore/app/view/widgets/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../controller/connectivity_controller.dart';
import '../../service/posts_service.dart';
import '../widgets/card_home_widget.dart';
import 'error_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostsService firebaseService = PostsService();
  var connectivityController = ConnectivityController();

  @override
  void initState() {
    super.initState();
    connectivityController.startStreaming(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onigiri Hardcore'), centerTitle: true),
      drawer: const DrawerWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: firebaseService.getFirstsSnapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const ErrorPage();
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingPage();
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("SEM DADOS"),
                  );
                }
                if (snapshot.hasData) {
                  final List<DocumentSnapshot> documents = snapshot.data!.docs;
                  return ListView(
                      children: documents
                          .map((doc) => CardHomeWidget(
                                imageURL: doc['imageUrl'],
                                title: doc['title'],
                                categories: doc['categories'],
                                date: doc['lessDate'],
                                author: doc['author'],
                                bodyPost: doc['bodyPost'],
                                detailDate: doc['moreDate'],
                                slug: doc['slug'],
                              ))
                          .toList());
                } else if (snapshot.hasError) {
                  return const ErrorPage();
                } else {
                  return const LoadingPage();
                }
              }),
        ),
      ),
    );
  }
}
