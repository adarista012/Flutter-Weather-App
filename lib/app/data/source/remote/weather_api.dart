import 'package:get/get.dart';
import 'package:outcode/app/domain/models/location.dart';
import 'package:outcode/app/domain/models/weather_model.dart';

class WeatherApi extends GetConnect {
  final String baseURL;
  final String apiKey;

  WeatherApi(
      {super.userAgent,
      super.timeout,
      super.followRedirects,
      super.maxRedirects,
      super.sendUserAgent,
      super.maxAuthRetries,
      super.allowAutoSignedCert,
      super.withCredentials,
      required this.baseURL,
      required this.apiKey});

  Future<WeatherModel?> getWeather(Location location) async {
    final url =
        '$baseURL/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey';

    try {
      final response = await get(url);

      if (response.statusCode == 200 && response.body != null) {
        return WeatherModel.fromJson(response.body, location);
      }
    } catch (e, s) {
      Get.snackbar(e.toString(), s.toString());
    }

    return null;
  }

  Future<Location?> searchLocation(String cityName) async {
    final url = '$baseURL/geo/1.0/direct?q=$cityName&limit=1&appid=$apiKey';

    try {
      final Response response = await get(url);

      if (response.statusCode == 200 && response.body != null) {
        return Location.fromJson(response.body[0]);
      }
    } catch (e, s) {
      Get.snackbar(e.toString(), s.toString());
    }

    return null;
  }
}
