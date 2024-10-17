// ignore_for_file: constant_identifier_names, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:outcode/app/presentation/pages/home/home_page.dart';

abstract class Routes {
  static const HOME = '/';
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.HOME: (_) => const HomePage(),
};
