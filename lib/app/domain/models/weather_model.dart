import 'package:equatable/equatable.dart';
import 'package:outcode/app/domain/helpers/weather_icon.dart';
import 'package:outcode/app/domain/models/location.dart';

class WeatherModel extends Equatable {
  final int id;
  final String icon;
  final String description;
  final DateTime lastUpdated;
  final Location location;
  final double temperature;
  final String weatherCondition;

  const WeatherModel(
      {required this.id,
      required this.icon,
      required this.description,
      required this.lastUpdated,
      required this.location,
      required this.temperature,
      required this.weatherCondition});

  @override
  List<Object?> get props => [id, weatherCondition];

  factory WeatherModel.fromJson(Map<String, dynamic> json, Location location) =>
      WeatherModel(
          id: json['weather'][0]['id'],
          icon: weatherIcon(json['weather'][0]['main']),
          description: json['weather'][0]['description'],
          lastUpdated: DateTime.now(),
          location: location,
          temperature: json['main']['temp'],
          weatherCondition: json['weather'][0]['main']);
}
