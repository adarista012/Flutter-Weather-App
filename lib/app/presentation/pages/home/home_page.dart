import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outcode/app/presentation/pages/home/home_controller.dart';
import 'package:outcode/app/presentation/pages/home/widgets/column_weather_description.dart';
import 'package:outcode/app/presentation/pages/home/widgets/header.dart';
import 'package:outcode/app/presentation/pages/home/widgets/label_last_update.dart';
import 'package:outcode/app/presentation/pages/home/widgets/weather_background.dart';
import 'package:outcode/app/presentation/widgets/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            body: Stack(
              children: [
                const WeatherBackground(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      gap(height: 64.0),
                      header(
                        controller.width,
                        controller.toogleSearcher,
                        controller.searchLocation,
                        controller.onChanged,
                        context,
                      ),
                      RefreshIndicator(
                        onRefresh: controller.onRefresh,
                        child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            clipBehavior: Clip.none,
                            child: columnWeatherDescription(
                                controller.currentWeather, context)),
                      ),
                    ],
                  ),
                ),
                labelLastUpdate(controller.currentWeather, context),
              ],
            ),
          ),
        );
      },
    );
  }
}
