import 'package:OnigiriHardcore/app/controller/connectivity_controller.dart';
import 'package:OnigiriHardcore/app/view/pages/loading_page.dart';
import 'package:OnigiriHardcore/app/view/widgets/card_widget.dart';
import 'package:OnigiriHardcore/app/view/widgets/drawer_widget.dart';
import 'package:OnigiriHardcore/app/view/widgets/text_title_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_pagination/firebase_pagination.dart';
import 'package:flutter/material.dart';

import '../../service/posts_service.dart';
import 'error_page.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            child: Column(children: [
              TextTitleWidget(text: 'Filmes'),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: firebaseService.getAllMoviesSnapshots(),
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
                          query: firebaseService
                              .query()
                              .where('categories', isEqualTo: 'Movies'),
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
                            return CardWidget(
                              imageURL: data['imageUrl'],
                              title: data['title'],
                              categories: data['categories'],
                              date: data['lessDate'],
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
      ),
    );
  }
}