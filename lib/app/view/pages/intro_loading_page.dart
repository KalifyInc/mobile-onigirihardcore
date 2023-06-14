import 'package:OnigiriHardcore/app/view/pages/splash_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../config/firebase_options.dart';
import 'error_page.dart';

class IntroLoadingPage extends StatefulWidget {
  const IntroLoadingPage({super.key});

  @override
  State<IntroLoadingPage> createState() => _IntroLoadingPageState();
}

class _IntroLoadingPageState extends State<IntroLoadingPage> {
  final Future<FirebaseApp> _inicializacao = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _inicializacao,
      builder: (context, app) {
        if (app.connectionState == ConnectionState.done) {
          return const SplashPage();
        }

        if (app.hasError) {
          return const ErrorPage();
        }

        return const SplashPage();
      },
    );
  }
}
