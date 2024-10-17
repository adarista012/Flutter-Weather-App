import 'package:get/get.dart';
import 'package:outcode/app/app_constants.dart';
import 'package:outcode/app/app_controller.dart';
import 'package:outcode/app/data/implementations/weather_api_repository_implementation.dart';
import 'package:outcode/app/data/source/remote/weather_api.dart';
import 'package:outcode/app/domain/repositories/weather_api_repository.dart';
import 'package:outcode/app/presentation/pages/home/home_controller.dart';

Future<void> injectDependencies() async {
  final appControllerRepository = Get.put(AppController());

  final weatherApi = Get.put(WeatherApi(
    baseURL: AppConstants.BASE_URL,
    apiKey: AppConstants.API_KEY,
  ));

  Get.lazyPut<WeatherApiRepository>(
      () => WeatherApiRepositoryImplementation(weatherApi: weatherApi));

  final weatherApiRepository = Get.find<WeatherApiRepository>();

  Get.lazyPut(
    () => HomeController(
        appControllerRepository: appControllerRepository,
        weatherApiRepository: weatherApiRepository),
  );
}
