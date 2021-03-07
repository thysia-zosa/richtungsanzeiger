import 'package:flutter/material.dart';

import 'src/screens/home_screen.dart';

void main() {
  runApp(Richtungsanzeiger());
}

class Richtungsanzeiger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Richtungsanzeiger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
