import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outcode/app/presentation/pages/home/home_controller.dart';
import 'package:outcode/app/presentation/pages/home/widgets/weather_background.dart';
import 'package:outcode/app/presentation/widgets/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              const WeatherBackground(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    gap(height: 72),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                          visible: controller.width != 0,
                          child: const Expanded(
                            child: CupertinoTextField(
                              placeholder: "Location",
                            ),
                          ),
                        ),
                        gap(width: 8.0),
                        MaterialButton(
                          onPressed: controller.changeTheme,
                          shape: controller.width == 0
                              ? const CircleBorder()
                              : const StadiumBorder(),
                          padding: EdgeInsets.zero,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          color: Theme.of(context).colorScheme.onInverseSurface,
                          child: controller.width == 0
                              ? Icon(
                                  Icons.search,
                                  color: Theme.of(context).colorScheme.primary,
                                )
                              : Text(
                                  'Search',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    RefreshIndicator(
                      onRefresh: controller.onRefresh,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        clipBehavior: Clip.none,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            gap(height: 88.0),
                            const Text('🌧️', style: TextStyle(fontSize: 64.0)),
                            Text(
                              'location',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.w200,
                                  ),
                            ),
                            Text(
                              'Temp',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
