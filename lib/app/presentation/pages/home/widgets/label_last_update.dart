import 'package:flutter/material.dart';
import 'package:outcode/app/domain/models/weather_model.dart';

Widget labelLastUpdate(WeatherModel? currentWeather, BuildContext context) =>
    Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentWeather != null
                  ? 'Last update: ${currentWeather.lastUpdated.toString()}'
                  : '',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w200,
                  ),
            ),
          ],
        ),
      ),
    );
