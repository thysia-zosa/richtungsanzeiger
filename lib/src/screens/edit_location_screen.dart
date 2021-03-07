import 'package:flutter/material.dart';
import 'package:richtungsanzeiger/src/helpers/database_actions.dart';
import 'package:richtungsanzeiger/src/models/location.dart';

class EditLocationScreen extends StatefulWidget {
  static String routeName = '/editLocation';
  final DatabaseActions _dbActions = DatabaseActions();
  @override
  _EditLocationScreenState createState() => _EditLocationScreenState();
}

class _EditLocationScreenState extends State<EditLocationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name;
  String _latitude;
  String _longitude;

  @override
  Widget build(BuildContext context) {
    final Location location = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ort bearbeiten'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(50.0),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  initialValue: location.name,
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Ortsname',
                  ),
                  onChanged: (newValue) => _name = newValue,
                ),
                TextFormField(
                  initialValue: location.latitude.toString(),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Breitengrad',
                  ),
                  onChanged: (newValue) => _latitude = newValue,
                ),
                TextFormField(
                  initialValue: location.longitude.toString(),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'Längengrad',
                  ),
                  onChanged: (newValue) => _longitude = newValue,
                ),
                ElevatedButton(
                  onPressed: () {
                    print(
                        "name: $_name, latitude: $_latitude, longitude: $_longitude");
                    Location newLocation = Location(
                        name: _name,
                        latitude: double.parse(_latitude),
                        longitude: double.parse(_longitude));
                    if (location.id != null) {
                      widget._dbActions.update(newLocation);
                    } else {
                      widget._dbActions.insert(newLocation);
                    }
                    Navigator.pop(context);
                  },
                  child: Text('Ort speichern'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
