import 'package:flutter/material.dart';
import 'package:richtungsanzeiger/src/screens/show_direction_screen.dart';

import 'src/screens/edit_location_screen.dart';
import 'src/screens/home_screen.dart';
import 'src/screens/pick_location_screen.dart';

class Richtungsanzeiger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Richtungsanzeiger',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        ShowDirectionScreen.route: (context) => ShowDirectionScreen(),
        EditLocationScreen.route: (context) => EditLocationScreen(),
        PickLocationScreen.route: (context) => PickLocationScreen(),
      },
    );
  }
}
