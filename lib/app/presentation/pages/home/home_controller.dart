import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outcode/app/app_controller.dart';
import 'package:outcode/app/domain/models/location.dart';
import 'package:outcode/app/domain/repositories/weather_api_repository.dart';

class HomeController extends GetxController {
  String title = 'Outcode Weather';

  Color themeColor = Colors.amber;

  double width = 0;

  final AppController _appControllerRepository;
  final WeatherApiRepository _weatherApiRepository;

  HomeController(
      {required AppController appControllerRepository,
      required WeatherApiRepository weatherApiRepository})
      : _appControllerRepository = appControllerRepository,
        _weatherApiRepository = weatherApiRepository {
    _init();
  }

  _init() async {
    const Location location = Location(
        id: 0, name: 'Lima', latitude: -12.023014, longitude: -77.104188);
    final response = await _weatherApiRepository.getWeather(location);
    print(response?.statusCode);
    print(response?.body);
    searchLocation();
  }

  Future<void> onRefresh() async {
    if (_appControllerRepository.seedColor == Colors.red) {
      _appControllerRepository.setSeedColor(Colors.amber);
    } else {
      _appControllerRepository.setSeedColor(Colors.red);
    }
  }

  void changeTheme() {
    themeColor = themeColor == Colors.amber ? Colors.pink : Colors.amber;
    width = width == 0 ? 240 : 0;

    update();
  }

  void searchLocation() async {
    _weatherApiRepository.searchlocation('La paz');
  }
}
