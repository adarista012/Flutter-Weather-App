import 'package:outcode/app/domain/models/location.dart';
import 'package:outcode/app/domain/models/weather_model.dart';

abstract class WeatherApiRepository {
  Future<WeatherModel?> getWeather(Location location);
  Future<Location?> searchlocation(String cityName);
}
