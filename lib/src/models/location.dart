class Location {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  Location({this.id, this.name, this.latitude, this.longitude});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
    if (id != null) {
      map['_id'] = id;
    }
    return map;
  }

  Location.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        latitude = json['latitude'],
        longitude = json['longitude'];
}
