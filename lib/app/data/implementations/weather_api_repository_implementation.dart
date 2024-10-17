import 'package:outcode/app/data/source/remote/weather_api.dart';
import 'package:outcode/app/domain/models/location.dart';
import 'package:outcode/app/domain/models/weather_model.dart';
import 'package:outcode/app/domain/repositories/weather_api_repository.dart';

class WeatherApiRepositoryImplementation extends WeatherApiRepository {
  final WeatherApi _weatherApi;

  WeatherApiRepositoryImplementation({required WeatherApi weatherApi})
      : _weatherApi = weatherApi;

  @override
  Future<WeatherModel?> getWeather(Location location) =>
      _weatherApi.getWeather(location);

  @override
  Future<Location?> searchlocation(String cityName) =>
      _weatherApi.searchLocation(cityName);
}
