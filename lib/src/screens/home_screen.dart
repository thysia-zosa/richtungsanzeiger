import 'package:flutter/material.dart';
import 'package:richtungsanzeiger/src/models/location.dart';
import 'package:richtungsanzeiger/src/screens/edit_location_screen.dart';
import 'package:richtungsanzeiger/src/widgets/location_list.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meine Orte'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                EditLocationScreen.routeName,
                arguments: Location(name: "", latitude: 0, longitude: 0),
              );
            },
            icon: Icon(Icons.add),
            tooltip: "Neuen Ort hinzufügen",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: LocationList(),
      ),
    );
  }
}
