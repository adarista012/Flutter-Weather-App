import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outcode/app/app_controller.dart';
import 'package:outcode/app/app_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (controller) {
        return GetMaterialApp(
          navigatorKey: Get.key,
          navigatorObservers: [GetObserver()],
          routes: appRoutes,
          initialRoute: Routes.HOME,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: controller.seedColor,
            ),
          ),
        );
      },
    );
  }
}
