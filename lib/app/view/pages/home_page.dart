import 'dart:async';

import 'package:OnigiriHardcore/app/view/pages/loading_page.dart';
import 'package:OnigiriHardcore/app/view/widgets/card_widget.dart';
import 'package:OnigiriHardcore/app/view/widgets/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/posts_service.dart';
import 'error_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostsService firebaseService = PostsService();

  late ConnectivityResult result;

  late StreamSubscription subscription;

  var isConnected = false;

  @override
  void initState() {
    super.initState();
    startStreaming();
  }

  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
                title: const Text('Sem internet!'),
                content: const Text('Confira sua conexão com a internet'),
                actions: [
                  CupertinoButton.filled(
                    child: const Text('Tente novamente'),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet();
                    },
                  )
                ]));
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onigiri Hardcore'), centerTitle: true),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
            stream: firebaseService.getAllSnapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                        .map((doc) => CardWidget(
                              imageURL: doc['imageUrl'],
                              title: doc['title'],
                              description: doc['description'],
                              categories: doc['categories'],
                              date: doc['lessDate'],
                              author: doc['author'],
                            ))
                        .toList());
              } else if (snapshot.hasError) {
                return const ErrorPage();
              } else {
                return const LoadingPage();
              }
            }),
      ),
    );
  }
}
