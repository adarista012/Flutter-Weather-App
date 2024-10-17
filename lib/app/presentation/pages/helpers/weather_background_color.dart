import 'package:flutter/material.dart';

Color weatherBackgroundColor(String weatherCondition) {
  switch (weatherCondition.toUpperCase()) {
    case 'CLOUDS':
      return Colors.blueGrey;
    case 'THUNDERSTORM':
    case 'RAIN':
      return Colors.indigoAccent;
    case 'SNOW':
      return Colors.lightBlueAccent;
    case 'CLEAR':
      return Colors.yellow;
    case 'DRIZZLE':
    case 'MIST':
      return Colors.blue;
    case 'TORNADO':
      return Colors.greenAccent;
    default:
      return Colors.cyan;
  }
}
