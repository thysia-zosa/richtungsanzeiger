import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

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
            onPressed: () {},
            icon: Icon(Icons.add),
            tooltip: "Neuen Ort hinzufügen",
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Card(
              margin: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.explore),
                ),
                title: Text(
                  'Matterhorn',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.explore),
                ),
                title: Text(
                  'Bundeshaus',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
