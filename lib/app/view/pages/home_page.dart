import 'package:OnigiriHardcore/app/controller/connectivity_controller.dart';
import 'package:OnigiriHardcore/app/view/pages/loading_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: firebaseService.getAllSnapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const ErrorPage();
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const LoadingPage();
                  }
                  if (snapshot.hasData) {
                    return FirestorePagination(
                        query: firebaseService.query(),
                        limit: 10,
                        viewType: ViewType.list,
                        onEmpty: const Center(
                          child: Text('Cart is empty'),
                        ),
                        bottomLoader: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Colors.lightBlue,
                          ),
                        ),
                        itemBuilder: (context, documentSnapshot, index) {
                          final data =
                              documentSnapshot.data() as Map<String, dynamic>;
                          return CardHomeWidget(
                            imageURL: data['imageUrl'],
                            title: data['title'],
                            categories: data['categories'],
                            date: data['lessDate'],
                            author: data['author'],
                            bodyPost: data['bodyPost'],
                            detailDate: data['moreDate'],
                            slug: data['slug'],
                          );
                        });
                  } else if (!snapshot.hasData) {
                    return const Center(
                      child: Text("SEM DADOS"),
                    );
                  } else {
                    return const LoadingPage();
                  }
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
