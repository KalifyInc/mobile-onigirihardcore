import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class IntroLoadingPage extends StatelessWidget {
  const IntroLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/logo-transp.jpg',
        width: 512,
        height: 512,
      ),
      backgroundColor: Colors.grey.shade100,
      showLoader: true,
      loaderColor: Colors.lightBlue,
      navigator: const HomePage(),
      durationInSeconds: 5,
    );
  }
}
