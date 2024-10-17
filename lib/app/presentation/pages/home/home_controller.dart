import 'package:get/get.dart';
import 'package:outcode/app/app_controller.dart';
import 'package:outcode/app/domain/models/location.dart';
import 'package:outcode/app/domain/models/weather_model.dart';
import 'package:outcode/app/domain/repositories/weather_api_repository.dart';
import 'package:outcode/app/presentation/pages/helpers/weather_background_color.dart';

class HomeController extends GetxController {
  double width = 0;

  WeatherModel? _currentWeather;
  WeatherModel? get currentWeather => _currentWeather;

  final AppController _appControllerRepository;
  final WeatherApiRepository _weatherApiRepository;

  Location location = const Location(
    name: 'Lima',
    country: 'PE',
    latitude: -12.023014,
    longitude: -77.104188,
  );

  String? _cityToSearch;

  HomeController(
      {required AppController appControllerRepository,
      required WeatherApiRepository weatherApiRepository})
      : _appControllerRepository = appControllerRepository,
        _weatherApiRepository = weatherApiRepository {
    getWeather();
  }

  getWeather() async {
    final response = await _weatherApiRepository.getWeather(location);
    _currentWeather = response;
    setSeedColor(_currentWeather!.weatherCondition);
    update();
  }

  setSeedColor(String weatherCondition) {
    _appControllerRepository
        .setSeedColor(weatherBackgroundColor(weatherCondition));
  }

  Future<void> onRefresh() async {
    if (_currentWeather != null) {
      _currentWeather =
          await _weatherApiRepository.getWeather(_currentWeather!.location);
      setSeedColor(_currentWeather!.weatherCondition);
    }
  }

  void toogleSearcher() {
    width = width == 0 ? 240 : 0;

    update();
  }

  void searchLocation() async {
    if (_cityToSearch != null) {
      final newLocation =
          await _weatherApiRepository.searchlocation(_cityToSearch!);
      if (newLocation != null) {
        _currentWeather = await _weatherApiRepository.getWeather(newLocation);
        setSeedColor(_currentWeather!.weatherCondition);
      }
    }
    update();
  }

  void onChanged(String? str) {
    if (str != null && str.isNotEmpty) {
      _cityToSearch = str;
    } else {
      _cityToSearch = null;
    }
  }
}
