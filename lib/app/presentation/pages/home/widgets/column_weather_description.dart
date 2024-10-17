import 'package:flutter/material.dart';
import 'package:outcode/app/domain/models/weather_model.dart';
import 'package:outcode/app/presentation/widgets/gap.dart';

Widget columnWeatherDescription(
        WeatherModel? currentWeather, BuildContext context) =>
    Column(
      children: [
        gap(height: 124.0),
        Text(currentWeather == null ? '❓' : currentWeather.icon,
            style: const TextStyle(fontSize: 64.0)),
        Text(
          currentWeather?.location.name ?? '',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w200,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          currentWeather != null
              ? '${currentWeather.temperature} °C'
              : 'Try searching a city',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          currentWeather?.weatherCondition ?? '',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w200,
              ),
        ),
        Text(
          currentWeather?.description ?? '',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w200,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
