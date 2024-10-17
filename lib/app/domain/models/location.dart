import 'package:equatable/equatable.dart';

class Location extends Equatable {
  const Location({
    this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  final String? name;
  final String country;
  final double latitude;
  final double longitude;

  @override
  List<Object?> get props => [name, country];

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'],
        country: json['country'],
        latitude: json['lat'],
        longitude: json['lon'],
      );
}
