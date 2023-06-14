import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/logo-transp.jpg',
        width: 200,
        height: 200,
      ),
      backgroundColor: Colors.grey.shade100,
      showLoader: true,
      loaderColor: Colors.lightBlue,
      navigator: const HomePage(),
      durationInSeconds: 10,
    );
  }
}
