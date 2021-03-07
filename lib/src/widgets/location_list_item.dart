import 'package:flutter/material.dart';
import '../models/location.dart';

class LocationListItem extends StatelessWidget {
  final Location location;
  LocationListItem(this.location);

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: const EdgeInsets.all(10.0),
      color: Colors.white,
      child: ListTile(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.explore),
        ),
        title: Text(
          location.name,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.edit),
        ),
      ),
    );
  }
}
