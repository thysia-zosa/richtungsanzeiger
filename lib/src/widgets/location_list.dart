import 'package:flutter/material.dart';
import '../helpers/database_actions.dart';

import '../models/location.dart';
import 'location_list_item.dart';

class LocationList extends StatefulWidget {
  @override
  _LocationListState createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  final DatabaseActions _dbActions = DatabaseActions();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Location>>(
      future: _dbActions.queryAllRows(),
      initialData: [],
      builder: (context, snapshot) => snapshot.hasData
          ? ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) => snapshot.data != []
                  ? Dismissible(
                      child: LocationListItem(snapshot.data![index]),
                      key: ValueKey(snapshot.data![index]),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                      ),
                      onDismissed: (DismissDirection dismissDirection) =>
                          setState(() {
                        _dbActions.delete(snapshot.data![index]);
                      }),
                    )
                  : Center(
                      child: Text('Keine Orte verfügbar'),
                    ),
            )
          : Center(
              child: Text('$snapshot'),
            ),
    );
  }
}
