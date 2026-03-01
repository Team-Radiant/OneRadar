import 'package:flutter/cupertino.dart';
import 'landing_page.dart';
import 'home_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;

    if (isLoggedIn) {
      return const HomePage();
    } else {
      return const LandingPage();
    }
  }
}