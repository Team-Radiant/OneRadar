import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Home"),
      ),
      child: Center(
        child: Text(
          "Welcome to OneRadar",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}